<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판수정</title>
<style>
	.bEditArea{
		float: left;
		margin: 30px;
		width: 750px;	
	}
	.bEditTable{
		width: 730px;
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	.bEditTable th {
		text-align: left;
		border: 1px dotted black;
		
     	padding: 10px;
	}
	.bEditTable td {
		border: 1px dotted black;
     	padding: 10px;
	}
	.bEditEval{
		border: 1px solid gray;
		width: 150px;
     	padding: 10px;
	}
	.bEditContent {
		border: 1px solid gray;
		width: 600px;
     	padding: 10px;
	}
	.baEditBtn {
		text-align: center;
	}
	.bEditBtn {
		margin-top: 10px;
		background-color: white;
		border: 1px dotted black;
		color: black;
		width: 90px;
		height: 40px;
		font-size: 10pt;
		text-align: center;	
	}
	.bEditBtn:hover{background: gray; color: black;}
	
</style>
<script src="js/board_edit_regular.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("b_num"));

		ResultSet rs = null;
		PreparedStatement pstm = null;
		
		try{
			String sql = "select b_title, b_evaluation, b_author, b_phone, b_content from board where b_num =?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, num);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				String btitle = rs.getString("b_title");
				String bevaluation = rs.getString("b_evaluation");
				String bauthor = rs.getString("b_author");
				String bphone = rs.getString("b_phone");
				String bcontent = rs.getString("b_content");				
	%>				
	<div class="container">
		<%@ include file="../menu/header.jsp" %>
		<div class="session">
		<%@ include file="../menu/cglist.jsp"%>
		
		<div class="bEditArea">
			<h1>상품 문의 수정</h1><br>	
			<form action="board_edit_ok.jsp" method="post" name="board">
				<input type="hidden" name="b_num" value="<%=num%>">
			<table class="bEditTable">
				<tr>
					<th>말머리 </th>
					<td><select name="b_evaluation" value="<%=bevaluation%>" class="bEditEval">
							<option>문의내용</option>		
						 	<option value="상품" <% if(bevaluation.equals("상품")){%> selected<%}%>>상품</option>
						    <option value="배송" <% if(bevaluation.equals("배송")){%> selected<%}%>>배송</option>
						    <option value="반품/환불" <% if(bevaluation.equals("반품/환불")){%> selected<%}%>>반품/환불</option>
						    <option value="교환/변경" <% if(bevaluation.equals("교환/변경")){%> selected<%}%>>교환/변경</option>
						    <option value="기타" <% if(bevaluation.equals("기타")){%> selected<%}%>>기타</option>
						</select>
					</td>
				</tr>	
				<tr>
					<th>제목</th>
					<td><input type="text" name="b_title" value="<%=btitle%>" class="bEditContent"></td>
				</tr>
					
						
				<tr>
					<th>작성자 </th>
					<td><input type="text" name="b_author" value="<%=bauthor%>" class="bEditContent"></td>
				</tr>
					
				<tr>
					<th>휴대폰 </th>
					<td><input type="text" name="b_phone" value="<%=bphone%>" class="bEditContent"></td>
				</tr>
				
				<tr>
					<th>비밀번호 </th>
					<td><input type="password" name="b_passwd" placeholder="필수 입력" class="bEditContent"></td>
				</tr>
						
				<tr>
					<th>본문 </th>
					<td><textarea rows="20" cols="85" name="b_content"><%=bcontent%></textarea></td>
				</tr>	
			</table>
				<div class="baEditBtn">
					<input type="reset" value="이전"  onclick="history.back()" class="bEditBtn">
					<input type="button" value="수정" onclick="regBoard()" class="bEditBtn">				
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