<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>

	<%
		request.setCharacterEncoding("UTF-8");		
		String cId = request.getParameter("c_Id");
		String cPasswd = request.getParameter("c_Passwd");
		
		ResultSet rs = null;
		PreparedStatement pstm = null;
		
		String rNum = null;
		String rId = null;
		String rPasswd = null;
		
		try{
			String sql1 = "select m_num, m_id, m_passwd from manager where m_id=?";
			pstm = conn.prepareStatement(sql1);
			pstm.setString(1, cId);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				rNum = rs.getString("m_num");
				rId = rs.getString("m_id");
				rPasswd = rs.getString("m_passwd");	
		
				if(cId.equals(rId) && cPasswd.equals(rPasswd)){
					session.setAttribute("mNum", rNum);
					session.setAttribute("mId", rId);
					response.sendRedirect("../index.jsp");
				}
				else {
					out.println("<script>alert('아이디 또는 비밀번호를 확인하세요');history.back();</script>");		
				}			
			}
					
			String sql2 = "select c_num, c_id, c_passwd from customer where c_id=?";
			pstm = conn.prepareStatement(sql2);
			pstm.setString(1, cId);
			rs = pstm.executeQuery();
							
			if(rs.next()) {
					rNum = rs.getString("c_num");
					rId = rs.getString("c_id");
					rPasswd = rs.getString("c_passwd");	
			
				if(cId.equals(rId) && cPasswd.equals(rPasswd)){
					session.setAttribute("cNum", rNum);
					session.setAttribute("cId", rId);
					response.sendRedirect("../index.jsp");
				}
				else {
					out.println("<script>alert('아이디 또는 비밀번호를 확인하세요');history.back();</script>");		
				}
			}
			else{
				out.println("<script>alert('아이디 또는 비밀번호를 확인하세요');history.back();</script>");	
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			
		} finally {
			if(rs != null) rs.close();
			if(pstm != null) pstm.close();
			if(conn != null) conn.close();
		}
		
	%>