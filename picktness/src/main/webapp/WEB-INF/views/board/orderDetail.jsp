<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>주문/결제</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
    <style>

  .button {
   background-color=""#959ea6"
    top:50%
}

        .center {
            display: inline-block; /* 가운데 정렬을 위해 인라인 블록 요소 사용 */
            text-align: left; /* 내용의 정렬은 왼쪽 */
        }
.container {
            display: flex;
            align-items: center;
        }
        .btn2 {
            background-color: rgb(41, 143, 184);
            color: white;
            border:none;
            padding:10px 30px;
        }
    </style>
</head>
<body>
    <div>
        <h1>주문/결제</h1>
    </div>
    <hr width="100%" color="#959ea6">
    <h3><strong>주문자 정보</strong></h3>
    <div class="center">
        <!-- 내용을 가운데 정렬하기 위해 center 클래스 추가 -->
        우 주/010-5555-5555/test@test.com
        <a href="url">주문자 정보변경</a>
    </div>
<hr width="100%" color="#959ea6">
<h2>배송지 정보</h2>
<div class="container">
    <label class="label">받는분<input type="text" name="name" style="width: 500px;"></label>
    <label class="checkbox-label"><input type="checkbox">주문자 정보와 동일</label>
</div>
    <div>
        <!-- 내용을 가운데 정렬하기 위해 center 클래스 추가 -->
        <label>주소<input type="text" name="zipcode" placeholder="우편번호" style="width: 200px;"></label>
        <input type="text" name="deliveryAddr1" placeholder="번지주소" style="width: 500px;"> <input type="button" value="우편번호 찾기">
    </div>
    <div >
        <!-- 내용을 가운데 정렬하기 위해 center 클래스 추가 -->
        <input type="text" name="deliveryAddr2"style="margin-left: 35px;" placeholder="상세주소" style="width: 500px;">
    </div>
    <div>
        <!-- 내용을 가운데 정렬하기 위해 center 클래스 추가 -->
        <label>휴대전화<input type="text" name="name" style="width: 70px;"></label>
        -
        <input type="text" name="name" style="width: 70px;">
        -
        <input type="text" name="name" style="width:70px;">
    </div>
    <div>
        <h2>배송상품</h2>
    </div>
<div style=" display: flex; align-items: center;">
    <!-- 이미지를 왼쪽으로 정렬 -->
    <div style="float: left; margin-right: 10px;">
        <img src="images/food.png" alt="운동시설 상세정보" style="width: 100px; height: 70px; vertical-align: middle;">
    </div>
    <div>
        <span style="font-size: 18px;">닭가슴살 패키지 </span><br>
         1세트
        <h2 style="text-align: right; margin-top: 0;">26,000원</h2>
    </div>

</div>
<label>배송 요청사항<input type="text" name="name" style="width: 500px;"></label>
<hr width="100%" color="#959ea6">

<div><h2>이용상품 1개</h2></div>
<div style="display: flex; align-items: center;">
    <!-- 이미지를 왼쪽으로 정렬 -->
    <div style="float: left; margin-right: 10px;">
        <img src="images/place.PNG" alt="운동시설 상세정보" style="width: 100px; height: 70px; vertical-align: middle;">
    </div>


    <div>
        <span style="font-size: 18px;">헬스보이짐 & 필라걸</span><br>
         1개월
        <h2 style="text-align: right; margin-top: 0;">70,000원</h2>
    </div>

</div>
<div>
<hr width="100%" color="#959ea6" style="padding=30px">
</div>
<div class="container">
   <strong>포인트 사용</strong> <input type="text"placeholder="2,000원부터 사용가능"/>
    <button class="button">전액사용</button>
<p style="margin-left: 200px;">보유포인트 5,000원 </p>                     <p style="margin-left: 200px;background-color:#D2E556;">적립 예정 포인트 204원</p>
</div>
<hr width="100%" color="#959ea6" style="padding=30px">
<div class="container">
<p style="margin-left: 30px;">총 상품 금액 </p>
<p style="margin-left: 200px;">할인 금액</p>
<p style="margin-left:200px;">최종 결제금액</p>
</div>
<div class="container">

</div>
<div class="container"style="font: bold italic 2.0em/1.0em 돋움체;" >
<p>96,000원</p>-
<p style="margin-left: 170px;">0원</p>=
<p style="margin-left:180px;">96,000원</p>
</div>
<div class="container">
</div>
<hr width="100%" color="#959ea6" style="padding=30px">

<h3>결제 방법 선택</h3>
<div>
<button type="button" onclick="alert(신용카드 선택 !')">신용카드</button>
</div>  
<div class="container" style="margin-top:20px;">
<select name="language" >
    <option value="none">=카드사 선택=</option>
    <option value="korean">농협</option>
    <option value="english">우리</option>
    <option value="chinese">기업</option>
    <option value="spanish">신협</option>
  </select>
<select name="language" >
    <option value="none">=할부=</option>
    <option value="korean">일시불</option>
    <option value="english">3개월</option>
    <option value="chinese">6개월</option>
    <option value="spanish">12개월</option>
  </select>
</div>
<hr width="100%" color="#959ea6" style="padding=30px">
<div>
<label class="checkbox-label"><input type="checkbox">[필수] 개인정보 수집 및 이용 동의</label>
</div>
<div>
<label class="checkbox-label"><input type="checkbox">[필수] 개인정보 제 3자 제공 동의</label>
</div>
<div>
<label class="checkbox-label"><input type="checkbox">[필수] 전자결제대행 이용 동의</label>
</div>
<div class="center">
<div>
<button class="btn2" style="margin-left: 1000px;"  >96,000원 결제하기</button>
</div>
</div>
</body>
</html>
