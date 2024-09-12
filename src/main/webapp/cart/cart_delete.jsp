<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>

<% 
	request.setCharacterEncoding("UTF-8");
	int crnum = Integer.parseInt(request.getParameter("cr_num"));

	ResultSet rs = null;
	PreparedStatement pstm = null;

try{
	String query = "delete from cart where cr_num=?";
	pstm = conn.prepareStatement(query);
	pstm.setInt(1, crnum);
	pstm.executeUpdate();
	
	out.println("<script>alert('삭제가 완료되었습니다.');");
	out.println("location.href='cart_list.jsp'</script>");

} catch(Exception se) {
	se.printStackTrace();
} finally {
	if (rs != null) rs.close(); 	
	if (pstm != null) pstm.close(); 	
	if (conn != null) conn.close(); 		
}
%>