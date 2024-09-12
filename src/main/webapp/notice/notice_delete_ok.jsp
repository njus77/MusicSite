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
 		int nnum = Integer.parseInt(request.getParameter("n_num"));
 		String npasswd = request.getParameter("n_passwd");
 		
		ResultSet rs = null;
		PreparedStatement pstm = null;
		
		try{
			String sql= "select n_passwd from notice where n_num =?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, nnum);
			rs = pstm.executeQuery();
			
			if (rs.next()) {		
				String rPasswd = rs.getString("n_passwd");
				if(npasswd.equals(rPasswd)) {
					String query = "delete from notice where n_num=?";
					pstm = conn.prepareStatement(query);
					pstm.setInt(1, nnum);
					pstm.executeUpdate();
					out.println("<script>alert('삭제가 완료되었습니다.');location.href='http://localhost:8080/MusicSite/notice/notice_list.jsp'</script>");
				
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