<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>

<% 
	request.setCharacterEncoding("UTF-8");
	int crnum = Integer.parseInt(request.getParameter("cr_num"));
	int crquantity = Integer.parseInt(request.getParameter("cr_quantity"));
	

	PreparedStatement pstm = null;
	
	try{
		String query = "update cart set cr_quantity=? where cr_num=?";
		pstm = conn.prepareStatement(query);
		pstm.setInt(1, crquantity);
		pstm.setInt(2, crnum);
		pstm.executeUpdate();		
		out.println("<script>location.href='cart_list.jsp'</script>");			
		
	} catch(Exception se) {
		se.printStackTrace();
	} finally {	
		if (pstm != null) pstm.close(); 	
		if (conn != null) conn.close(); 		
	}
%>