<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<style>
	.noticeArea {
	margin:25px 20px;
	float:left;
    width: 780px;
	}
	.tabArea {
		width: 780px;
	    border-collapse: collapse;
	    line-height: 40px;
	    text-align: center;
	}

	.noticeTitle > th {
		color: rgb(95, 93, 93);
	    background-color: rgb(128, 255, 255);   
	    border-top: 1px solid rgb(73, 70, 70);
	    border-bottom: 1px dotted rgb(131, 127, 127);
	}

	.noticeTitle > td {
		border-bottom: 1px solid rgb(204, 201, 201);
		font-size: 10pt;
	}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	ResultSet rs = null;
	PreparedStatement pstm = null;
%>
<div class="container">
	<%@ include file="../menu/header.jsp" %>
	<div class="session">
	<%@ include file="../menu/cglist.jsp"%>
		<div class="noticeArea ">
		<h3>공지사항</h3> <br>
		<table class="tabArea">
			<tr class="noticeTitle">
				<th>번호</th>
				<th>제목</th>
				<th>날짜</th>
				<th>작성자</th>	
			</tr>
<%
	try {
		
		String sql = "select n_num, n_title, n_date, n_author from notice";
		pstm = conn.prepareStatement(sql);
		rs = pstm.executeQuery();
						
		while(rs.next()){
			int nnum = rs.getInt("n_num");
			String ntitle = rs.getString("n_title");
			String ndate = rs.getString("n_date");
			String nauthor = rs.getString("n_author");	
%>
			<tr class="noticeTitle">			
				<td><%=nnum %></td>
				<td><a href="notice_content.jsp?n_num=<%=nnum%>"><%=ntitle %></a></td>
				<td><%=ndate.substring(0, 10) %></td>
				<td><%=nauthor %></td>
			</tr>
	<%
		}
	%>
		</table>		
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
		</div>	
	</div>
	 <%@ include file="/menu/footer.jsp" %>
</div>

</body>
</html>