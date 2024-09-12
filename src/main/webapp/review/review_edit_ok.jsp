<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판정보수정</title>
</head>
<body>
	<%	
 		request.setCharacterEncoding("UTF-8");
	
 		int rnum = Integer.parseInt(request.getParameter("r_num"));
		String rtitle = request.getParameter("r_title");
		String rauthor = request.getParameter("r_author");
		String rstarPoint = request.getParameter("r_starPoint");
		String rcontent = request.getParameter("r_content");
			
		ResultSet rs = null;
		PreparedStatement pstm = null;
		
		try{
			
			String query = "update review set r_title=?, r_author=?, r_starPoint=?, r_content=? where r_num=?";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, rtitle);
			pstm.setString(2, rauthor);
			pstm.setString(3, rstarPoint);
			pstm.setString(4, rcontent);
			pstm.setInt(5, rnum);
			pstm.executeUpdate();
			out.println("<script>alert('수정이 완료되었습니다.');location.href='review_content.jsp?r_num="+rnum+"';</script>");
		
		} catch(Exception se) {
			se.printStackTrace();
		} finally {
			if (rs != null) rs.close(); 	
			if (pstm != null) pstm.close(); 	
			if (conn != null) conn.close(); 		
		}
	%>

</body>
</html>