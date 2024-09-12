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
	
 		int nnum = Integer.parseInt(request.getParameter("n_num"));
		String ntitle = request.getParameter("n_title");
		String nauthor = request.getParameter("n_author");
		String npasswd = request.getParameter("n_passwd");
		String ncontent = request.getParameter("n_content");
			
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
					String query = "update notice set n_title=?, n_author=?, n_content=? where n_num=?";
					pstm = conn.prepareStatement(query);
					pstm.setString(1, ntitle);
					pstm.setString(2, nauthor);
					pstm.setString(3, ncontent);
					pstm.setInt(4, nnum);
					pstm.executeUpdate();
					out.println("<script>alert('수정이 완료되었습니다.');location.href='notice_content.jsp?n_num="+nnum+"';</script>");
				
				} else {
					out.println("<script>alert('수정을 위한 비밀번호가 틀렸습니다.');history.back();</script>");
					
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