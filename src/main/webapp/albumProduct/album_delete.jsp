<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴처리</title>
</head>
<body>
 	<%	
 		request.setCharacterEncoding("UTF-8");
 		String anum = request.getParameter("a_num");
 		String aproductCode = request.getParameter("a_productCode");
 		
		ResultSet rs = null;
		PreparedStatement pstm = null;
		
		try{
			String query = "delete from albumProduct where a_num=?";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, anum);
			pstm.executeUpdate();
			out.println("<script>alert('삭제가 완료되었습니다.');location.href='http://localhost:8080/MusicSite/index.jsp'</script>");
					
		} catch(Exception se) {
			out.println("SQLException : " + se.getMessage());
		} finally {
			if (rs != null) rs.close(); 	
			if (pstm != null) pstm.close(); 	
			if (conn != null) conn.close(); 		
		}
	%>

</body>
</html>