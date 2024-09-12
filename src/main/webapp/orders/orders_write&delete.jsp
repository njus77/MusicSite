<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
			
	String cNum = (String)session.getAttribute("cNum");
	String[] oproduct = request.getParameterValues("cr_product");
	String[] oprice = request.getParameterValues("cr_price");
	String[] oquantity = request.getParameterValues("cr_quantity");
	String ocontent= request.getParameter("o_content");
	
	PreparedStatement pstm = null;
	
	try {	
		for(int i=0; i < oproduct.length; i++){	
			String sql = "insert into orders(c_num, o_date, o_product, o_price, o_quantity, o_content) values(?,sysdate(),?,?,?,?)"; 
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, cNum);			
			pstm.setString(2, oproduct[i]);
			pstm.setString(3, oprice[i]);
			pstm.setString(4, oquantity[i]);
			pstm.setString(5, ocontent);
			pstm.executeUpdate();
		}
		
		String query = "delete from cart";
		pstm = conn.prepareStatement(query);
		pstm.executeUpdate();
		out.println("<script>alert('결제가 완료되었습니다..');location.href='http://localhost:8080/MusicSite/index.jsp'</script>");
	} catch (SQLException ex) {
		ex.printStackTrace();
		
	} finally {
		if(pstm != null) pstm.close();
		if(conn != null) conn.close();
	}
%>