<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
<link rel="stylesheet" href ="../resources/style/register.css"/>
<script src="js/regular_edit.js"></script>
</head>
<body>
	<%
		String Num = request.getParameter("c_num");
		ResultSet rs = null;
		PreparedStatement pstm = null;
		
		String sql = "select * from customer where c_num=?";
		pstm = conn.prepareStatement(sql);
		pstm.setString(1, Num);
		rs = pstm.executeQuery();
		
		if(rs.next()) {	
			String cPhone = rs.getString("c_phone");
			String cEmail = rs.getString("c_email");
			String cEmail1 = cEmail.substring(0,cEmail.indexOf("@"));
			String cEmail2 = cEmail.substring(cEmail.lastIndexOf("@")+1);
	%>
	<div class="container">
		<%@ include file="../menu/header.jsp" %>
		<div class="session">
			<h2 style="margin-top: 20px;">회원정보수정</h2> <br>
			<div class="topTitle">
				<p>기본정보</p><br>
			</div>	
			<div class="regArea">
				<form name="editCust" action="edit_ok.jsp" method="post">
					<input type="hidden" name="c_num" value="<%=Num%>">
				  <table class="regText">
				    <tr>
				      <th>아이디 : </th>
				      <td><%=rs.getString("c_id")%></td>
				    </tr> 
				    <tr>
				      <th>비밀번호 : </th>
				      <td><input type="password" name="c_Passwd" class="regWrite"></td>
				    </tr>
				    <tr>
				      <th>비밀번호확인 : </th>
				      <td><input type="password" name="cc_Passwd" class="regWrite"></td>
				    </tr>
				    <tr>
				      <th>이름 : </th>
				      <td><input type="text" name="c_Name" class="regWrite" value='<%=rs.getString("c_name")%>'></td>
				    </tr>
				    <tr>
				      <th>전화번호 : </th>
				      <td>
				        <select name="c_Phone1" class="phone1">			
				        <option value="010" <% if(cPhone.substring(0,3).equals("010")){%> selected<%}%>>010</option>
				        </select> - <input type="text" name="c_Phone2" class="phone2" value='<%=cPhone.substring(4,12)%>' maxlength="8">
				      </td>
				    </tr>
				    <tr>
				      <th>이메일 : </th>
				      <td>
				        <input type="text" name="c_Email1" class="email1" value='<%=cEmail1%>'>@
				        <select name="c_Email2" class="email2" value="<%=cEmail2%>" >
				        	<option>선택하세요</option>		
				        	<option value="naver.com" <% if(cEmail2.equals("naver.com")){%> selected<%}%>>naver.com</option>
				        	<option value="daum.net" <% if(cEmail2.equals("daum.net")){%> selected<%}%>>hanmail.net</option>	
				        	<option value="daum.net" <% if(cEmail2.equals("daum.net")){%> selected<%}%>>daum.net</option>
				        	<option value="nate.com" <% if(cEmail2.equals("nate.com")){%> selected<%}%>>nate.com</option>
				        	<option value="gmail.com" <% if(cEmail2.equals("gmail.com")){%> selected<%}%>>gmail.com</option>
				      </select>
				    </td>
				    </tr>
				    <tr>
				      <th>우편번호 : </th>
				      <td>
					      <input type="text" name="zipNo" class="zipNo" value='<%=rs.getString("zipNo")%>' class="zip" readonly onclick="goPopup()"> 
					      <input type="button" value="우편번호검색" name="zipBtn" class="zipBtn" onclick="goPopup()">
					 </td>
				    </tr>
				    <tr>
				      <th>주소 : </th>
				      <td><input type="text" class="regWrite" name="roadAddrPart1" value='<%=rs.getString("roadAddrPart1")%>' readonly onclick="goPopup()"></td>
				    </tr>
				    <tr>
				      <th>상세주소 : </th>
				      <td> <input type="text" class="regWrite" name="addrDetail" value='<%=rs.getString("addrDetail")%>' readonly onclick="goPopup()"></td>
				    </tr>
				</table>
					<div style="text-align: center; margin-top: 20px;">				      
						<input type="submit" class="txtBtn" value="수정하기" onclick="regCust()"> <input type="reset" class="txtBtn" value="취소" onclick="history.back();">			   
				    </div>
			</form>
		</div>
		<%
		}		
		if(rs != null) rs.close();
		if(pstm != null) pstm.close();
		if(conn != null) conn.close();		
	%>
	</div>
	<%@ include file="/menu/footer.jsp" %>
</div>
	
	
</body>
</html>