<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders List</title>
<style>
	.orderListArea{
		margin: 30px 0px 120px 0px;
		width: 950px;	
	}
	.orderListTable {
		width: 950px;
		line-height: 40px;
		border: 1px solid black;
		border-collapse: collapse;
			
	}
	.orderListTable th{
		font-size: 18px;
    	background-color: rgb(173, 196, 188);		
	}
	
	.orderListTable td{
		font-size: 16px;
		text-align: center;
    	border-bottom: 1px dotted gray;		
	}
	.orderListSum {
		height: 150px;
		border: 2px solid rgb(115, 117, 117);
		text-align: right;
		padding: 10px;
		margin-top: 60px;
		padding-top: 50px;
		font-size: 20pt; 	
	}			
</style>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	ResultSet rs = null;
	PreparedStatement pstm = null;
%>
<div class="container">
	<%@ include file="../menu/header.jsp" %>
	<div class="session">
		<div class="orderListArea">
		<h3>주문조회</h3> <br>
		<table class="orderListTable">
			<tr>
				<th>주문일</th>
				<th>상품명</th>
				<th>가격</th>	
				<th>수량</th>				
			</tr>
<%
	try {
		
		String sql = "select o_date, o_product, o_price, o_quantity from orders where c_num=?";
		pstm = conn.prepareStatement(sql);
		pstm.setString(1, cNum);
		rs = pstm.executeQuery();
		
		int proPrice = 0;
		int totalPrice = 0;
		int sum =0;
		
		while(rs.next()){
			String date = rs.getString("o_date");
			String product = rs.getString("o_product");			
			int price = rs.getInt("o_price");	
			int quantity = rs.getInt("o_quantity");
			
			int rPrice = quantity * price;	
%>
			<tr>
				
				<td><%=date.substring(0, 10) %></td>
				<td><%=product %></td>
				<td><fmt:formatNumber value='<%=price%>' type="number"/>원</td>	
				<td><%=quantity %>개</td>		
			</tr>
	<%
			sum += quantity;
			proPrice = proPrice + price; 
			totalPrice = totalPrice + rPrice;
		}
		
	%>
		</table>
		<div class="orderListSum">
				총 <%=sum %>개의 상품금액 〓 <fmt:formatNumber value='<%=proPrice%>' type="number"/>원		   
		</div>
				
	<%
	
	}catch (Exception ex) {
		ex.printStackTrace();
	}
	finally {
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