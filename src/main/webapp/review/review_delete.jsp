<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 삭제</title>
</head>
<body>
 	<%	
 		request.setCharacterEncoding("UTF-8");
 		int rnum = Integer.parseInt(request.getParameter("r_num"));
 		
		ResultSet rs = null;
		PreparedStatement pstm = null;
		
		try{
			String query = "delete from review where r_num=?";
			pstm = conn.prepareStatement(query);
			pstm.setInt(1, rnum);
			pstm.executeUpdate();
			out.println("<script>alert('삭제가 완료되었습니다.');location.href='http://localhost:8080/MusicSite/review/review_list.jsp'</script>");
			
					
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