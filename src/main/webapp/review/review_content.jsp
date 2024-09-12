<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
<style>
	.rvcArea{
		margin: 30px;
		float: left;
		width: 770px;
			
	}
	.rvcTable {
		width: 760px; 
		margin-left: 5px; 
		text-align: left;
		font-size: 13pt;
		border: 1px dotted black;
	}
	
	.rvcTable th {
		line-height: 60px;
	}
	
	.rvcBtnArea {
		text-align: center;
		margin-bottom: 10px;
	}
	
	.rvcBtn {
		margin-top: 10px;
		background-color: black;
		color: white;
		width: 80px;
		height: 40px;
		font-size: 12pt;
		text-align: center;	
	}
	.rvcBtn:hover{background: gray; color: black;}

</style>
</head>
<body>
<div class="container">
	<%@ include file="../menu/header.jsp" %>
	<%
		request.setCharacterEncoding("UTF-8");
		int rnum = Integer.parseInt(request.getParameter("r_num"));
	
		ResultSet rs = null;
		PreparedStatement pstm = null;
		
		try{
		String sql = "select r_num, c_num, r_title, r_author, r_date, r_count, r_content from review where r_num=?";
		pstm = conn.prepareStatement(sql);
		pstm.setInt(1, rnum);
		rs = pstm.executeQuery();
		

			String query = "update review set r_count=r_count+1 where r_num=?";
			pstm = conn.prepareStatement(query);
			pstm.setInt(1, rnum);
			pstm.executeUpdate();
				
		if(rs.next()) {
			rnum = rs.getInt("r_num");
			String rtitle = rs.getString("r_title");
			String rauthor = rs.getString("r_author");
			String rdate = rs.getString("r_date");
			String rcontent = rs.getString("r_content");
			int rcount = rs.getInt("r_count");
			String cnum = rs.getString("c_num");
	%>
		<div class="session">
		<%@ include file="../menu/cglist.jsp"%>
		<div class="rvcArea">		
			<h3>&nbsp;이용후기 상세보기</h3><br>
			<table class="rvcTable">
				<tr style="background-color: rgb(219, 216, 216);">
					<th colspan="3"><%=rtitle %></th>
				</tr>
				
				<tr style="background-color:rgb(243, 242, 242); line-height: 60px;">
					<td><%=rauthor + " | " %></td>	
					<td><%=rdate.substring(0, 10) %></td>
					<td>조회수 <%=rcount %></td>
				</tr>
										
				<tr>			
					<td colspan="3" style="padding-bottom: 30px; padding-top: 10px; height: 300px;" ><%=rcontent.replace("\r\n","<br>") %></td>
				</tr>			
			</table>
				<div class="rvcBtnArea">			
					<% if(cNum.equals(cnum)) { %>
						<input type="button" value="수정" class="rvcBtn" onclick="location.href='review_edit.jsp?r_num=<%=rnum%>'">
						<input type="button" value="삭제" class="rvcBtn" onclick="location.href='review_delete.jsp?r_num=<%=rnum%>'">
					<%
					}
					%>
					<input type="button" value="목록" class="rvcBtn" onclick="location.href='review_list.jsp?r_num=<%=rnum%>'">
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