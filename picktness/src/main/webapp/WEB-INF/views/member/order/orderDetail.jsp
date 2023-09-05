<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>주문/결제</title>
    <style>

      .order_detail {
        width: 1100px;
        position: relative;
        margin: 0px auto;
      }
      h2{
      color:#262626;
      }
      .button {
        background-color: #959ea6;
        top: 50%;
      }
	
      .center {
        display: inline-block; /* 가운데 정렬을 위해 인라인 블록 요소 사용 */
        text-align: center; /* 내용의 정렬은 왼쪽 */
      }
      .center a{
      color:#2890f1;
      font-weight:bold;
      }
      .container {
        display: flex;
        align-items: center;
      }
      .btn2 {
        background-color: #2890f1;
        color: white;
        border: none;
        padding: 20px 50px;
        font-size:18px;
        font-weight:bold;
        cursor:pointer;
      }
      .order_button {
        text-align: center;
        margin:60px;
      }
      .under-line{
      margin-top:30px;
      border-bottom:0.5px solid #555;
      }
      .detail{
      margin: 20px 0px;
      }
      .content_img {
      display:inline-block;
      }
      .content_img img {
      width:84px;
      }
      .titleandoption{
      vertical-align: 25px;
      display:inline-block;
      width:700px;
      }
      .price_box{
     display:inline-block;
      width:250px;
      text-align:center;
      vertical-align: 25px;
      }
	.original_price{
	text-decoration: line-through;
	}
	.order_price{
	margin:20px 0px;
	text-align:center;
	}
	.order_price_box{
	display:inline-block;
	width:300px;
	}
	.price_title{
	font-size:13px;
	}
	.price_content{
	font-size:20px;
	margin-top:10px;
	}
	.price_mark{
	display:inline-block;
	font-size:18px;
	}
	.won{
	font-weight:normal;
	font-size:15px;
	}
	.point_box{
	text-align:center;
	margin-top:23px;
	}
	.point_title, .nowAddPoint, .have_point{
	display:inline-block;
	}
	.point_title{
	font-size:18px;
	font-weight:bold;
	margin-right:20px;
	}
	.nowAddPoint{
	margin-left:100px;
	background-color:#ddd;
	padding:15px;
	font-size:14px;
	}
	.have_point{
	margin-left:30px;
	color:#2890f1;
	}
	.credit_card{
	background-color:white;
	padding:16px;
	font-size:14px;
	font-weight:bold;
	border:1px solid #2890f1;
	width:90px;
	text-align:center;
	}
    </style>
    <script>
    	var js_sale_price = ${sale_price};
    	var js_total_price = ${total_price};
    	var js_add_point = js_total_price * 0.03;
    $(function(){
    	
    	$("#sale_price_content").text(js_sale_price.toLocaleString());
    	$("#tatal_price_content").text(js_total_price.toLocaleString());
    	$("#nowAddPoint").text(js_add_point.toLocaleString());
    	$(".btn2").text(js_total_price.toLocaleString()+"원 결제하기");
    	
    	$(".use_point").change(function(){
    		js_sale_price = ${sale_price};
    		js_total_price = ${total_price};
    		$(".use_point").val();
    		if($(".use_point").val() > $(".member_point").val()){
    			alert("보유한 적립금보다 많이 사용할 수 없습니다.");
    			$('.use_point').val('');
    		} else if($(".use_point").val() < 2000 ){
    			alert("적립금은 2,000원부터 사용할 수 있습니다.");
    			$('.use_point').val('');
    			js_sale_price = ${sale_price};
    			js_total_price = ${total_price};
    			js_add_point = js_total_price * 0.03;
    			$("#sale_price_content").text(js_sale_price.toLocaleString());
    	    	$("#tatal_price_content").text(js_total_price.toLocaleString());
    	    	$("#nowAddPoint").text(js_add_point.toLocaleString());
    	    	$(".btn2").text(js_total_price.toLocaleString()+"원 결제하기");
    		} else {
    			js_sale_price = parseInt(js_sale_price)+ parseInt($(".use_point").val());
    			js_total_price = js_total_price - $(".use_point").val();
    			js_add_point = js_total_price * 0.03;
    			$("#sale_price_content").text(js_sale_price.toLocaleString());
    	    	$("#tatal_price_content").text(js_total_price.toLocaleString());
    	    	$("#nowAddPoint").text(js_add_point.toLocaleString());
    	    	$(".btn2").text(js_total_price.toLocaleString()+"원 결제하기");
    		}
    	});
    
    });
    function fn_allPoint(){
    	$('.use_point').val($(".member_point").val());
    	js_sale_price = ${sale_price};
		js_total_price = ${total_price};
    	js_sale_price = parseInt(js_sale_price)+ parseInt($(".use_point").val());
		js_total_price = js_total_price - $(".use_point").val();
		js_add_point = js_total_price * 0.03;
		$("#sale_price_content").text(js_sale_price.toLocaleString());
    	$("#tatal_price_content").text(js_total_price.toLocaleString());
    	$("#nowAddPoint").text(js_add_point.toLocaleString());
    	$(".btn2").text(js_total_price.toLocaleString()+"원 결제하기");
    }
    
    function fn_order_now(){
    	if($("#bank_select").val() == 'none'){
    		alert("카드사를 선택해 주세요.");
    		 $('#bank_select').focus();
    	} else {
        	$("#o_total_price").attr("value", ${original_price});
        	$("#o_sale_price").attr("value", js_sale_price);
        	$("#o_pay_price").attr("value", js_total_price);
        	if($('.use_point').val() == null || $('.use_point').val() == ''){
        		$("#o_use_point").attr("value","0");
        	} else{
        		$("#o_use_point").attr("value",$('.use_point').val());
        	}
        	$("#o_add_point").attr("value", $("#nowAddPoint").text());
        	$("#o_credit_conpany").attr("value", $("#bank_select option:selected").val());
        	$("#o_credit_installment").attr("value", $("#pay_select option:selected").val());
        	$(".order_form").submit();
    	}
    	
    }
    </script>
  </head>
  <body>
    <div class="order_detail">
      <div>
        <h2>주문/결제</h2>
      </div>
      <div class="under-line"></div>
      <h3><strong>주문자 정보</strong></h3>
      <div class="center">
        <!-- 내용을 가운데 정렬하기 위해 center 클래스 추가 -->
        ${member.name } / ${member.phone1 }-${member.phone2 }-${member.phone3 } / 
        ${member.email1 }@${member.email2 }
        <a href="${contextPath }/member/mypage/memberDetail.do">주문자 정보변경 &gt;</a>
      </div>
      <div class="under-line"></div>
      <c:if test="${! empty orderMap.orderShoppingList }">
      <c:forEach var="shopping" items="${orderMap.orderShoppingList }">
      <h3>배송지 정보</h3>
      <div class="container">
        <label class="label"
          >받는분<input type="text" name="name" style="width: 500px"
        /></label>
        <label class="checkbox-label"
          ><input type="checkbox" />주문자 정보와 동일</label
        >
      </div>
      <div>
        <!-- 내용을 가운데 정렬하기 위해 center 클래스 추가 -->
        <label
          >주소<input
            type="text"
            name="zipcode"
            placeholder="우편번호"
            style="width: 200px"
        /></label>
        <input
          type="text"
          name="deliveryAddr1"
          placeholder="번지주소"
          style="width: 500px"
        />
        <input type="button" value="우편번호 찾기" />
      </div>
      <div>
        <!-- 내용을 가운데 정렬하기 위해 center 클래스 추가 -->
        <input
          type="text"
          name="deliveryAddr2"
          style="margin-left: 35px"
          placeholder="상세주소"
          style="width: 500px"
        />
      </div>
      <div>
        <!-- 내용을 가운데 정렬하기 위해 center 클래스 추가 -->
        <label
          >휴대전화<input type="text" name="name" style="width: 70px"
        /></label>
        -
        <input type="text" name="name" style="width: 70px" />
        -
        <input type="text" name="name" style="width: 70px" />
      </div>
      <div>
        <h3>배송상품</h3>
      </div>
      <div style="display: flex; align-items: center">
        <!-- 이미지를 왼쪽으로 정렬 -->
        <div style="float: left; margin-right: 10px">
          <img
            src="images/food.png"
            alt="운동시설 상세정보"
            style="width: 100px; height: 70px; vertical-align: middle"
          />
        </div>
        <div>
          <span style="font-size: 18px">닭가슴살 패키지 </span><br />
          1세트
          <h2 style="text-align: right; margin-top: 0">26,000원</h2>
        </div>
      </div>
      <label
        >배송 요청사항<input type="text" name="name" style="width: 500px"
      /></label>
      <div class="under-line"></div>
      </c:forEach>
      </c:if>
      
      <c:if test="${! empty orderMap.orderBusinessList or ! empty orderMap.orderTrainerList}">
      <c:set var="business_count" value="${orderMap.orderBusinessList.size() + orderMap.orderTrainerList.size() }"/>
      <div><h3>이용상품 ${business_count }개</h3></div>
      <c:forEach var="order" items="${orderMap.orderCartList }">
       <c:set var="option" value="${order.goods_option }"/>
 		<c:set var="goods_id" value="${order.goods_id }"/>
      <c:forEach var="place" items="${orderMap.orderBusinessList }">
      <c:if test="${place.goods_id eq  goods_id}">
       <c:choose>
 		<c:when test="${option eq 'prod1retail'}">
 		<c:set var="option_pc" value="1개월"/>
 		<c:set var="original" value="prod1"/>
 		</c:when>
 		<c:when test="${option eq 'prod3retail'}">
 		<c:set var="option_pc" value="3개월"/>
  		<c:set var="original" value="prod3"/>
 		</c:when>
 		<c:when test="${option eq 'prod6retail' }">
		<c:set var="option_pc" value="6개월"/>
 		<c:set var="original" value="prod6"/>
 		</c:when>
 		<c:otherwise>
 		<c:set var="option_pc" value="12개월"/>
 		<c:set var="original" value="prod12"/>
 		</c:otherwise>
 		</c:choose>
        <!-- 이미지를 왼쪽으로 정렬 -->
        <div class="detail">
                 <div class="content_img">
		<img src="${contextPath}/download.do?cate=place&imageFileName=${place.fileName}&bno=${place.goods_id}" alt="운동시설 메인이미지">
        </div>
        <div class="titleandoption">
		<div class="list_title">${place.b_name }</div>
		<div class="list_option">${option_pc }</div>
		</div>
		<c:set var="price" value="${place[option]}"/>
 		<c:set var="original_Price" value="${place[original] }"/>
 		<c:choose>
 <c:when test="${price ne original_Price }">
 <div class="price_box">
 <div class="original_price">
 <fmt:formatNumber type="number" maxFractionDigits="3" value="${original_Price}" />원
 </div>
