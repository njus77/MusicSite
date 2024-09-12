<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
<link rel="stylesheet" href ="../resources/style/main.css"/>
</head>
<body>
    	<footer>
            <div class="footbgm">
                <div class="foot1">
                    <table  class="foot1Ul">
                        <tr>
                        	<th style="border-bottom: 1px solid gray; text-align: left; padding-bottom: 3px;">
                        		<b style="font-size: 15pt;">AS CENTER</b>
                        	</th> 
                        </tr>
                        <tr class="fTel">
                        	<th>051-923-7788</th>
                        </tr>                         		                       	                                
                    </table>   
                    <ul type="none" class="foot1Ul">
                        <li class="fTitle"><b>BANK INFO</b></li>
                        <li class="fBank"><b>국민은행</b> : 573101-01-267332<br>예금주 : 뮤직박스미디어 남문호</li>
                        <li class="fBank"><b>우리은행</b> : 1001-557-174617<br>예금주 : 뮤직박스미디어 남문호</li>
                    </ul>
   			
                          
                    <table class="foot1Ul">
                    	<tr>
                    		<th style="border-bottom: 1px solid gray; text-align: left; padding-bottom: 10px;"><b>NOTICE</b></th>
                    	</tr>         		        	   
             <%
             	
				request.setCharacterEncoding("UTF-8");
				ResultSet rs = null;
				PreparedStatement pstm = null;
				
				String sql = "select n_title from notice order by n_num asc";
				pstm = conn.prepareStatement(sql);
				rs = pstm.executeQuery();
								
				while(rs.next()){
					String ntitle = rs.getString("n_title");
					
			%>               	
                      	<tr>
                    		<td style="font-size: 12px; padding-top: 5px;"><%=ntitle %></td>
                    	</tr> 
            <%
				}
             %>          	                
                    </table >
                    
                    <table class="foot1Ul">
                    	<tr>
                    		<th style="border-bottom: 1px solid gray; text-align: left; padding-bottom: 10px;"><b>REVIEW</b></th>
                    	</tr>  
              
              <%
              	String query = "select r_title, r_starPoint from review order by r_num asc";
				pstm = conn.prepareStatement(query);
				rs = pstm.executeQuery();	
												
				while(rs.next()){					
					String rtitle = rs.getString("r_title");
					String rstarPoint = rs.getString("r_starPoint");
					
              %>
                    <tr>
                    		<td style="font-size: 12px; padding-top: 5px;"><%=rtitle %>&nbsp;&nbsp;
                    		<span style="color: rgb(233, 202, 25);"><%=rstarPoint %></span></td> 
                    	</tr> 
             <%
				}
             %>          	                
                    </table >
                </div>        
            </div>
           	<%
		   		if(pstm != null) pstm.close();
		   		if(rs != null) rs.close();
		   		if(conn != null) conn.close();		   
   			%>
           
                <div class="foot2">
                    <div class="foot2Con">
                        <a href="http://localhost:8080/MusicSite/conf/intro.jsp">회사소개 &nbsp;|&nbsp; </a>
                        <a href="http://localhost:8080/MusicSite/conf/agr_text.jsp">이용약관 &nbsp;|&nbsp; </a>
                        <a href="http://localhost:8080/MusicSite/conf/person_info.jsp"><b>개인정보처리방침</b> &nbsp;|&nbsp; </a>
                        <a href="#">이용안내 &nbsp;|&nbsp; </a>
                    </div>
                </div>
            <div style="width: 1000px; margin: auto; height: 300px; padding-top: 30px; font-size: 9pt;">
            	<table>
            		<tr>
            			<td rowspan="5"> <img src="http://localhost:8080/MusicSite/images/MusicLogo.jpg" style="border-radius: 12px;">&nbsp;&nbsp;</td>
            		</tr>
            		<tr>
            			<td>뮤직박스 부산광역시 해운대구 해운대로 554-1 5층 해운대구 우동 848-3</td>
            		</tr>
            		<tr>
            			<td>대표 : 남문호 사업자등록번호 : 602-01-61352 사업자정보확인통신판매업신고번호 : 제 2007-부산진-0342호개인정보관리자</td>
            		</tr>
            		<tr>
            			<td>대표번호 : 051-923-7788 팩스번호 : 051-958-7790 메일 : njus7741@naver.com 호스팅제공 : 엔에이치엔고도(주)</td>
            		</tr>
            		<tr>
            			<td><b>copyright (c) cdbox.co.kr all rights reserved.</b></td>
            		</tr>           	
            	</table>	            	
            </div>
         </footer>      
</body>
</html>