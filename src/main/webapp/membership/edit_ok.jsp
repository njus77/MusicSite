<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>

	<%
		request.setCharacterEncoding("UTF-8");
		String cNum = request.getParameter("c_num");
		String cPasswd = request.getParameter("c_Passwd");
		String cName = request.getParameter("c_Name");
		String cPhone1 = request.getParameter("c_Phone1");
		String cPhone2 = request.getParameter("c_Phone2");
		String cPhone = cPhone1 + "-" + cPhone2;
		String cEmail1 = request.getParameter("c_Email1");
		String cEmail2 = request.getParameter("c_Email2");
		String cEmail = cEmail1 + "@" + cEmail2;
		String zipNo = request.getParameter("zipNo");
		String roadAddrPart1 = request.getParameter("roadAddrPart1");
		String addrDetail = request.getParameter("addrDetail");
			
		ResultSet rs = null;
		PreparedStatement pstm = null;
			
		try {
			String sql ="select c_passwd from customer where c_num=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, cNum);
			rs = pstm.executeQuery();
				
			if (rs.next()){
				String rPasswd = rs.getString("c_passwd");
				
				if(rPasswd.equals(cPasswd)) {
					String query ="update customer set c_name=?, c_phone=?, c_email=?, zipNo=?, roadAddrPart1=?, addrDetail=? where c_num=?";
					pstm = conn.prepareStatement(query);
					pstm.setString(1, cName);
					pstm.setString(2, cPhone);
					pstm.setString(3, cEmail);
					pstm.setString(4, zipNo);
					pstm.setString(5, roadAddrPart1);
					pstm.setString(6, addrDetail);
					pstm.setString(7, cNum);
					pstm.executeUpdate();	
					out.println("<script>alert('회원정보가 수정되었습니다.');location.href='http://localhost:8080/MusicSite/index.jsp';</script>");	
					
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