<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성</title>
<script src="js/regular.js"></script>
<style>
	.nwArea{
		float: left;
		margin: 30px;
		width: 720px;	
	}
	.nwTable{
		width: 700px;
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	.nwTable th {
		border: 1px dotted black;
     	padding: 10px;
	}
	.nwTable td {
		border: 1px dotted black;
     	padding: 10px;
	}
	.nwContent {
		border: 1px solid gray;
		width: 550px;
     	padding: 10px;
	}
	.nwBtn {
		margin-top: 10px;
		background-color: white;
		border: 1px dotted black;
		color: black;
		width: 90px;
		height: 40px;
		font-size: 10pt;
		text-align: center;	
	}
	.nwBtn:hover{background: gray; color: black;}
	.nwaBtn {
		text-align: center;
	}
</style>
<script>
	function check() {
		var form = document.notice;
		if(form.n_title.value==""){
			alert("제목을 입력하세요");
			form.n_title.focus();
			return false; 
		}
		
		if(form.n_author.value==""){
			alert("작성자 이름을 입력하세요");
			form.n_author.focus();
			return false; 
		}
		
		if(form.n_passwd.value==""){
			alert("비밀번호를 입력하세요");
			form.n_passwd.focus();
			return false; 
		}
		if(form.n_content.value==""){
			alert("본문 내용을 입력하세요");
			form.n_content.focus();
			return false; 
		}
		form.submit();
	}
</script>
</head>
<body>
<div class="container">
	<%@ include file="../menu/header.jsp" %>
		<div class="session">
		<%@ include file="../menu/cglist.jsp"%>
		<div class="nwArea">
			<h2>공지사항 작성</h2><br>	
			<form action="notice_write_ok.jsp" method="post" name="notice">
			<table class="nwTable">
				<tr>
					<th>제목 </th>
					<td><input type="text" name="n_title" class="nwContent"></td>
				</tr>
							
				<tr>
					<th>작성자 </th>
					<td><input type="text" name="n_author" class="nwContent"></td>
				</tr>
					
				<tr>
					<th>비밀번호 </th>
					<td><input type="password" name="n_passwd" class="nwContent"></td>
				</tr>
				
				<tr>
					<th>본문 </th>
					<td><textarea rows="20" cols="80" name="n_content"></textarea></td>
				</tr>
			</table>
				<div class="nwaBtn">		
					<input type="reset" value="이전"  onclick="history.back()" class="nwBtn">&nbsp;
					<input type="button" value="저장" onclick="check()" class="nwBtn">	
				</div>
			</form>
		</div>	
	</div>
	 <%@ include file="/menu/footer.jsp" %>
</div>
</body>
</html>