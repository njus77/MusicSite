<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 저장</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String ntitle = request.getParameter("n_title");
		String ndate = request.getParameter("n_date");
		String nauthor = request.getParameter("n_author");	
		String npasswd = request.getParameter("n_passwd");
		String ncontent = request.getParameter("n_content");
		
		PreparedStatement pstm = null;
		try{
			
			String sql = "insert into notice(n_title, n_author, n_date, n_passwd, n_content) values(?,?,sysdate(),?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, ntitle);
			pstm.setString(2, nauthor);
			pstm.setString(3, npasswd);
			pstm.setString(4, ncontent);
			pstm.executeUpdate();
			
			out.println("<script>alert('게시물이 저장되었습니다.');location.href='http://localhost:8080/MusicSite/notice/notice_list.jsp'</script>");
			
		} catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(pstm != null) pstm.close();
			if(conn != null) conn.close();
		}
	%>

</body>
</html>