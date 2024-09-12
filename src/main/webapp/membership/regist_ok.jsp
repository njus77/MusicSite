<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>regist</title>
</head>
<body>
	<%
		PreparedStatement pstm = null;
	
		request.setCharacterEncoding("UTF-8");
		
		String cId = request.getParameter("c_Id");
		String cPasswd = request.getParameter("c_Passwd");
		String cName = request.getParameter("c_Name");
		String cPhone1 = request.getParameter("c_Phone1");
		String cPhone2 = request.getParameter("c_Phone2");
		String cPhone = cPhone1 + "-" + cPhone2;
		String cEmail1 = request.getParameter("c_Email1");
		String cEmail2 = request.getParameter("c_Email2");
		String cEmail = cEmail1 + "@" + cEmail2;
		String zipNo = request.getParameter("zipNo");
		String roadAddrPart1 = request.getParameter("roadAddrPart1");
		String addrDetail = request.getParameter("addrDetail");
		
		try {
			String sql = "insert into customer(c_id, c_passwd, c_name, c_phone, c_email, zipNo, roadAddrPart1, addrDetail, c_date)"; 
			sql = sql + "values(?,?,?,?,?,?,?,?,sysdate())";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, cId);
			pstm.setString(2, cPasswd);
			pstm.setString(3, cName);
			pstm.setString(4, cPhone);
			pstm.setString(5, cEmail);
			pstm.setString(6, zipNo);
			pstm.setString(7, roadAddrPart1);
			pstm.setString(8, addrDetail);
			pstm.executeUpdate();
			out.println("<script>alert('회원가입을 축하드립니다.');location.href='../login/login.jsp'</script>");
			
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			if(pstm != null) pstm.close();
			if(conn != null) conn.close();
		}
	%>

</body>
</html>