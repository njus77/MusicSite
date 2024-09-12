<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MusicBox</title>
<link rel="stylesheet" href ="../resources/style/main.css"/>

</head>
<body>
		<header>
	<%		String mNum = "";
			String mId = "";
			String cNum = "";
			String cId = "";	
			if(session.getAttribute("mId") != null) {
				mNum = (String)session.getAttribute("mNum");
				mId = (String)session.getAttribute("mId");
			}
						
			else if(session.getAttribute("cId") != null) {
				cNum = (String)session.getAttribute("cNum");
				cId = (String)session.getAttribute("cId");
			}
			
			if(mId.equals("admin")) {
		%>
			<div class="topSpace">
			 	 	<div class="topMenu">
			 	 		<a href="http://localhost:8080/MusicSite/manager/manager.jsp"> 관리자페이지 </a> |
						<a href="http://localhost:8080/MusicSite/login/logout.jsp"> 로그아웃 </a> |
				  	</div>   
            	</div> 
		<% 		
			}	
			else if(!cId.equals("")) {
		%>	
			 	<div class="topSpace">
			 	 	<div class="topMenu">			 	
				 	 	<a href="http://localhost:8080/MusicSite/login/logout.jsp">로그아웃 </a> |&nbsp;			 	 	
			 	 		<a href="http://localhost:8080/MusicSite/orders/orders_list.jsp?c_num=<%=cNum%>">주문조회</a> |&nbsp;
			 	 		<a href="http://localhost:8080/MusicSite/membership/edit.jsp?c_num=<%=cNum%>">내정보수정</a> |&nbsp;
                        <a href="http://localhost:8080/MusicSite/membership/delete.jsp?c_num=<%=cNum%>">회원탈퇴</a> |&nbsp;
                        <a a href="http://localhost:8080/MusicSite/board/board_write.jsp">1:1 문의</a> |&nbsp;				 	 				 				 	 				 	
				 	 	<a href="http://localhost:8080/MusicSite/cart/cart_list.jsp?c_num=<%=cNum%>">장바구니 </a>	 	 							 		 	 					 	 				 	 					 				 	 			 	 		                                                                               
				  	</div>   
            	</div>  		
		<%	
			}
			else {	
		%>
			<div class="topSpace">
                <div class="topMenu">			
                    <a href="http://localhost:8080/MusicSite/login/login.jsp">로그인 | </a>
                    <a href="http://localhost:8080/MusicSite/conf/agreement.jsp">회원가입 |</a>                
                    <a href="http://localhost:8080/MusicSite/cart/cart_list.jsp">장바구니 </a>
                </div>   
            </div> 			       
		<%
			}
		%>    
            <div class="mainHead">
                <a href="http://localhost:8080/MusicSite/index.jsp" class="title">MusicBox</a>
                <input type="text" name="search" class="search"> 
                <input type="button" value="Search" class="srBtn">
            </div>
            <div class="cgArea">
                <div class="cgSel">
                    <input type="button" value="≡ 카테고리" class="cgBtn" onclick="">&nbsp;&nbsp;&nbsp;
                        <a href="http://localhost:8080/MusicSite/review/review_list.jsp"> <b>|&nbsp; 이용후기 &nbsp;|</b></a>
                        <a href="http://localhost:8080/MusicSite/board/board_list.jsp"> <b>상품문의 &nbsp;|</b> </a>
                        <a href="http://localhost:8080/MusicSite/notice/notice_list.jsp"> <b>공지사항 &nbsp;|</b> </a>
                </div>
            </div>     
        </header> 
</body>
</html>