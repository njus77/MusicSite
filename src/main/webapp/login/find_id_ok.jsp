<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<link rel="stylesheet" href ="../resources/style/login.css"/>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String cname = request.getParameter("c_name");
		String cemail = request.getParameter("c_email");
		
		ResultSet rs = null;
		PreparedStatement pstm = null;
		
		try{
			String sql = "select c_name, c_email, c_id from customer";
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
					
			if(rs.next()) {
				String rname = rs.getString("c_name");
				String remail = rs.getString("c_email");
				String rid = rs.getString("c_id");
				
				if(rname.equals(cname) && remail.equals(cemail)) {							
	%>	
	<div class="container">
		<%@ include file="../menu/header.jsp" %>
			<div class="session">
			<div class="logArea">		
				<h1 class="logTitle">아이디찾기</h1>
				<div class="logBox">
					<table class="logTable">
						<caption class="boxTitle" style="padding-bottom: 20px;">회원 아이디 찾기</caption>					
						<tr>
							<td style="font-size: 15pt;"><b><%=rname%></b> 회원님의 아이디는</td>
							<td style="font-size: 15pt;"><b><%=rid.substring(0, 4) + "****"%></b> 입니다.</td>					
						 </tr>									 
						 <tr>
							<td colspan="2" style="text-align: center;">
								<input type="button" value="비밀번호 찾기" class="regBtn" onclick="location.href='http://localhost:8080/MusicSite/login/find_passwd.jsp'">
	                            <input type="button" value="로그인하기"  class="regBtn" onclick="location.href='http://localhost:8080/MusicSite/login/login.jsp'">		
							</td>                       
						</tr>
					</table>	
				</div>				
		</div>														
			<%
				}	
				else {
					out.println("<script>alert('이름 또는 이메일을 확인하세요');history.back();</script>");		
				}	 	 	
			}				
			%>
		 					
	<% 			
		}catch(SQLException e) {		
			e.printStackTrace();
		}finally {
			if(rs != null) rs.close();
			if(pstm != null) pstm.close();
			if(conn != null) conn.close();
		}		
	%>
	</div>	
	<%@ include file="../menu/footer.jsp" %>
</div>
</body>
</html>
