<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*, java.io.*"%>
<%@ page import="java.sql.*" %>
<%@ include file= "/conf/dbconn.jsp" %>

	<%
		request.setCharacterEncoding("utf-8");
		String realFolder = "D:\\JSP\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\MusicSite\\images";
		//(집)D:\\IT.Program\\JSP\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\MusicSite\\images
		//(학원)D:\\JSP\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\MusicSite\\images
		
		int maxSize =  2 * 1024 * 1024;
				
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		int anum = Integer.parseInt(multi.getParameter("a_num"));
		String aproduct = multi.getParameter("a_product");
		int aproductCode = Integer.parseInt(multi.getParameter("a_productCode"));
		String acategory = multi.getParameter("a_category");
		int aprice = Integer.parseInt(multi.getParameter("a_price"));
		String acompany = multi.getParameter("a_company");
		String acountry = multi.getParameter("a_country");
		String areleaseDate = multi.getParameter("a_releaseDate");
		int aquantity = Integer.parseInt(multi.getParameter("a_quantity"));
		String adescription = multi.getParameter("a_description");
		String fileUpload = multi.getParameter("a_fileUpload");
				
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		fileUpload = multi.getFilesystemName(fname);
									
		ResultSet rs = null;
		PreparedStatement pstm = null;
		
		try{
			String sql = "select a_num from albumProduct where a_num=?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, anum);
			rs = pstm.executeQuery();
		
			String query = "update albumProduct set a_product=?, a_productCode=?, a_category=?, a_price=?,";
			query = query + "a_company=?, a_country=?, a_releaseDate=?, a_quantity=?, a_fileUpload=?, a_description=? where a_num=?";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, aproduct);
			pstm.setInt(2, aproductCode);
			pstm.setString(3, acategory);
			pstm.setInt(4, aprice);
			pstm.setString(5, acompany);		
			pstm.setString(6, acountry);
			pstm.setString(7, areleaseDate);
			pstm.setInt(8, aquantity);
			pstm.setString(9, fileUpload);
			pstm.setString(10, adescription);
			pstm.setInt(11, anum);
			pstm.executeUpdate();
			
			out.println("<script>alert('수정이 완료되었습니다.');location.href='http://localhost:8080/MusicSite/index.jsp'</script>");
			
		}catch(Exception se) {
			se.printStackTrace();
			
		} finally {
			if (rs != null) rs.close(); 	
			if (pstm != null) pstm.close(); 	
			if (conn != null) conn.close(); 		
		}	
	%>
	
