<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 검색</title>
<style>
	.btn {
		margin-top: 10px;
		background-color: black;
		border: 1px dotted gray;
		color: white;
		width: 100px;
		height: 50px;
		font-size: 15pt;
		text-align: center;	
	}
	.btn:hover{background: gray; color: black;}
</style>
</head>
<body>
	<%
		
		request.setCharacterEncoding("UTF-8");
		String method =request.getParameter("method");
		String keyword =request.getParameter("keyword");
		
		ResultSet rs = null;
		PreparedStatement pstm = null;
		
	%>
	<h3>게시판 검색결과</h3>
	<table border="1" width="600" height="150">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성일</th>
			<th>조회수</th>		
		</tr>
	<%
		try {
			String sql = "select r_num, r_author, r_title, r_date from review";
			sql = sql +" where "+ method +" like ? order by r_num desc";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,"%"+keyword+"%");
			rs = pstm.executeQuery();
			
			while(rs.next()){
				int rnum = rs.getInt("r_num");
				String rauthor = rs.getString("r_author");
				String rtitle = rs.getString("r_title");
				String rdate = rs.getString("r_date");
				
	%>
		<tr>
			<td><%=rnum  %></td>
			<td><%=rauthor %></td>
			<td><a href="review_list.jsp?r_num=<%=rnum%>"><%=rtitle %></a></td>
			<td><%=rdate.substring(0, 11) %></td>	
		</tr>
	<%
			}
		 
		
	%>
	</table>
	<input type="button" value="돌아가기" class="btn" onclick="location.href='review_list.jsp';">
	<%
	
	}catch (Exception ex) {
		ex.printStackTrace();
	}
	finally {
		if(pstm != null) pstm.close();
		if(rs != null) rs.close();
		if(conn != null) conn.close();
	}
	%>

</body>
</html>