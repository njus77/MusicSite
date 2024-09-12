<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디중복조회</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("cid");
		
		ResultSet rs = null;
		PreparedStatement pstm = null;
		
		try{
			String sql = "select c_id from customer where c_id=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, id);
			rs = pstm.executeQuery();	
			String rId = "";
			if(rs.next())
				rId = rs.getString("c_id");
				if(id.equals(rId)) {
	%>
					<script>
						alert("<%=rId%>는 이미 가입된 아이디입니다.\n다시검색해주세요!");
						location.href = "idcheck.jsp";				
					</script>
	<%
				} 
				else {		
	%>
					<script>
						alert("<%=id%>는 가입 가능한 아이디입니다.");
						location.href = "idcheck.jsp?cid=<%=id%>";
					</script>;
	<% 
				}
		}catch(SQLException e) {		
			e.printStackTrace();
		}finally {
			if(rs != null) rs.close();
			if(pstm != null) pstm.close();
			if(conn != null) conn.close();
		}		
	%>

</body>
</html>