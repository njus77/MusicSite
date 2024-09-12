<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file= "/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Cart</title>
</head>
<body>
	<%

	request.setCharacterEncoding("UTF-8");
	
		
	String cNum = (String)session.getAttribute("cNum");
	String crproduct = request.getParameter("a_product");
	int crquantity = Integer.parseInt(request.getParameter("cr_quantity"));
	int crprice = Integer.parseInt(request.getParameter("a_price"));
	PreparedStatement pstm = null;
	
	try{
		
		String sql ="insert into cart(c_num, cr_product, cr_quantity, cr_price) values(?,?,?,?)";
		pstm = conn.prepareStatement(sql);
		pstm.setString(1, cNum);
		pstm.setString(2, crproduct);
		pstm.setInt(3, crquantity);
		pstm.setInt(4, crprice);
		pstm.executeUpdate();
		out.println("<script>alert('장바구니에 추가되었습니다.');location.href='cart_list.jsp?c_num="+cNum+"';</script>");	
		
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		
		
		if(pstm != null) pstm.close();
		if(conn != null) conn.close();
	}
%>

</body>
</html>