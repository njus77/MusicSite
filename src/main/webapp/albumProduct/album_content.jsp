<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file= "/conf/dbconn.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음반 상품 상세보기</title>
<script>
	function addOrder() {
		if(confirm("장바구니 담기를 하시겠습니까?")) {
			document.formCart.submit();
		} else {
			document.formCart.reset();
		}
	}
</script>
<style>
	textarea {
	width: 950px;
	border: 0px;	
}
	.count {
		width: 40px;
		line-height: 25px;
	}
</style>

<link rel="stylesheet" href ="../resources/style/album_content.css"/>
</head>
<body>
<div class="container">
	<%@ include file="/menu/header.jsp" %>
    <div class="session">
    <%
    int anum = Integer.parseInt(request.getParameter("a_num"));
    
	PreparedStatement pstm = null;
	ResultSet rs = null;
	
	String sql= "select * from albumProduct where a_num=?";
				
	pstm = conn.prepareStatement(sql);
	pstm.setInt(1, anum);
	rs = pstm.executeQuery();	
	if (rs.next()) {
		anum = rs.getInt("a_num");
		String aproduct = rs.getString("a_product");
		int aprice = rs.getInt("a_price");
		int aproductCode = rs.getInt("a_productCode");
		String acompany = rs.getString("a_company");
		String acountry = rs.getString("a_country");
		String areleaseDate = rs.getString("a_releaseDate");
		int aquantity = rs.getInt("a_quantity");
	%>
	<div class="content">
	
		<form action="../cart/cart_add.jsp" name="formCart" method="post">
		<input type="hidden" name="a_num" value="<%=anum%>">
		<input type="hidden" name="a_product" value="<%=aproduct%>">
		<input type="hidden" name="a_price" value="<%=aprice%>">
		
    	<div class="tableArea">  	
        <table>
        	<tr>
        		<td rowspan="9" class="imgs"><img src="../images/<%=rs.getString("a_fileUpload")%>" style="width:400px; height:400px"/></td>
        		<th class="caption" colspan="3" style="width:700px;"><%=aproduct %></th>    		
        	</tr> 		
            <tr>	
                <th class="kind">판매가</th>            
                <td colspan="2">
               		<b><fmt:formatNumber value='<%=aprice%>' type="number" />원</b>
                </td>               
            </tr>
            <tr>
            	<th>구매제한</th>
            	<td colspan="2">최소 1개</td>
            </tr>
            <tr>
                <th>상품코드</th>
                <td colspan="2"><%=aproductCode %></td>            
            </tr>
            <tr>
                <th>회사</th>
                <td colspan="2"><%=acompany %></td>
            </tr>
            <tr>
                <th>국가</th>
                <td colspan="2"><%=acountry %></td>
            </tr>
            <tr>
                <th>출시일</th>
                <td colspan="2"><%=areleaseDate %></td>        
            </tr>
            <tr>
                <th>재고 수량</th>
                <td colspan="2"><%=aquantity %>개</td>
            </tr>
            <tr>
                <th colspan="2" class="orSum"><%=rs.getString("a_product") %>&nbsp;
                <input type="number" name="cr_quantity" class="count" value="1" min="1" max="10">&nbsp;
                <fmt:formatNumber value='<%=rs.getInt("a_price")%>' type="number"/>원</th>
                
            </tr>
            <tr>
                <td colspan="4" class="price"><b>총 상품금액&nbsp; <fmt:formatNumber value='<%=rs.getInt("a_price")%>' type="number" />원</b></td>
            </tr>
            <tr>
                <td colspan="4" class="price">
                <h3>총 합계금액&nbsp; <fmt:formatNumber value='<%=rs.getInt("a_price")%>' type="number" />원</h3> 
                </td>
            </tr>          
        </table>
	        <div class="areaBtn">
		        <input type="button" value="장바구니담기" class="orBtn" onclick="addOrder()">
		        <input type="button" value="돌아가기" class="desBtn" onclick="history.back()">
	        </div>  
    </div>
    </form>
    <div class="Box">
            <div class="tabMenu">
                <input type="radio" name="tabs" id="tab1" checked>
                <label for="tab1">상품상세정보</label>
                <input type="radio" name="tabs" id="tab2">
                <label for="tab2">배송안내</label>
                <input type="radio" name="tabs"  id="tab3">
                <label for="tab3">교환 및 반품안내</label>
                <input type="radio" name="tabs" id="tab4" onclick="location.href='http://localhost:8080/MusicSite/review/review_write.jsp'">
                <label for="tab4">상품후기</label>
                <input type="radio" name="tabs" id="tab5" onclick="location.href='http://localhost:8080/MusicSite/board/board_write.jsp'">
                <label for="tab5">상품문의</label>

                <div class="tabContent" id="description">
                    <p class="tabTitle">상품상세정보</p> <br>
                    <%
                    	String a_description = rs.getString("a_description");
                		
                    	out.println(a_description.replace("\r\n","<br>")); 
                    %>
						         
                </div>

                <div class="tabContent" id="delivery">
                    <p class="tabTitle">배송안내</p><br>
                    <div class="BoxContent">- 배송비 : 기본배송료는 2,500원 입니다. (도서,산간,오지 일부지역은 배송비가 추가될 수 있습니다)  50,000원 이상 구매시 무료배송입니다.
                    <br> - 본 상품의 평균 배송일은 0일입니다.(입금 확인 후) 설치 상품의 경우 다소 늦어질수 있습니다.
                    <br>[배송예정일은 주문시점(주문순서)에 따른 유동성이 발생하므로 평균 배송일과는 차이가 발생할 수 있습니다.]
                    <br>- 본 상품의 배송 가능일은 0일 입니다. 
                    <br>배송 가능일이란 본 상품을 주문 하신 고객님들께 상품 배송이 가능한 기간을 의미합니다. (단, 연휴 및 공휴일은 기간 계산시 제외하며 현금 주문일 경우 입금일 기준 입니다.)
                    </div>
                </div>

                <div class="tabContent" id="change">
                    <p class="tabTitle">교환 및 반품 안내</p><br>
                    <div class="BoxContent">- 상품 택(tag)제거 또는 개봉으로 상품 가치 훼손 시에는 상품수령후 7일 이내라도 교환 및 반품이 불가능합니다.
                    <br>- 저단가 상품, 일부 특가 상품은 고객 변심에 의한 교환, 반품은 고객께서 배송비를 부담하셔야 합니다(제품의 하자,배송오류는 제외)
                    <br>- 일부 상품은 신모델 출시, 부품가격 변동 등 제조사 사정으로 가격이 변동될 수 있습니다.
                    <br>- 신발의 경우, 실외에서 착화하였거나 사용흔적이 있는 경우에는 교환/반품 기간내라도 교환 및 반품이 불가능 합니다.
                    <br>- 수제화 중 개별 주문제작상품(굽높이,발볼,사이즈 변경)의 경우에는 제작완료, 인수 후에는 교환/반품기간내라도 교환 및 반품이 불가능 합니다. 
                    <br>- 수입,명품 제품의 경우, 제품 및 본 상품의 박스 훼손, 분실 등으로 인한 상품 가치 훼손 시 교환 및 반품이 불가능 하오니, 양해 바랍니다.
                    <br>- 일부 특가 상품의 경우, 인수 후에는 제품 하자나 오배송의 경우를 제외한 고객님의 단순변심에 의한 교환, 반품이 불가능할 수 있사오니, 각 상품의 상품상세정보를 꼭 참조하십시오. 
                    <br><br><br>             
                    <p class="tabTitle">환불안내</p><br>- 상품 청약철회 가능기간은 상품 수령일로 부터 7일 이내 입니다.
                    <br><br><br>
                    <p class="tabTitle">AS 안내</p><br>
                    - 소비자분쟁해결 기준(공정거래위원회 고시)에 따라 피해를 보상받을 수 있습니다.
                    <br>- A/S는 판매자에게 문의하시기 바랍니다.
                    </div>
                </div>             
            </div>
        </div>
</div> <br><br>
	<%
	}	
	if(rs != null) rs.close();
	if(pstm != null) pstm.close();
	if(conn != null) conn.close();
	%>

</div>
     <%@ include file="/menu/footer.jsp" %>    	
</div>

</body>
</html>