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
 		String cNum = request.getParameter("c_Num");
 		String cPasswd = request.getParameter("c_Passwd");
 		
		ResultSet rs = null;
		PreparedStatement pstm = null;
		
		try{
			String sql1= "select c_passwd from customer where c_num =?";
			pstm = conn.prepareStatement(sql1);
			pstm.setString(1, cNum);
			rs = pstm.executeQuery();
			
			if (rs.next()) {		
				String rPasswd = rs.getString("c_passwd");
				if(cPasswd.equals(rPasswd)) {
					String sql2 = "delete from customer where c_num=?";
					pstm = conn.prepareStatement(sql2);
					pstm.setString(1, cNum);
					pstm.executeUpdate();
					out.println("<script>alert('회원탈퇴가 완료되었습니다.');location.href='http://localhost:8080/MusicSite/login/login.jsp'</script>");
					
				} else {
					out.println("<script>alert('회원탈퇴를 위한 비밀번호가 틀렸습니다.');history.back();</script>");
					
				}
			}
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