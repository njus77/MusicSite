<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용후기 목록</title>
<link rel="stylesheet" href ="../resources/style/review_list.css"/>
</head>
<body>
<div class="container">
	<%@ include file="../menu/header.jsp" %>
	<div class="session">
	<%@ include file="../menu/cglist.jsp"%>
		<div class="reviewArea">
			<h3>상품후기</h3> <br><br>
				<table class="tabArea">
					<tr class="reviewTitle">
						<th>번호</th>
						<th>제목</th>
						<th>별점</th>
						<th>날짜</th>
						<th>작성자</th>
						<th>조회수</th>	
					</tr>
		<%
			request.setCharacterEncoding("UTF-8");
	
			ResultSet rs = null;
			PreparedStatement pstm = null;
			
			try {
				String sql = "select r_num, r_title, r_starPoint, r_date, r_author, r_count from review order by r_num asc";
				pstm = conn.prepareStatement(sql);
				rs = pstm.executeQuery();	
												
				while(rs.next()){	
					int rnum = rs.getInt("r_num");
					String rtitle = rs.getString("r_title");
					String rstarPoint = rs.getString("r_starPoint");
					String rdate = rs.getString("r_date");
					String rauthor = rs.getString("r_author");
					int rcount = rs.getInt("r_count");
					
				
		%>
					<tr class="reviewTitle">
						<td><%=rnum %></td>
						<td><a href="review_content.jsp?r_num=<%=rnum %>"><%=rtitle %></a></td>
						<td style="height: 20px; font-size: 13pt; color: rgb(233, 202, 25);"><%=rstarPoint %></td>
						<td><%=rdate.substring(0, 10) %></td>										
						<td><%=rauthor %></td>
						<td><%=rcount %></td>							
					</tr>			
		<%
				}
			}catch (Exception ex) {
				ex.printStackTrace();
			}
			finally {
				if(pstm != null) pstm.close();
				if(rs != null) rs.close();
				if(conn != null) conn.close();
			}
		%>	
		</table>
			<div class="reviewSmallArea">
                    <form action="review_search.jsp" name="search" method="get">
                        <select name="method">
                            <option value="">선택하세요</option>
                            <option value="r_author">작성자</option>
                            <option value="r_title">제목</option>
                            <option value="r_content">내용</option>
                        </select>	
                            <input type="text" name="keyword" class="reviewSearch">
                            <input type="submit" value="검색" class="reviewBtn">
                            <% if(!cId.equals("")) { %>
                            <input type="button" value="글쓰기" class="reviewBtn" onclick="location.href='review_write.jsp';">
                            <%
                            }
                            %>
                    </form>
			    </div>		
			</div>
		</div>
	 <%@ include file="/menu/footer.jsp" %> 
</div>
</body>
</html>