<div class="sale_price">
<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원
</div>
</div>
 </c:when>
 <c:otherwise>
  <div class="price_box">
 <fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원
 </div>
 </c:otherwise>
 </c:choose>
        </div>
      </c:if>
      </c:forEach>
      <c:forEach var="trainer" items="${orderMap.orderTrainerList }">
      
      </c:forEach>
      </c:forEach>
      </c:if>
      
        <div class="under-line"></div>
      <div class="point_box">
        <div class="point_title">포인트 사용</div>
        <input type="text" class="use_point" name="use_point" placeholder="0"oninput="this.value = this.value.replace(/[^0-9]/g, '');" />
        <button class="button useAllpoint" onclick="fn_allPoint()">전액사용</button>
        <input type="hidden" name="member_point" class="member_point" value="${member.memberPoint}">
        <div class="have_point">보유포인트
         <fmt:formatNumber type="number" maxFractionDigits="3" value="${member.memberPoint}" />
        </div>
       <div class="nowAddPoint">
        적립 예정 포인트  
        <span id="nowAddPoint"></span>
        </div>
      </div>
      <div class="under-line"></div>
      <div class="order_price">
	<div class="order_price_box">
	<div class="price_title">
	상품 금액
	</div>
	<div class="price_content">
	<fmt:formatNumber type="number" maxFractionDigits="3" value="${original_price}" />
	<span class="won">원</span>
	</div>
	</div>
	<div class="price_mark">-</div>
	<div class="order_price_box">
	<div class="price_title">
	할인 금액
	</div>
	<div class="price_content">
	<span id="sale_price_content"></span>
	<span class="won">원</span>
	</div>
	</div>
	<div class="price_mark">=</div>
	<div class="order_price_box">
	<div class="price_title">
	최종 결제 금액
	</div>
	<div class="price_content" >
	<span id="tatal_price_content"></span>
	<span class="won">원</span>
	</div>
	</div>
      </div>
      <div class="under-line"></div>

      <h3>결제 방법 선택</h3>
      <div class="credit_card">
          신용카드
      </div>
      <div class="container" style="margin-top: 20px">
        <select name="language" id="bank_select">
          <option value="none">[필수] 카드사를 선택하세요</option>
          <option value="삼성카드">삼성카드</option>
          <option value="우리카드">우리카드</option>
          <option value="신한카드">신한카드</option>
          <option value="현대카드">현대카드</option>
        </select>
        <select name="language" id="pay_select" >
          <option value="일시불">일시불</option>
          <option value="3개월">3개월</option>
          <option value="6개월">6개월</option>
          <option value="12개월">12개월</option>
        </select>
      </div>
      <div class="order_button">
        <button class="btn2" onclick="fn_order_now()"></button>
      </div>
      <form class="order_form" action="${contextPath}/member/order/orderPay.do" method="post">
      <input type="hidden" id="o_total_price" name="total_price">
      <input type="hidden" id="o_sale_price" name="sale_price">
      <input type="hidden" id="o_pay_price" name="pay_price">
      <input type="hidden" id="o_use_point" name="use_point">
      <input type="hidden" id="o_add_point" name="add_point">
      <input type="hidden" id="o_credit_conpany" name="credit_company">
      <input type="hidden" id="o_credit_installment" name="credit_installment">
      </form>
    </div>
  </body>
</html>
