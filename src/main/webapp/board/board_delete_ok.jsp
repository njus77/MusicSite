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
 		int bnum = Integer.parseInt(request.getParameter("b_num"));
 		String bpasswd = request.getParameter("b_passwd");
 		
		ResultSet rs = null;
		PreparedStatement pstm = null;
		
		try{
			String sql= "select b_passwd from board where b_num =?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, bnum);
			rs = pstm.executeQuery();
			
			if (rs.next()) {		
				String rPasswd = rs.getString("b_passwd");
				if(bpasswd.equals(rPasswd)) {
					String query = "delete from board where b_num=?";
					pstm = conn.prepareStatement(query);
					pstm.setInt(1, bnum);
					pstm.executeUpdate();
					out.println("<script>alert('삭제가 완료되었습니다.');location.href='http://localhost:8080/MusicSite/board/board_list.jsp'</script>");
				
				} else {
					out.println("<script>alert('삭제를 위한 비밀번호가 틀렸습니다.');history.back();</script>");
					
				}
			}
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