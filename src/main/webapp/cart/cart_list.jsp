<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href ="../resources/style/orders.css"/>
</head>
<body>
<div class="container">
	<%@ include file="/menu/header.jsp" %>
    <div class="session">
		<div class="cartArea">		
			<div class=cartTitle>01 장바구니 </div>	       	
		        <table class="cartTable">
		        	<tr>
		        		<th></th>	        		
			            <th>상품정보</th>
			            <th>수량</th>
			            <th>상품금액</th>
			            <th>합계금액</th>
			            <th>장바구니삭제</th>		       			       
			       </tr>
	<%	
		request.setCharacterEncoding("UTF-8");
		ResultSet rs = null;
		PreparedStatement pstm = null;
		
		try{
			String sql= "select cr_num, cr_product, cr_quantity, cr_price from cart where c_num=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, cNum);
			rs = pstm.executeQuery();
			
			int productprice = 0;
			int totalprice = 0;
			int sum =0;
			int delivery = 0;		

			while (rs.next()) {
				int crnum = rs.getInt("cr_num");
				String rproduct = rs.getString("cr_product");
				int rprice = rs.getInt("cr_price");
				int rquantity = rs.getInt("cr_quantity");
								
				int price = rquantity * rprice;		
	%>			
				<form action="http://localhost:8080/MusicSite/cart/cart_edit.jsp" method="get" name="cart">		
					<input type="hidden" name="cr_num" value="<%=crnum%>">			
			        <tr>		        		 		          
			            <td colspan="2"><%=rproduct%></td>
			            <td>			        
				            <input type="number" class="qty" name="cr_quantity" value="<%=rquantity%>" min="1" max="10">
				            <input type="submit" class="bt" value="수정">&nbsp;	            
			            </td>
			            <td><b><fmt:formatNumber value='<%=rprice%>' type="number"/>원</b></td>
			            <td><b><fmt:formatNumber value='<%=rprice * rquantity%>' type="number"/>원</b></td>
			            <td><input type="button" value="삭제" class="bt" onclick="location.href='cart_delete.jsp?cr_num=<%=crnum%>'"></td>
			            
			       </tr>
			     </form>
			<%
				sum += rquantity;
				productprice = productprice + price; 
				totalprice = totalprice + price;
				
				if(totalprice >= 50000) delivery = 0;
				else delivery = 3000;
			}
				int sumPrice = totalprice + delivery;
				
			%>
			        <tr>
			        	<td></td>
			            <td colspan="6" style="text-align: left;"><a href="http://localhost:8080/MusicSite/index.jsp">&lang;&lang; 쇼핑 계속하기 </a></td>
			       </tr>
			    </table><br>
			    	<div class="orderSum">
						총 <%=sum %>개의 상품금액 <fmt:formatNumber value='<%=productprice%>' type="number"/>원
			    		+ 배송비 <fmt:formatNumber value='<%=delivery%>' type="number"/>원 〓 <fmt:formatNumber value='<%=sumPrice%>' type="number"/>원	
					</div><br>			
				 		<div style="text-align: center;">
				        	<input type="button" value="상품 주문" class="orderBtn" onclick="location.href='../orders/orders_info.jsp?c_num=<%= cNum%>'">
				        </div>
				   										    				      			      		
	<%
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(pstm != null) pstm.close();
			if(rs != null) rs.close();
			if(conn != null) conn.close();
		}
	%>		        					 		  			        		 		  		
		</div>	      			        			                     		        	   	   			   	
	 </div>
     <%@ include file="/menu/footer.jsp" %> 	   	
</div>
</body>
</html>