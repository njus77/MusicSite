<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href ="../resources/style/login.css"/>
<script>
	function findCheck() {
		var form = document.findId;
		
		if(form.c_name.value==""){
			alert("이름 입력하세요");
			form.c_name.value="";
			form.c_name.focus();
			return false; 
		}
		
		if(form.c_email.value==""){
			alert("회원 이메일을 입력하세요");
			form.c_email.value="";
			form.c_email.focus();
			return false; 
		}
		form.submit();
	}
</script>
</head>
<body onload="form.c_name.focus()">
	<div class="container">
		<%@ include file="../menu/header.jsp" %>
			<div class="session">
			<div class="logArea">
			<form action="find_id_ok.jsp" method="post" name="findId">		
				<h1 class="logTitle">아이디찾기</h1>
				<div class="logBox">
					<table class="logTable">
						 <caption class="boxTitle">회원 아이디 찾기</caption>
						 
						<tr>	
							<td><input type="text" name="c_name" placeholder="이름" class="logWrite"></td>
							<td rowspan="2"><input type="button" value="아이디찾기" class="logBtn" onclick="findCheck()"></td>
						</tr>
						<tr>
							<td><input type="text" name="c_email" placeholder="회원 이메일" class="logWrite"></td>
							<td></td>
						</tr> 
						<tr >
							<td colspan="2" style="text-align: center;">
								<input type="button" value="비밀번호 찾기" class="regBtn" onclick="location.href='http://localhost:8080/MusicSite/login/find_passwd.jsp'">
	                            <input type="button" value="로그인하기"  class="regBtn" onclick="location.href='http://localhost:8080/MusicSite/login/login.jsp'">		
							</td>                       
						</tr>
					</table>	
				</div>		
			</form>	
		</div>	
	</div>	
	<%@ include file="../menu/footer.jsp" %>
</div>
</body>
</html>