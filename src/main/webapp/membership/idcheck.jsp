<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("cid");
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
			document.customer.cid.focus();
			return false;
		}
		location.href = "idsearch.jsp?cid="+id;
	}
	function closewin() {
		opener.document.customer.c_Id.value ="<%=id%>";
		window.close();
	}

</script>
</head>
<body onload="document.customer.cid.focus()">
	<%		
		if(id== null) {	
	%>	
		<h3>아이디중복조회</h3>
		<form action="#" name="customer" method="post">
			아이디 : <input type="text" name="cid">
			<input type="button" value="아이디중복조회" onclick="idCheck(document.customer.cid.value)">
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