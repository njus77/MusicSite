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
		String btitle = request.getParameter("b_title");
		String bevaluation = request.getParameter("b_evaluation");
		String bauthor = request.getParameter("b_author");
		String bphone = request.getParameter("b_phone");
		String bpasswd = request.getParameter("b_passwd");
		String bcontent = request.getParameter("b_content");
		
		PreparedStatement pstm = null;
		try{
			
			String sql = "insert into board(c_num, b_title, b_evaluation, b_author, b_phone, b_passwd, b_content, b_date) values(?,?,?,?,?,?,?,sysdate())";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, cNum);
			pstm.setString(2, btitle);
			pstm.setString(3, bevaluation);
			pstm.setString(4, bauthor);
			pstm.setString(5, bphone);
			pstm.setString(6, bpasswd);
			pstm.setString(7, bcontent);		
			pstm.executeUpdate();
			
			out.println("<script>alert('게시물이 저장되었습니다.');location.href='http://localhost:8080/MusicSite/board/board_list.jsp'</script>");
			
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