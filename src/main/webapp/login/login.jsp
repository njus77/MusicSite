<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href ="../resources/style/login.css"/>
<script>
	function loginCheck() {
		var form = document.login;
		
		if(form.c_Id.value==""){
			alert("아이디를 입력하세요");
			form.c_Id.value="";
			form.c_Id.focus();
			return false; 
		}
		
		if(form.c_Passwd.value==""){
			alert("비밀번호를 입력하세요");
			form.c_Passwd.value="";
			form.c_Passwd.focus();
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
			<div class="logArea">
			<form action="login_ok.jsp" method="post" name="login">		
				<h1 class="logTitle">로그인</h1>
				<div class="logBox">
					<table class="logTable">
						 <caption class="boxTitle">회원 로그인</caption>
						<tr>	
							<td><input type="text" name="c_Id" placeholder="아이디를 입력하세요." class="logWrite"></td>
							<td rowspan="2"><input type="button" value="로그인" class="logBtn" onclick="loginCheck()"></td>
						</tr>
						<tr>
							<td><input type="password" name="c_Passwd" placeholder="비밀번호를 입력하세요" class="logWrite"></td>
							<td></td>
						</tr> 
						<tr >
							<td>
								<input type="button" value="회원가입" class="regBtn"  onclick="location.href='../conf/agreement.jsp'">
	                            <input type="button" value="아이디 찾기"  class="regBtn" onclick="location.href='http://localhost:8080/MusicSite/login/find_id.jsp'">
								
							</td>
	                        <td>
	                            <input type="reset" value="취소"  class="regBtn">
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