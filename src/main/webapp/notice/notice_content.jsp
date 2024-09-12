<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
<style>
	.noticeArea{
		margin: 30px;
		float: left;
		width: 770px;
			
	}
	.nBtnArea {
		text-align: center;
		margin-bottom: 10px;
	}
	.nTable {
		width: 760px; 
		margin-left: 5px; 
		text-align: left;
		font-size: 13pt;
		border: 1px dotted black;
	}
	.nTable th {
		line-height: 60px;
	}
	.nTabletr {
		line-height: 60px;
	}
	.nBtn {
		margin-top: 10px;
		background-color: black;
		color: white;
		width: 80px;
		height: 40px;
		font-size: 12pt;
		text-align: center;	
	}
	.nBtn:hover{background: gray; color: black;}

</style>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int nnum = Integer.parseInt(request.getParameter("n_num"));
	
		ResultSet rs = null;
		PreparedStatement pstm = null;
		
		try{
		String sql = "select n_num, n_title, n_author, n_date, n_content, n_count from notice where n_num=?";
		pstm = conn.prepareStatement(sql);
		pstm.setInt(1, nnum);
		rs = pstm.executeQuery();
		

			String query = "update notice set n_count=n_count+1 where n_num=?";
			pstm = conn.prepareStatement(query);
			pstm.setInt(1, nnum);
			pstm.executeUpdate();
				
		if(rs.next()) {
			nnum = rs.getInt("n_num");
			String ntitle = rs.getString("n_title");
			String nauthor = rs.getString("n_author");
			String ndate = rs.getString("n_date");
			String ncontent = rs.getString("n_content");
			int ncount = rs.getInt("n_count");
	%>
	<div class="container">
	<%@ include file="../menu/header.jsp" %>
		<div class="session">
		<%@ include file="../menu/cglist.jsp"%>
		<div class="noticeArea">		
			<h3>&nbsp;공지사항 상세보기</h3><br>
			<table class="nTable">
				<tr style="background-color: rgb(219, 216, 216);">
					<th colspan="3"><%=ntitle %></th>
				</tr>
				
				<tr class="nTabletr">
					<td><%=nauthor + " | " %></td>	
					<td>작성일 <%=ndate.substring(0, 10) %></td>
					<td>조회수 <%=ncount %></td>
				</tr>
										
				<tr> 			
					<td colspan="3" style="background-color:rgb(243, 242, 242); padding-bottom: 30px; height: 300px;" ><%=ncontent.replace("\r\n","<br>") %></td>
				</tr>			
			</table>
				<div class="nBtnArea">
					<% if(mId.equals("admin")) { %>
						<input type="button" value="수정" class="nBtn" onclick="location.href='notice_edit.jsp?n_num=<%=nnum%>'">
						<input type="button" value="삭제" class="nBtn" onclick="location.href='notice_delete.jsp?n_num=<%=nnum%>'">
					<%
					}
					%>
					<input type="button" value="목록" class="nBtn" onclick="location.href='notice_list.jsp?n_num=<%=nnum%>'">	
				</div>					
	<% 	
		}
		}catch(Exception e) {
			 e.printStackTrace();
		}finally {
			if (rs != null) rs.close(); 	
			if (pstm != null) pstm.close(); 	
			if (conn != null) conn.close();
		}	
	%>
		</div>	
	</div>
	 <%@ include file="/menu/footer.jsp" %>
</div>
</body>
</html>