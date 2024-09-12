<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src="js/regular.js"></script>
<link rel="stylesheet" href ="../resources/style/register.css"/>
</head>
<body>
<div class="container">
	<%@ include file="../menu/header.jsp" %>
		<div class="session">
			<h2 style="margin-top: 20px;">회원 가입</h2> <br>
			<div class="topTitle">
				<p>기본정보</p><br>
			</div>	
			<div class="regArea">
				
				<form name="customer" action="regist_ok.jsp" method="post">
				  <table class="regText">
				    <tr>
				      <th>아이디 : </th>
				      <td>
						<input type="text" name="c_Id" class="idWrite" readonly onclick="idCheck()"> 
				      	<input type="button" value="아이디중복조회" name="idBtn" class="idBtn" onclick="idCheck()">
					</td>
				    </tr>
				    <tr>
				      <th>비밀번호 : </th>
				      <td><input type="password" name="c_Passwd" class="regWrite"></td>
				    </tr>
				    <tr>
				      <th>비밀번호확인 : </th>
				      <td><input type="password" name="cc_Passwd" class="regWrite"></td>
				    </tr>
				    <tr>
				      <th>이름 : </th>
				      <td><input type="text" name="c_Name" class="regWrite"></td>
				    </tr>
				    <tr>
				      <th>전화번호 : </th>
				      <td>
				        <select name="c_Phone1" class="phone1">	
				        <option value="010">010</option></select> -
						<input type="text" name="c_Phone2" class="phone2" maxlength="8">
				      </td>
				    </tr>
				    <tr>
				      <th>이메일 : </th>
				      <td>
				        <input type="text" name="c_Email1" class="email1">@
				        <select name="c_Email2" class="email2">
				        <option value="">직접입력</option>		
				        <option value="naver.com">naver.com</option>
				        <option value="hanmail.net">hanmail.net</option>
				        <option value="daum.net">daum.net</option>
				        <option value="nate.com">nate.com</option>
				        <option value="gmail.com">gmail.com</option>
				      </select>
				    </td>
				    </tr>
				    <tr>
				      <th>우편번호 : </th>
				      <td><input type="text" name="zipNo" class="zipNo" readonly onclick="goPopup()"> <input type="button" value="우편번호검색" name="zipBtn" class="zipBtn" onclick="goPopup()"></td>
				    </tr>
				    <tr>
				      <th>주소 : </th>
				      <td><input type="text" name="roadAddrPart1" readonly onclick="goPopup()" class="regWrite"></td>
				    </tr>
				    <tr>
				      <th>상세주소 : </th>
				      <td> <input type="text" name="addrDetail" readonly onclick="goPopup()" class="regWrite"></td>
				    </tr>
				    <tr>
				      <td colspan="2" style="text-align: center;">
						<input type="button" value="가입하기" onclick="regMem()" class="txtBtn"> 
						<input type="reset" value="취소" class="txtBtn">
					 </td>
				    </tr>
				  </table>
		 		</form>
	 		</div>
 		</div>
 	<%@ include file="/menu/footer.jsp" %>
</div>
</body>
</html>