<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<style>
	.mgBox {
		width: 600px;
		margin: auto;
		margin-top: 50px;
		padding-bottom: 120px;
	}
	.mgBtn {
		margin: 5px;
		width: 200px;
		height: 70px;
		font-size: 20px;
		font-weight: 700;
		background-color: rgb(65, 63, 63);
		color: white;
	}
	 .mgBtn:hover {
        background-color: black;
    }
</style>
</head>
<body>
	 <div class="container">
        <%@ include file="/menu/header.jsp" %>
        <div class="session">
			<div class="mgBox">
				<table>
					<tr>
						<th colspan="5"><h1 style="font-size: 28pt; text-shadow: 2px 3px 5px black;">관리자 항목 페이지</h1><br></th>
					</tr>
					<tr>
						<th><input type="button" value="메인화면" class="mgBtn" onclick="location.href='http://localhost:8080/MusicSite/index.jsp'"></th>
						<th><input type="button" value="로그아웃" class="mgBtn" onclick="location.href='http://localhost:8080/MusicSite/login/logout.jsp'"></th>
						<th><input type="button" value="회원관리" class="mgBtn" onclick="location.href='http://localhost:8080/MusicSite/conf/list.jsp'"></th>
						
					</tr>
					<tr>
						<th><input type="button" value="공지사항작성" class="mgBtn" onclick="location.href='http://localhost:8080/MusicSite/notice/notice_write.jsp'"></th>
						<th><input type="button" value="상품등록" class="mgBtn" onclick="location.href='http://localhost:8080/MusicSite/albumProduct/addAlbum.jsp'"></th>
						<th><input type="button" value="상품관리" class="mgBtn" onclick="location.href='http://localhost:8080/MusicSite/albumProduct/album_gayo.jsp'"></th>
					</tr>	 	             
				</table>       
		   </div>
	</div> 
	  <%@ include file="/menu/footDB.jsp" %>
</div>      	
</body>
</html>