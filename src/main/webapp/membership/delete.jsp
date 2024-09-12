<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<style type="text/css">
	.btn {
		background-color: black;
		color: white;
		width: 70px;
		height: 40px;
		font-size: 10pt;		
	}
	.btn:hover{background: gray; color: black;}
</style>
</head>
<body>
	<%
		String cNum = request.getParameter("c_num");
	%>
	<h3>회원탈퇴</h3>
	<form action="delete_ok.jsp" name="member" method="post">
	<table>
		<tr>
			<td><input type="hidden" name="c_Num" value="<%=cNum%>"></td>
			<th>
			* 회원탈퇴를 위해 비밀번호를 입력하세요 : <input type="password" name="c_Passwd" placeholder="비밀번호 입력">
			</th>
		</tr>
		<tr>
			<td><input type="submit" value="회원탈퇴" class="btn"></td>
			<td><input type="button" value="취소" onclick="history.back()" class="btn"></td>
			<td></td>
		</tr>		
	</table>
	</form>

</body>
</html>