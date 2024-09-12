<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" href ="../resources/style/board_list.css"/>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	ResultSet rs = null;
	PreparedStatement pstm = null;
%>
<div class="container">
	<%@ include file="../menu/header.jsp" %>
	<div class="session">
	<%@ include file="../menu/cglist.jsp"%>
		<div class="boardArea">
			<h3>상품문의</h3> <br><br>
				<table class="tabArea">
					<tr class="boardTitle">
						<th>문의날짜</th>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성자</th>	
					</tr>
		<%
			try {
				String sql = "select b_num, b_date, b_title, b_evaluation, b_author from board order by b_num asc";
				pstm = conn.prepareStatement(sql);
				rs = pstm.executeQuery();
								
				while(rs.next()){
					int bnum = rs.getInt("b_num");
					String bdate = rs.getString("b_date");
					String bevaluation = rs.getString("b_evaluation");
					String btitle = rs.getString("b_title");
					String bauthor = rs.getString("b_author");			
		%>
					<tr class="boardTitle">
						<td><%=bdate.substring(0, 10) %></td>
						<td><%=bevaluation %></td>
						<td><a href="board_content.jsp?b_num=<%=bnum %>"><%=btitle %></a></td>
						<td><%=bauthor %></td>
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
			<div class="boradSmallArea">
                    <form action="board_search.jsp" name="search" method="get">
                        <select name="method">
                            <option value="">선택하세요</option>
                            <option value="b_author">작성자</option>
                            <option value="b_title">제목</option>
                            <option value="b_content">내용</option>
                        </select>	
                            <input type="text" name="keyword" class="boardSearch">
                            <input type="submit" value="검색" class="boardBtn">
                            <% if(!cId.equals("")) { %>
                            <input type="button" value="글쓰기" class="boardBtn" onclick="location.href='board_write.jsp';">
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