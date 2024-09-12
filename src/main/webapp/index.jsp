<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MusicBox</title>
<link rel="stylesheet" href ="./resources/style/main.css"/>

</head>
<body>
    <div class="container">
        <%@ include file="/menu/header.jsp" %>
        <div class="session">
            <%@ include file="/menu/cglist.jsp"%>
            <div class="contents">        
            	<h2 class="new">새로나온 음반</h2>
                     <div class="slideShow">
                     	<div id="slides">
	                     	<img src="./images/IVE.jpg" style="width: 780px;" onclick="location.href='http://localhost:8080/MusicSite/albumProduct/album_content.jsp?a_num=1'">
	                        <img src="./images/OHMYGLRL.jpg" style="width: 780px;" onclick="location.href='http://localhost:8080/MusicSite/albumProduct/album_content.jsp?a_num=2'">
	                        <img src="./images/NCT127.jpg" style="width: 780px;" onclick="location.href='http://localhost:8080/MusicSite/albumProduct/album_content.jsp?a_num=4'">
	                         <img src="./images/ONANDOFF.jpg" style="width: 780px;" onclick="location.href='http://localhost:8080/MusicSite/albumProduct/album_content.jsp?a_num=3'">
	                        <button id="prev">&lang;</button>
	                        <button id="next">&rang;</button>
                     	</div>                     
                     </div>            
            </div>
        </div>  
       <%@ include file="/menu/footDB.jsp" %>
    </div>    

<script src="./resources/js/imgSlides.js"></script>     
</body>
</html>