<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 삭제</title>
<style>
	.delBtn {
			margin-top: 10px;
			background-color: black;
			border: 1px soild black;
			color: white;
			width: 90px;
			height: 40px;
			font-size: 10pt;
			text-align: center;	
		}
		.delBtn:hover{background: gray; color: black;}
</style>
</head>
<body>
	<%
		String nnum = request.getParameter("n_num");
	%>
	<form action="notice_delete_ok.jsp" name="board" method="post">
		<input type="hidden" name="n_num" value="<%=nnum %>">
		<p>*게시판 삭제를 위해 <b>비밀번호</b>를 입력하세요 </p> 
		<input type="password" name="n_passwd" placeholder="비밀번호를 입력해주세요." autofocus="">
		<input type="submit" value="삭제하기" class="delBtn">
		<input type="button" value="취소하기" class="delBtn" onclick="history.back()">
	</form>

</body>
</html>