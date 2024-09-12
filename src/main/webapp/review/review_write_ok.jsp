<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 문의</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String cNum = (String)session.getAttribute("cNum");
		String rtitle = request.getParameter("r_title");
		String rauthor = request.getParameter("r_author");
		String rstarPoint = request.getParameter("r_starPoint");
		String rcontent = request.getParameter("r_content");
		
		PreparedStatement pstm = null;
		try{
			
			String sql = "insert into review(c_num, r_title, r_author, r_starPoint, r_date, r_content) values(?,?,?,?,sysdate(),?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, cNum);
			pstm.setString(2, rtitle);
			pstm.setString(3, rauthor);
			pstm.setString(4, rstarPoint);
			pstm.setString(5, rcontent);		
			pstm.executeUpdate();
			
			out.println("<script>alert('게시물이 저장되었습니다.');location.href='http://localhost:8080/MusicSite/review/review_list.jsp'</script>");
			
		} catch(Exception ex) {
			ex.printStackTrace();
			out.println("<script>alert('게시물이 저장이 실패했습니다.');history.back()</script>" + "<br>");
		}finally {
			if(pstm != null) pstm.close();
			if(conn != null) conn.close();
		}
	%>

</body>
</html>