<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성</title>
<script src="js/board_regular.js"></script>
<style>
	.bwArea{
		float: left;
		margin: 30px;
		width: 750px;	
	}
	.bwTable{
		width: 730px;
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	.bwTable th {
		text-align: left;
		border: 1px dotted black;
		
     	padding: 10px;
	}
	.bwTable td {
		border: 1px dotted black;
     	padding: 10px;
	}
	.bwEval{
		border: 1px solid gray;
		width: 150px;
     	padding: 10px;
	}
	.bwContent {
		border: 1px solid gray;
		width: 600px;
     	padding: 10px;
	}
	.bwaBtn {
		text-align: center;
	}
	.bwBtn {
		margin-top: 10px;
		background-color: white;
		border: 1px dotted black;
		color: black;
		width: 90px;
		height: 40px;
		font-size: 10pt;
		text-align: center;	
	}
	.bwBtn:hover{background: gray; color: black;}
	
</style>
</head>
<body>
	<div class="container">
	<%@ include file="../menu/header.jsp" %>
		<div class="session">
		<%@ include file="../menu/cglist.jsp"%>
		<div class="bwArea">
			<h3>상품 문의 작성</h3>	<br>
			<form action="board_write_ok.jsp" method="post" name="board">
			<table class="bwTable">
				<tr>
					<th>말머리 </th>
					<td><select name="b_evaluation" class="bwEval">
							<option value="">문의내용</option>		
						 	<option value="상품">상품</option>
						    <option value="배송">배송</option>
						    <option value="반품/환불">반품/환불</option>
						    <option value="교환/변경">교환/변경</option>
						    <option value="기타">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>제목 </th>
					<td><input type="text" name="b_title" class="bwContent"></td>
				</tr>
					
							
				<tr>
					<th>작성자 </th>
					<td><input type="text" name="b_author" class="bwContent"></td>
				</tr>
					
				<tr>
					<th>휴대폰 </th>
					<td><input type="text" name="b_phone" class="bwContent"></td>
				</tr>
				
				<tr>
					<th>비밀번호 </th>
					<td><input type="password" name="b_passwd" placeholder="필수 입력..." class="bwContent"></td>
				</tr>
						
				<tr>
					<th>내용 </th>
					<td><textarea rows="25" cols="85" name="b_content" autofocus="autofocus"></textarea></td>
				</tr>			
			</table>
				<div class="bwaBtn">
					<input type="reset" value="이전"  onclick="history.back()" class="bwBtn">&nbsp;
					<input type="button" value="저장" onclick="regBoard()" class="bwBtn">	
				</div>
			</form>
		</div>	
	</div>
	 <%@ include file="/menu/footer.jsp" %>
</div>
</body>
</html>