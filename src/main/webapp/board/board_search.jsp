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
			String sql = "select b_num, b_name, bsubject, bdate, breadnum from board";
			sql = sql +" where "+ method +" like ? order by bnum desc";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,"%"+keyword+"%");
			rs = pstm.executeQuery();
			
			while(rs.next()){
				int bnum = rs.getInt("bnum");
				String bname = rs.getString("bname");
				String bsubject = rs.getString("bsubject");
				String bdate = rs.getString("bdate");
				int breadnum = rs.getInt("breadnum");
				
	%>
		<tr>
			<td><%=bnum %></td>
			<td><%=bname %></td>
			<td><a href="content_ok.jsp?num=<%=bnum%>"><%=bsubject %></a></td>
			<td><%=bdate.substring(0, 11) %></td>
			<td><%=breadnum %></td>		
		</tr>
	<%
			}
		 
		
	%>
	</table>
	<input type="button" value="글쓰기" class="btn" onclick="location.href='write.jsp';">
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