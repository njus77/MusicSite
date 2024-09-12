<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Album</title>
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
		<div class="proArea">
            <div class="proTitle">
                <h1>앨범 상품등록</h1>
                <p style="font-size: 18pt;">Album Addition</p>
            </div>
        <form name="newAlbum" action="./addAlbum_ok.jsp" method="post" enctype="multipart/form-data">
            <table class="proTable">
                <tr>
                    <th>상품명</th>
                    <td><input type="text" name="a_product" class="proTableText"></td>
                </tr>
                <tr>
                    <th>상품코드</th>
                    <td><input type="text" name="a_productCode" class="proTableText"></td>
                </tr>
                <tr>
                    <th>상품종류</th>
                    <td><select name="a_category">
                        <option value="">상품종류</option>
                        <option value="가요">가요</option>
                        <option value="Pop">Pop</option>
                        <option value="O.S.T">O.S.T</option>
                        <option value="JPop">JPop</option>
                        <option value="JAZZ">JAZZ</option>
                        <option value="클래식">클래식</option>												
                    </select></td>															
                </tr>					
                <tr>
                    <th>상품가격</th>
                    <td><input type="text" name="a_price" class="proTableText"></td>
                </tr>						
                <tr>
                    <th>제조회사</th>
                    <td><input type="text" name="a_company" class="proTableText"></td>
                </tr>						
                <tr>
                    <th>원산지</th>
                    <td><input type="text" name="a_country" class="proTableText"></td>
                                                    
                </tr>						
                <tr>
                    <th>출시일</th>
                    <td><input type="text" name="a_releaseDate" class="proTableText"></td>
                </tr>					
                <tr>
                    <th>재고 수량</th>
                    <td><input type="text" name="a_quantity" class="proTableText"></td>
                </tr>						
                <tr>
                    <th>이미지파일</th>
                    <td><input type="file" name="a_fileUpload"></td>
                </tr>						
                <tr>
                    <th>상세정보</th>
                    <td><textarea rows="30" cols="110" name="a_description" wrap="hard"></textarea></td>					
                </tr>
                
            </table>        
                <div class="proBtnArea">
                    <input type="reset" value="돌아가기" class="proBtn"  onclick="history.back()" >						
                    <input type="submit" value="저장하기" class="proBtn" >					
                </div>           
            </form>
    </div>	
	</div><br>
	<%@ include file="/menu/footer.jsp" %>
</div>
</body>
</html>