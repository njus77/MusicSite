<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<style>
	.regListArea{
		padding-top: 50px;
		margin-left: 250px;
	}
	.listTable {
		line-height: 50px;
		border: 1px solid #000000;
		border-collapse: collapse;	
		font-weight: 500;
		 font-size: 13pt;
	}
	.listTable th {
		border: 1px dotted black;
     	padding: 10px;
    }
    .listTable td {
		border: 1px dotted black;
     	padding: 10px;
    }
		
</style>
</head>
<body>
	<div class="regListArea" >
		<h2>회원 목록</h2>
		<%
			ResultSet rs = null;
			PreparedStatement pstm = null;
		%>
		<table class="listTable">
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>연락처</th>
				<th>전자우편</th>
				<th>우편번호</th>
				<th>주소</th>
				<th>가입일</th>
				<th>회원정보수정 / 회원탈퇴</th>
			</tr>
		<%
			String sql = "select * from customer order by c_num desc";
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			
			while (rs.next()) {	
		%>	
			<tr>
				<td><%= rs.getInt("c_num")%></td>
				<td><%= rs.getString("c_id")%></td>
				<td><%= rs.getString("c_name")%></td>
				<td><%= rs.getString("c_phone")%></td>
				<td><%= rs.getString("c_email")%></td>
				<td><%= rs.getString("zipNo")%></td>
				<td><%= rs.getString("roadAddrPart1")%> <%= rs.getString("addrDetail")%></td>
				<td><%= rs.getString("c_date")%></td>
				<td><a href="http://localhost:8080/MusicSite/membership/edit.jsp?c_num=<%=rs.getInt("c_num")%>">회원정보수정</a> /
					<a href="../membership/delete.jsp?c_num=<%=rs.getInt("c_num")%>">회원탈퇴</a></td>
			</tr>
		<%	
			}
		%>	
		</table><br>
</div>
	<%
		if(rs != null) rs.close();
		if(pstm != null) pstm.close();
		if(conn != null) conn.close();
	%>

</body>
</html>