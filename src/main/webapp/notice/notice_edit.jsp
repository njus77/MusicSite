<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판수정</title>
<style>
	.neTable {
		border: 1px dotted black;
		width: 700px; 
		line-height: 40px; 
	}
	.upBtn {
		margin-top: 10px;
		background-color: white;
		border: 1px dotted black;
		color: black;
		width: 90px;
		height: 40px;
		font-size: 10pt;
		text-align: center;	
	}
	.upBtn:hover{background: gray; color: black;}
	.posBtn {
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
	<%
		request.setCharacterEncoding("UTF-8");
		int nnum = Integer.parseInt(request.getParameter("n_num"));

		ResultSet rs = null;
		PreparedStatement pstm = null;
		
		try{
			String sql = "select n_title, n_author, n_content from notice where n_num =?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, nnum);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				String rNtitle = rs.getString("n_title");
				String rNauthor = rs.getString("n_author");	
				String rNcontent = rs.getString("n_content");				
	%>				
	<div class="container">
	<%@ include file="../menu/header.jsp" %>
		<div class="session">
		<%@ include file="../menu/cglist.jsp"%>
		<div style="width: 710px; margin: 30px; float: left;">
			<h1>공지사항</h1> <br>	
			<form action="notice_edit_ok.jsp" method="post" name="notice">
			<input type="hidden" name="n_num" value="<%=nnum%>">
			<table class="neTable">								
				<tr>
					<th>작성자 </th>
					<td><input type="text" name="n_author" value="<%=rNauthor%>" style="width: 220px; height: 35px"></td>
				</tr>
					
				<tr>
					<th>비밀번호 </th>
					<td><input type="password" name="n_passwd" style="width: 220px; height: 35px"></td>
				</tr>
				
				<tr>
					<th>제목 </th>
					<td><input type="text" name="n_title" value="<%=rNtitle%>" style="width: 620px; height: 35px"></td>
				</tr>
				
				<tr>
					<th>내용 </th>
					<td><textarea rows="20" cols="86" name="n_content"><%=rNcontent%></textarea></td>
				</tr>														
			</table>
					<div class="posBtn">
						<input type="reset" value="이전"  onclick="history.back()" class="upBtn">
						<input type="button" value="수정" onclick="check()" class="upBtn">	
					</div>
			</form>
		</div>	
	<% 		
		}		
		} catch(Exception se) {
			se.printStackTrace();
		} finally {
			if (rs != null) rs.close(); 	
			if (pstm != null) pstm.close(); 	
			if (conn != null) conn.close(); 		
		}
	%>	
	</div>
	 <%@ include file="/menu/footer.jsp" %>
</div>
</body>
</html>