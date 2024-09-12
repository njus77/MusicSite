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
	
 		int bnum = Integer.parseInt(request.getParameter("b_num"));
		String btitle = request.getParameter("b_title");
		String bevaluation = request.getParameter("b_evaluation");
		String bauthor = request.getParameter("b_author");
		String bphone = request.getParameter("b_phone");
		String bpasswd = request.getParameter("b_passwd");
		String bcontent = request.getParameter("b_content");
			
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
					String query = "update board set b_title=?, b_evaluation=?, b_author=?, b_phone=?, b_content=? where b_num=?";
					pstm = conn.prepareStatement(query);
					pstm.setString(1, btitle);
					pstm.setString(2, bevaluation);
					pstm.setString(3, bauthor);
					pstm.setString(4, bphone);
					pstm.setString(5, bcontent);
					pstm.setInt(6, bnum);
					pstm.executeUpdate();
					out.println("<script>alert('수정이 완료되었습니다.');location.href='board_content.jsp?b_num="+bnum+"';</script>");
				
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