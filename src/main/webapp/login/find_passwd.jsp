<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href ="../resources/style/login.css"/>
<script>
	function findCheck() {
		var form = document.findPwd;
		
		if(form.c_id.value==""){
			alert("아이디를 입력하세요");
			form.c_id.value="";
			form.c_id.focus();
			return false; 
		}
		
		form.submit();
	}
</script>
<style>
	.findPasswdBtn {
		width: 100px;
        height: 50px;
        background-color: rgb(65, 63, 63);
        color: white;
        font-size: 18px;
        margin-top: 25px;
	}
    .findPasswdBtn:hover {
        background-color: black;
    }

</style>
</head>
<body onload="form.c_id.focus()">
	<div class="container">
		<%@ include file="../menu/header.jsp" %>
			<div class="session">
			<div class="logArea">
			<form action="find_passwd_ok.jsp" method="post" name="findPwd">		
				<h1 class="logTitle">비밀번호 찾기</h1>
				<div class="logBox">
					<table class="logTable">
						 <caption style="text-align: left; font-size: 16pt; border-bottom: 1px solid gray; margin-bottom: 30px; padding-bottom: 10px;">
						 	<b>아이디 입력</b><br> 
						 	<span style="font-size: 10pt; color: gray;">비밀번호를 찾고자 하는 아이디를 입력해주세요.</span> 
						 </caption>					 
						<tr>	
							<td><input type="text" name="c_id" placeholder="아이디 입력" class="logWrite"></td>						
						</tr>
						 <tr>
						 	<td style="text-align: center;"><input type="button" value="확인" class="findPasswdBtn" onclick="findCheck()"></td>
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