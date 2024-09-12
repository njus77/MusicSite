<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*, java.io.*"%>
<%@ page import="java.sql.*" %>
<%@ include file= "/conf/dbconn.jsp" %>

	<%
		request.setCharacterEncoding("utf-8");
		String realFolder = "D:\\JSP\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\MusicSite\\images";
		//D:\\IT.Program\\JSP\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\MusicSite\\images (집)
		//D:\\JSP\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\MusicSite\\images (학원)
		
		int maxSize =  2 * 1024 * 1024;
				
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
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
									
		PreparedStatement pstmt = null;
		
		String sql = "insert into albumProduct(a_product, a_productCode, a_category, a_price, a_company, a_country, a_releaseDate, a_quantity, a_fileUpload, a_description) values(?,?,?,?,?,?,?,?,?,?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, aproduct);
		pstmt.setInt(2, aproductCode);
		pstmt.setString(3, acategory);
		pstmt.setInt(4, aprice);
		pstmt.setString(5, acompany);		
		pstmt.setString(6, acountry);
		pstmt.setString(7, areleaseDate);
		pstmt.setInt(8, aquantity);
		pstmt.setString(9, fileUpload);
		pstmt.setString(10, adescription);
	
	
		pstmt.executeUpdate();
		
		if (pstmt != null) pstmt.close(); 	
		if (conn != null) conn.close(); 
		
		response.sendRedirect("http://localhost:8080/MusicSite/index.jsp");		
	%>
	