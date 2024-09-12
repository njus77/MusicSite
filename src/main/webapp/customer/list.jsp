<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%@ include file="admin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body>
	<h2>회원 목록</h2>
	<%
		ResultSet rs = null;
		PreparedStatement pstm = null;
	%>
	<table border="1" width="1200">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>연락처</th>
			<th>전자우편</th>
			<th>우편번호</th>
			<th>주소</th>
			<th>가입일</th>
			<th>IP주소</th>
			<th>회원정보수정 / 회원탈퇴</th>
		</tr>
	<%
		String sql = "select * from member order by mnum desc";
		pstm = conn.prepareStatement(sql);
		rs = pstm.executeQuery();
		
		while (rs.next()) {	
	%>	
		<tr>
			<td><%= rs.getInt("mnum")%></td>
			<td><%= rs.getString("mid")%></td>
			<td><%= rs.getString("mname")%></td>
			<td><%= rs.getString("mtel")%></td>
			<td><%= rs.getString("memail")%></td>
			<td><%= rs.getString("zipNo")%></td>
			<td><%= rs.getString("roadAddPart1")%> <%= rs.getString("addrDetail")%></td>
			<td><%= rs.getString("mdate")%></td>
			<td><%= rs.getString("mip")%></td>	
			<td><a href="edit.jsp?mnum=<%=rs.getInt("mnum")%>">회원정보수정</a> /
				<a href="delete.jsp?mnum=<%=rs.getInt("mnum")%>">회원탈퇴</a></td>
		</tr>
	<%	
		}
	%>	
	</table><br>
	<a href="regist.jsp">회원가입</a>
	<%
		if(rs != null) rs.close();
		if(pstm != null) pstm.close();
		if(conn != null) conn.close();
	%>
</body>
</html>