<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Album</title>
<style>
    .proArea {
        width: 900px;
        margin-top: 20px;
    }
    .proTitle {
        width: 900px;
        line-height: 50px;
        border: 1px dotted gray;
        background-color: rgb(211, 211, 211);
        margin-bottom: 30px;
    }

    .proTable {
        width: 900px;
        border: 1px dotted black; 
        text-align: left;
        font-size: 14pt;
        line-height: 40px;
    }
    .proTableText {
        width: 450px;
        line-height: 35px;
        margin-bottom: 5px;
    }
    .proBtnArea {
        margin-top: 10px;
        margin-bottom: 20px;
        text-align: center;
    }
    .proBtn {
        width: 150px;
        height: 50px;
        font-size: 16px;
        font-weight: 600;
        background-color: whitesmoke;
    }
</style>
</head>
<body>
<div class="container">
	<%@ include file="../menu/header.jsp" %>
	<div class="session">
	<%
	request.setCharacterEncoding("UTF-8");
	int anum = Integer.parseInt(request.getParameter("a_num"));

	ResultSet rs = null;
	PreparedStatement pstm = null;
		
	try{
		String sql = "select a_product, a_productCode, a_category, a_price, a_company, a_country, a_releaseDate, a_quantity, a_fileUpload, a_description from albumProduct where a_num =?";
		pstm = conn.prepareStatement(sql);
		pstm.setInt(1, anum);
		rs = pstm.executeQuery();
			
		if(rs.next()) {
			String aproduct = rs.getString("a_product");
			String aproductCode = rs.getString("a_productCode");
			String acategory = rs.getString("a_category");
			String aprice = rs.getString("a_price");
			String acompany = rs.getString("a_company");
			String acountry = rs.getString("a_country");	
			String areleaseDate = rs.getString("a_releaseDate");	
			String aquantity = rs.getString("a_quantity");
			String afileUpload = rs.getString("a_fileUpload");
			String adescription = rs.getString("a_description");
	%>	
		<div class="proArea">
			<div class="proTitle">
				<h1>앨범 상품수정</h1>
				<p>Album Edition</p>
			</div>
				<div>
				<form name="newAlbum" action="album_edit_ok.jsp" method="post" enctype="multipart/form-data">
				<input type="hidden" name="a_num" value="<%=anum%>">
					<table class="proTable">
						<tr>
							<th>상품명</th>
							<td><input type="text" name="a_product" class="proTableText" value="<%=aproduct%>"></td>
						</tr>
						<tr>
							<th>상품코드</th>
							<td><input type="text" name="a_productCode" class="proTableText" value="<%=aproductCode%>"></td>
						</tr>
						<tr>
							<th>상품종류</th>
							<td><select name="a_category" value="<%=acategory%>">
								<option>상품종류</option>
								<option value="가요" <% if(acategory.equals("가요")){%> selected<%}%>>가요</option>
								<option value="Pop" <% if(acategory.equals("Pop")){%> selected<%}%>>Pop</option>
								<option value="O.S.T" <% if(acategory.equals("O.S.T")){%> selected<%}%>>O.S.T</option>
								<option value="JPop" <% if(acategory.equals("JPop")){%> selected<%}%>>JPop</option>
								<option value="JAZZ" <% if(acategory.equals("JAZZ")){%> selected<%}%>>JAZZ</option>
								<option value="클래식" <% if(acategory.equals("클래식")){%> selected<%}%>>클래식</option>												
							</select></td>															
						</tr>					
						<tr>
							<th>상품가격</th>
							<td><input type="text" name="a_price" class="proTableText" value="<%=aprice%>"></td>
						</tr>						
						<tr>
							<th>제조회사</th>
							<td><input type="text" name="a_company" class="proTableText" value="<%=acompany%>"></td>
						</tr>						
						<tr>
							<th>원산지</th>
							<td><input type="text" name="a_country" class="proTableText" value="<%=acountry%>"></td>																
						</tr>						
						<tr>
							<th>출시일</th>
							<td><input type="text" name="a_releaseDate" class="proTableText" value="<%=areleaseDate%>"></td>
						</tr>					
						<tr>
							<th>재고 수량</th>
							<td><input type="text" name="a_quantity" class="proTableText" value="<%=aquantity%>"></td>
						</tr>						
						<tr>
							<th>이미지파일</th>
							<td><input type="file" name="a_fileUpload" class="proTableText" value="<%=afileUpload%>"></td>
						</tr>						
						<tr>
							<th>상세정보</th>
							<td><textarea rows="30" cols="110"  name="a_description" wrap="hard"><%=adescription%></textarea></td>					
						</tr>				
					</table>
						<div class="proBtnArea">
		                    <input type="reset" value="돌아가기" class="proBtn"  onclick="history.back()" >						
		                    <input type="submit" value="수정하기" class="proBtn" >					
		                </div> 
					</form>
				</div>
			</div>
	<% 		
		}		
		} catch(Exception se) {
			se.printStackTrace();
		} finally {
			if (rs != null) rs.close(); 	
			if (pstm != null) pstm.close(); 	
			if (conn != null) conn.close(); 		
		}
	%>			
	</div>
	<%@ include file="/menu/footer.jsp" %>
</div>
</body>
</html>