<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>
<link rel="stylesheet" href ="../resources/style/orders.css"/>
</head>
<body>
<div class="container">
	<%@ include file="/menu/header.jsp" %>
    <div class="session">
		<div class="cartArea">				
			<div class=cartTitle>02 결제정보 </div>       					
		        <table class="cartTable">
		        	<tr>      		
			            <th>상품정보</th>
			            <th>수량</th>
			            <th>상품금액</th>
			            <th>합계금액</th>		        		       			       
			       </tr>
	<%	
		request.setCharacterEncoding("UTF-8");	
		ResultSet rs = null;
		PreparedStatement pstm = null;
		
		try{	
			String sql= "select cr_product, cr_quantity, cr_price from cart where c_num=?";			
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, cNum);
			rs = pstm.executeQuery();
			
			int productprice = 0;
			int totalprice = 0;
			int sum =0;
			int delivery = 0;	
			
			while (rs.next()) {
				String rproduct = rs.getString("cr_product");			
				int rquantity = rs.getInt("cr_quantity");
				int rprice = rs.getInt("cr_price");
				int price = rquantity * rprice;
			
	%>				
				<form action="orders_write&delete.jsp" method="get" name="orders_info">					
						<input type="hidden" name="cr_product" value="<%=rproduct%>">
						<input type="hidden" name="cr_price" value="<%=rprice%>">
						<input type="hidden" name="cr_quantity" value="<%=rquantity%>">		
			        <tr>		        		 		          
			            <td><%=rproduct%></td>
			            <td><%=rquantity%></td>		        			                    			            
			            <td><b><fmt:formatNumber value='<%=rprice%>' type="number"/>원</b>
			            	</td>
			            <td><b><fmt:formatNumber value='<%=rprice * rquantity%>' type="number"/>원</b></td>	            
			       </tr>
			    	
			       											
			<%
				sum += rquantity;
				productprice = productprice + rprice; 
				totalprice = totalprice + rprice;
				
				if(totalprice >= 50000) delivery = 0;
				else delivery = 3000;
		
			}
				int sumPrice = totalprice + delivery;
			%>				       			      	
			    </table> <br>
			   
			    	<div class="orderSum">
			    		총 <%=sum %>개의 상품금액 <fmt:formatNumber value='<%=productprice%>' type="number"/>원
			    		+ 배송비 <fmt:formatNumber value='<%=delivery%>' type="number"/>원 〓 <fmt:formatNumber value='<%=sumPrice%>' type="number"/>원				
					</div><br><br>
			<%
				String query = "select * from customer where c_num=?";
				pstm = conn.prepareStatement(query);
				pstm.setString(1, cNum);
				rs = pstm.executeQuery();
				
				if(rs.next()) {	
					String cPhone = rs.getString("c_phone");
					String cEmail = rs.getString("c_email");
					String cEmail1 = cEmail.substring(0,cEmail.indexOf("@"));
					String cEmail2 = cEmail.substring(cEmail.lastIndexOf("@")+1);
			%>				    			    				      			      		         	 
			  		<div class="orderArea">
				        <h2 class="orderTitle">주문자 정보</h2><br>
				            <input type="hidden" name="c_num" value="<%=cNum%>">
				          <table class="orderText">					   					  
				            <tr>
				              <th>주문자명 </th>
				              <td><input type="text" name="c_Name" class="Writed" value='<%=rs.getString("c_name")%>' readonly="readonly" ></td>
				            </tr>
				            <tr>
				              <th>전화번호 </th>
				              <td>
				                <select name="c_Phone1" class="phoned1">			
				                <option value="010" <% if(cPhone.substring(0,3).equals("010")){%> selected<%}%> readonly="readonly">010</option>
				                </select> - <input type="text" name="c_Phone2" value='<%=cPhone.substring(4,12)%>' readonly="readonly" class="phoned2">
				              </td>
				            </tr>
				            <tr>
				              <th>이메일 </th>
				              <td>
				                <input type="text" name="c_Email1" class="emailed1" value='<%=cEmail1%>'  readonly="readonly">@
				                <select name="c_Email2" value="<%=cEmail2%>" class="emailed2">
				                    <option>선택하세요</option>		
				                    <option value="naver.com" <% if(cEmail2.equals("naver.com")){%> selected<%}%>>naver.com</option>
				                    <option value="daum.net" <% if(cEmail2.equals("daum.net")){%> selected<%}%>>hanmail.net</option>	
				                    <option value="daum.net" <% if(cEmail2.equals("daum.net")){%> selected<%}%>>daum.net</option>
				                    <option value="nate.com" <% if(cEmail2.equals("nate.com")){%> selected<%}%>>nate.com</option>
				                    <option value="gmail.com" <% if(cEmail2.equals("gmail.com")){%> selected<%}%>>gmail.com</option>
				              </select>
				            </td>
				            </tr>
				            <tr>
				              <th>우편번호 </th>
				              <td><input type="text" name="zipNo" class="Writed" value='<%=rs.getString("zipNo")%>' class="zip" readonly></td>
				            </tr>
				            <tr>
				              <th>주소 </th>
				              <td><input type="text" name="roadAddrPart1" class="Writed" value='<%=rs.getString("roadAddrPart1")%>' readonly></td>
				            </tr>
				            <tr>
				              <th>상세주소 </th>
				              <td> <input type="text" name="addrDetail" class="Writed" value='<%=rs.getString("addrDetail")%>' readonly></td>
				            </tr>
				            <tr>
				                <th>남기실 말씀 </th>
				                <td><textarea rows="5" cols="55" name="o_content" autofocus="autofocus"></textarea></td>			                
				            </tr>
				          </table>
				              <div class="lastPay">
				                  최종 결제 금액 <fmt:formatNumber value='<%=sumPrice%>' type="number"/>원
				              </div>
				                <div style="text-align: center; margin-left: 200px;">
				                <input type="submit" class="payBtn" value="결제하기">	
				                </div> 					      			
				    </div>		  	        	
			 	 </form>	  		
		</div>
	<%	
		}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(pstm != null) pstm.close();
			if(rs != null) rs.close();
			if(conn != null) conn.close();
		}
	%>			      			        			                     		        	   	   			   	
	 </div>
     <%@ include file="/menu/footer.jsp" %>    	
</div>
</body>
</html>