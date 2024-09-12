<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디중복조회</title>
<script>
	function idCheck(id) {
		if(id == "") {
			alert("중복체크할 아이디를 입력하세요");
			document.member.id.focus();
			return false;
		}
		location.href = "idsearch.jsp?id="+id;
	}
	function closewin() {
		opener.document.member.mId.value ="<%=id%>";
		window.close();
	}

</script>
</head>
<body onload="document.member.id.focus()">
	<%		
		if(id==null) {
			
		
	%>	
		<h3>아이디중복조회</h3>
		<form action="#" name="member" method="post">
			아이디 : <input type="text" name="id">
			<input type="button" value="아이디중복조회" onclick="idCheck(document.member.id.value)">
		</form>
	<%
		} else { 
			
			
	%>
			<h3><%=id%>는 가입 가능한 아이디입니다</h3>
			<input type="button" value="닫기" onclick="closewin()">
	<%
		}
	%>
</body>
</html>