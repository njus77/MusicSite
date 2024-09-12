<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MusicBox</title>
	<style>
    .introArea {
        width: 950px;
        margin: auto;
    }
    .introTitle {
        color: rgb(228, 201, 47);
        margin-top: 50px;
        margin-bottom: 30px;
    }
    .introContent {
        font-weight: 500;
        margin-bottom: 50px;
    }
    .map {
        width: 830px;
        height: 500px;
        margin-bottom: 200px;
    }
</style>
</head>
<body>
    <div class="container">
        <%@ include file="/menu/header.jsp" %>
        <div class="session">
            <div class="introArea">
                <div class="introTitle">
                    <h2>인사말</h2><br>
                    <h2>안녕하십니까?</h2>
                </div>
                    <div class="introContent">
                        <p>저희 뮤직박스를 찾아주셔서 진심으로 감사드립니다. 저희 뮤직박스는 온라인으로 음반을 구매하는 쇼핑몰입니다.</p>
                        <p>방문해주시고 이용해 주시는 모든 고객분들의 작은 이야기에도 귀를 기울이며 꼼꼼하게 최선을 다하고 있습니다.</p>
                        <p>항상 초심으로 돌아가려고 노력하며 고객의 입장에서 기대하시는 만큼의 만족을 드리기 위해 노력하겠습니다 </p>
                    </div>            	                           
                    <div class="map">
                        <h1>찾아 오시는 길</h1><br>
                            <img src="http://localhost:8080/MusicSite/images/map.jpg" ><br><br>
                            <h3>→ 부산광역시 해운대구 해운대로 554-1 5층 뮤직박스</h3>
                    </div>
            </div>		
        </div>  
       <%@ include file="/menu/footDB.jsp" %>
    </div>    

  
</body>
</html>