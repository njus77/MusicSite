<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성</title>
<link rel="stylesheet" href ="../resources/style/review_write.css"/>
<script src="js/review_regular.js"></script>
</head>
<body>
	<div class="container">
	<%@ include file="../menu/header.jsp" %>
		<div class="session">
		<%@ include file="../menu/cglist.jsp"%>
		<div class="rvwArea">
			<h3>상품 후기 작성</h3><br>	
			<form action="review_write_ok.jsp" method="post" name="review">
			<table class="rvwTable">
				<tr>
					<th>제목 </th>
					<td><input type="text" name="r_title" class="rvwContent"></td>
				</tr>
								
				<tr>
					<th>작성자 </th>
					<td><input type="text" name="r_author" class="rvwContent"></td>
				</tr>
				
				<tr>
					<th>평가 </th>
					<td class="star">						
						<input type="radio" name="r_starPoint"  value="★★★★★">★★★★★
						<input type="radio" name="r_starPoint"  value="★★★★☆">★★★★☆
						<input type="radio" name="r_starPoint"  value="★★★☆☆">★★★☆☆
						<input type="radio" name="r_starPoint"  value="★★☆☆☆">★★☆☆☆
						<input type="radio" name="r_starPoint"  value="★☆☆☆☆">★☆☆☆☆
					</td>
				</tr>					
						
				<tr>
					<th>내용 </th>
					<td><textarea rows="20" cols="80" name="r_content"></textarea></td>
				</tr>
					
			</table>
				<div class="rvpBtn">
					<input type="reset" value="이전"  onclick="history.back()" class="rvBtn">
					<input type="button" value="저장" class="rvBtn" onclick="regReview()">	
				</div>
		</form>
	</div>	
	</div>
	 <%@ include file="/menu/footer.jsp" %>
</div>
</body>
</html>