<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<style>
.button {

  margin-left :10px;
  background-color:#0a0a23;
  color: #fff;
  border:none;
}
.container {
            display: flex;
            align-items: center;

        }
  .center {
    display: flex;
    justify-content: center;
    align-items:center;
    
    /*height: 100vh;*/
  }
  .button-container {
    display: flex;
   justify-content: center;
    align-items: center;
    margin-top: 20px; /* 버튼들 위의 여백 조정 */
    border:1px;

}
</style>
</head>
<body>

<div class="center">
  <img src="images/check.png" alt="체크표시" style="width: 200px; height: 150px; vertical-align: middle;">
</div>
<div class="center">
<p style="font-size:25px;">주문이 <strong>완료</strong> 되었습니다.</p>
</div>

<div>
<p style="font-size:20px;"><strong>주문번호</strong> 230805102</p>
</div>
<hr width="100%" color="#959ea6" style="padding=30px">
<h2>주문 상품 내역</h2>
<hr width="100%" color="#959ea6" style="padding=30px">
<div style="dotted black; display: flex; align-items: center;">
    <!-- 이미지를 왼쪽으로 정렬 -->
    <div style="float: left; margin-right: 10px;">
        <img src="images/place.PNG" alt="운동시설 상세정보" style="width: 150px; height: 150px; vertical-align: middle; margin: 30px">
    </div>


    <div>
        <span style="font-size: 18px;">헬스보이짐 & 필라걸</span><br>
         1개월
        <h2 "style=text-align: right;">70,000원</h2>
    </div>

</div>
<hr width="100%" color="#959ea6" style="padding=30px">
<div>
<h2> 주문자 정보</h2>
<div>
<pre style="margin-left: 30px;">이름            우주</pre>
<pre style="margin-left: 30px;">배송지 정보     세종특별시 세종중앙로23 101동 101호</pre>
<pre style="margin-left:30px;">휴대전화        010-****-****</pre>
</div>
<hr width="100%" color="#959ea6" style="padding=30px">
<h3> 결제 금액 </h3>
<div class="container">
<p style="margin-left: 30px;">총 상품 금액 </p>
<p style="margin-left: 200px;">할인 금액</p>
<p style="margin-left:200px;">최종 결제금액</p>
</div>
</div>
<div class="container"style="font: bold italic 2.0em/1.0em 돋움체;" >
<p>70,000원</p>-
<p style="margin-left: 170px;">0원</p>=
<p style="margin-left:180px;">70,000원</p>
</div>
<hr width="100%" color="#959ea6" style="padding=30px">
<div class="container">
<h3>결제 방법 </h3><p style="margin-left: 400px;"><strong> 적립된 포인트</strong> 264원</p>
</div>
<div class="container">
<p><strong>신용카드</strong> 삼성카드</p> <br>
</div>
<p><strong>할부기간</strong> 일시불 </p>




  <div class="button-container">
    <button type="button" class="button">쇼핑 계속하기</button>
    <button type="button" class="button">주문 조회하기</button>
   
</div>





</div>
</body>
</html>
