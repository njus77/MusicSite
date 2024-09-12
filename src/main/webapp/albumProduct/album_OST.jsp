<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file= "/conf/dbconn.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ablum List</title>
<link rel="stylesheet" href ="../resources/style/album_list.css"/>
</head>
<body>
<div class="container">
	<%@ include file="/menu/header.jsp" %>
    <div class="session">
    		<%@ include file="/menu/cglist.jsp"%>
    	<div>
    	 	<h2 class="proTitle">O.S.T 음반</h2> 
    	</div> 
	    	<div class="albumContent"> 	 
	       <%
				PreparedStatement pstm = null;
				ResultSet rs = null;
				String sql= "select a_num, a_fileUpload, a_product, a_price from albumProduct where a_category like '%O.S.T%'";
				
				pstm = conn.prepareStatement(sql);		
				rs = pstm.executeQuery();
				
				while (rs.next()) {			
					int anum = rs.getInt("a_num");
			%>
				<div class="albums">  
		           <p><img src="../images/<%=rs.getString("a_fileUpload")%>" style="width:225px; height:190px"/></p>
		           <p style="width:220px"><a href="album_content.jsp?a_num=<%=anum%>"><%=rs.getString("a_product")%></a></p><br>
					<p><fmt:formatNumber value='<%=rs.getInt("a_price")%>' type="number" />원</p>
					<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<% if(mId.equals("admin")) { %>
						<input type="button" value="수정" class="btn" onclick="location.href='album_edit.jsp?a_num=<%=anum%>'">
						<input type="button" value="삭제" class="btn" onclick="location.href='album_delete.jsp?a_num=<%=anum%>'"></p>
					<% 
						}
						
					%>						
				</div>                  
	       <%
			}
			
	       %>
	       </div> 
	                 
    </div>
     <%@ include file="/menu/footer.jsp" %>    	
</div>
</body>
</html>