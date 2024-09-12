<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판수정</title>
<style>
	.rvEditArea{
		float: left;
		margin: 30px;
		width: 750px;	
	}
	.rvEditTable{
		width: 730px;
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	.rvEditTable th {
		text-align: left;
		border: 1px dotted black;
		
     	padding: 10px;
	}
	.rvEditTable td {
		border: 1px dotted black;
     	padding: 10px;
	}
	.rvEditContent {
		border: 1px solid gray;
		width: 400px;
     	padding: 10px;
	}	
	 .star {
            height: 20px;
            font-size: 14pt;
            color: rgb(233, 202, 25);
        }
	
	.rvEditBtn {
		margin-top: 10px;
		background-color: white;
		border: 1px dotted black;
		color: black;
		width: 90px;
		height: 40px;
		font-size: 10pt;
		text-align: center;	
	}
	.rvEditBtn:hover{background: gray; color: black;}
	.rvpEditBtn {
		text-align: center;
	}
</style>
<script src="js/review_edit_regular.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int rnum = Integer.parseInt(request.getParameter("r_num"));

		ResultSet rs = null;
		PreparedStatement pstm = null;
		
		try{
			String sql = "select r_title, r_author, r_starPoint, r_content from review where r_num =?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, rnum);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				String rtitle = rs.getString("r_title");
				String rauthor = rs.getString("r_author");
				String rstarPoint = rs.getString("r_starPoint");	
				String rcontent = rs.getString("r_content");				
	%>				
	<div class="container">
	<%@ include file="../menu/header.jsp" %>
		<div class="session">
		<%@ include file="../menu/cglist.jsp"%>
		<div class="rvEditArea">
			<h2>이용후기 수정</h2><br>	
			<form action="review_edit_ok.jsp" method="post" name="review">
				<input type="hidden" name="r_num" value="<%=rnum%>">
				<table class="rvEditTable">
					<tr>
						<th>제목 </th>
						<td><input type="text" name="r_title" value="<%=rtitle%>" class="rvEditContent"></td>
					</tr>
								
					<tr>
						<th>작성자 </th>
						<td><input type="text" name="r_author" value="<%=rauthor%>" class="rvEditContent"></td>
					</tr>
					
					<tr>
						<th>평가 </th>
						<td class="star">						
							<input type="radio" name="r_starPoint"	<% if(rstarPoint.equals("★★★★★")){%> checked<%}%> value="★★★★★">★★★★★
							<input type="radio" name="r_starPoint" 	<% if(rstarPoint.equals("★★★★☆")){%> checked<%}%> value="★★★★☆">★★★★☆
							<input type="radio" name="r_starPoint"  <% if(rstarPoint.equals("★★★☆☆")){%> checked<%}%> value="★★★☆☆">★★★☆☆
							<input type="radio" name="r_starPoint"  <% if(rstarPoint.equals("★★☆☆☆")){%> checked<%}%> value="★★☆☆☆">★★☆☆☆
							<input type="radio" name="r_starPoint"  <% if(rstarPoint.equals("★☆☆☆☆")){%> checked<%}%> value="★★☆☆☆">★☆☆☆☆
						</td>
					</tr>
							
					<tr>
						<th>내용 </th>
						<td><textarea rows="20" cols="85" name="r_content"><%=rcontent%></textarea></td>
					</tr>						
				</table>
					<div class="rvpEditBtn">
						<input type="reset" value="이전"  onclick="history.back()" class="rvEditBtn">&nbsp;
						<input type="submit" value="수정" class="rvEditBtn">	
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