<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
<style>
	.boardArea{
		margin: 30px;
		float: left;
		width: 770px;
			
	}
	.bBtnArea {
		text-align: center;
		margin-bottom: 10px;
	}
	.bTable {
		width: 760px; 
		margin-left: 5px; 
		text-align: left;
		font-size: 13pt;
		border: 1px dotted black;
	}
	.bTable th{
		line-height: 60px;
	}
	.bBtn {
		margin-top: 10px;
		background-color: black;
		color: white;
		width: 80px;
		height: 40px;
		font-size: 12pt;
		text-align: center;	
	}
	.bBtn:hover{background: gray; color: black;}

</style>
</head>
<body>
	<div class="container">
	<%@ include file="../menu/header.jsp" %>
	<%
		request.setCharacterEncoding("UTF-8");
		int bnum = Integer.parseInt(request.getParameter("b_num"));
	
		ResultSet rs = null;
		PreparedStatement pstm = null;
		
		String sql = "select b_num, b_evaluation, b_title, b_author, b_date, b_content, c_num from board where b_num=?";
		pstm = conn.prepareStatement(sql);
		pstm.setInt(1, bnum);
		rs = pstm.executeQuery();
						
		if(rs.next()) {
			bnum = rs.getInt("b_num");
			String bevaluation = rs.getString("b_evaluation");
			String btitle = rs.getString("b_title");
			String bauthor = rs.getString("b_author");
			String bdate = rs.getString("b_date");
			String bcontent = rs.getString("b_content");
			String cnum = rs.getString("c_num");
			
	%>
		<div class="session">
		<%@ include file="../menu/cglist.jsp"%>
		<div class="boardArea">		
			<h3>&nbsp;게시판 상세보기</h3><br>
			<table class="bTable">
				<tr style="background-color: rgb(219, 216, 216);">
					<th>키워드 : <%="[" + bevaluation + "] " %></th>	
					<th>제목 : <%=btitle %></th>
				</tr>
					
				<tr style="background-color:rgb(243, 242, 242); line-height: 60px;">
					<td>작성자 : <%=bauthor%></td>
					<td>작성일 : <%=bdate %></td>
				</tr>
				<tr>			
					<td colspan="2" style="padding-bottom: 30px; padding-top: 10px; height: 300px;"><%=bcontent.replace("\r\n","<br>") %></td>
				</tr>	
			</table>	
				<div class="bBtnArea">
					<% 
					//if(!cId.equals("")) { 
					if(cNum.equals(cnum)) {
					%>
						<input type="button" value="수정" class="bBtn" onclick="location.href='board_edit.jsp?b_num=<%=bnum%>'">
						<input type="button" value="삭제" class="bBtn" onclick="location.href='board_delete.jsp?b_num=<%=bnum%>'">
					<%
					}
					%>
						<input type="button" value="목록" class="bBtn" onclick="location.href='board_list.jsp?b_num=<%=bnum%>'">
				</div>	
	<% 	
			}
			if(rs != null) rs.close();
			if(pstm != null) pstm.close();		
			if(conn != null) conn.close();
	%>
		</div>	
	</div>
	 <%@ include file="/menu/footer.jsp" %>
</div>
</body>
</html>