<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="./css/regist.css">
<script src="js/regular_edit.js"></script>
</head>
<body>
	<%
		String mnum = request.getParameter("mnum");
		ResultSet rs = null;
		PreparedStatement pstm = null;
		
		String sql = "select * from member where mnum=?";
		pstm = conn.prepareStatement(sql);
		pstm.setString(1, mnum);
		rs = pstm.executeQuery();
		
		if(rs.next()) {	
			String mTel = rs.getString("mtel");
			String mEmail = rs.getString("memail");
			String mEmail1 = mEmail.substring(0,mEmail.indexOf("@"));
			String mEmail2 = mEmail.substring(mEmail.lastIndexOf("@")+1);
	%>
	
	<h1>회원정보수정</h1>
	<form name="member" action="edit_ok.jsp" method="post">
		<input type="hidden" name="mnum" value="<%=mnum%>">
  <table>
    <tr>
      <th>아이디 : </th>
      <td><%=rs.getString("mid")%></td>
    </tr> 
    <tr>
      <th>비밀번호 : </th>
      <td><input type="password" name="mPasswd"></td>
    </tr>
    <tr>
      <th>비밀번호확인 : </th>
      <td><input type="password" name="cPasswd"></td>
    </tr>
    <tr>
      <th>이름 : </th>
      <td><input type="text" name="mName" value='<%=rs.getString("mname")%>'></td>
    </tr>
    <tr>
      <th>전화번호 : </th>
      <td>
        <select name="mTel1" class="tel" >	
        <option value="">선택하세요</option>		
        <option value="010" <% if(mTel.substring(0,3).equals("010")){%> selected<%}%>>010</option>
        <option value="011" <% if(mTel.substring(0,3).equals("011")){%> selected<%}%>>011</option>
        <option value="016" <% if(mTel.substring(0,3).equals("016")){%> selected<%}%>>016</option>
        <option value="017" <% if(mTel.substring(0,3).equals("017")){%> selected<%}%>>017</option>
        <option value="018" <% if(mTel.substring(0,3).equals("018")){%> selected<%}%>>018</option>
        <option value="019" <% if(mTel.substring(0,3).equals("019")){%> selected<%}%>>019</option>	
        </select>-
		<input type="text" name="mTel2" class="tel" value='<%=mTel.substring(4, 8)%>'>-<input type="text" name="mTel3" class="tel" value='<%=mTel.substring(9, 13)%>'>
      </td>
    </tr>
    <tr>
      <th>이메일 : </th>
      <td>
        <input type="text" name="mEmail1" class="email" value='<%=mEmail1%>'>@
        <select name="mEmail2" value='<%=mEmail2%>'>
        	<option>선택하세요</option>		
        	<option value="naver.com" <% if(mEmail2.equals("naver.com")){%> selected<%}%>>naver.com</option>
        	<option value="daum.net" <% if(mEmail2.equals("daum.net")){%> selected<%}%>>daum.net</option>
        	<option value="nate.com" <% if(mEmail2.equals("nate.com")){%> selected<%}%>>nate.com</option>
        	<option value="gmail.com" <% if(mEmail2.equals("gmail.com")){%> selected<%}%>>gmail.com</option>
      </select>
    </td>
    </tr>
    <tr>
      <th>우편번호 : </th>
      <td><input type="text" name="zipNo" value='<%=rs.getString("zipNo")%>' class="zip" readonly onclick="goPopup()"> 
      <input type="button" value="우편번호검색" name="zipBtn" class="btn" onclick="goPopup()"></td>
    </tr>
    <tr>
      <th>주소 : </th>
      <td><input type="text" name="roadAddPart1" value='<%=rs.getString("roadAddpart1")%>' readonly onclick="goPopup()"></td>
    </tr>
    <tr>
      <th>상세주소 : </th>
      <td> <input type="text" name="addrDetail" value='<%=rs.getString("addrDetail")%>' readonly onclick="goPopup()"></td>
    </tr>
    <tr>
      <th><button type="submit" value="수정하기" onclick="regEdit()">수정하기</button> <button type="reset" value="취소">취소</button>
      </th>
    </tr>
  </table>
</form>
	<%
		}		
		if(rs != null) rs.close();
		if(pstm != null) pstm.close();
		if(conn != null) conn.close();		
	%>
</body>
</html>