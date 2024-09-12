<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String mnum = request.getParameter("mnum");
		String mId = request.getParameter("mId");
		String mPasswd = request.getParameter("mPasswd");
		String mName = request.getParameter("mName");
		String mTel1 = request.getParameter("mTel1");
		String mTel2 = request.getParameter("mTel2");
		String mTel3 = request.getParameter("mTel3");
		String mTel = mTel1 + "-" + mTel2 + "-" + mTel3;
		String mEmail1 = request.getParameter("mEmail1");
		String mEmail2 = request.getParameter("mEmail2");
		String mEmail = mEmail1 + "@" + mEmail2;
		String zipNo = request.getParameter("zipNo");
		String roadAddPart1 = request.getParameter("roadAddPart1");
		String addrDetail = request.getParameter("addrDetail");
		String mIp = request.getRemoteAddr();	
		
		ResultSet rs = null;
		PreparedStatement pstm = null;
		
		try {
			String sql1 ="select mpasswd from member where mnum=?";
			pstm = conn.prepareStatement(sql1);
			pstm.setString(1, mnum);
			rs = pstm.executeQuery();
			
			if (rs.next()){
				String rPasswd = rs.getString("mpasswd");
				
				if(mPasswd.equals(rPasswd)) {
					String sql2 ="update member set mname=?, mtel=?, memail=?,";
					sql2 = sql2 + "zipNo=?, roadAddPart1=?, addrDetail=?, mip=? where mnum=?";
					pstm = conn.prepareStatement(sql2);
					pstm.setString(1, mName);
					pstm.setString(2, mTel);
					pstm.setString(3, mEmail);
					pstm.setString(4, zipNo);
					pstm.setString(5, roadAddPart1);
					pstm.setString(6, addrDetail);
					pstm.setString(7, mIp);
					pstm.setString(8, mnum);
					pstm.executeUpdate();
					
					out.println("<script>alert('회원정보가 수정되었습니다.');location.href='login.jsp';</script>");	
					//response.sendRedirect("list.jsp");
				
				} else {
					out.println("<script>alert('회원정보를 위한 비밀번호가 틀렸습니다.');history.back();</script>");	
				}
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
					
		} finally {
			if(rs != null) rs.close();
			if(pstm != null) pstm.close();
			if(conn != null) conn.close();
		}
	%>

</body>
</html>