<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<style>
.container-inner{
  width:1100px;
  margin:0 auto;
  position: relative;
}
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
      width:600px;
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
	.content-inner{
	margin:30px 60px;
	}
	.order_now{
	text-align:center;
	margin:80px 0px;
	}
	.main_button{
	background-color:white;
	padding:16px;
	font-size:14px;
	font-weight:bold;
	border:1px solid #ddd;
	margin:10px;
	}
	.order_button{
	background-color:#2890f1;
	padding:16px 30px;
	font-size:14px;
	color:white;
	font-weight:bold;
	border:1px solid #2890f1;
	}
	.howPay{
	display:inline-block;
	vertical-align:top;
	width:50%;
	}
	.addPoint{
	display:inline-block;
	vertical-align:top;
	}
</style>
</head>
<body>
<div class="container-inner">
<div class="content-inner">
<div class="center">
  <img src="${contextPath}/images/check.png" alt="체크표시" style="width: 200px; vertical-align: middle;">
</div>
<div class="center">
<p style="font-size:25px;">주문이 <strong>완료</strong> 되었습니다.</p>
</div>

<div>
<p style="font-size:20px;"><strong>주문번호</strong> ${orderDonMap.totalVO.order_num }</p>
</div>
<div class="under-line"></div>
<h3>주문 상품 내역</h3>
<div class="under-line"></div>
<c:if test="${! empty orderDonMap.orderBusinessList}">
<c:forEach var="business" items="${orderDonMap.orderBusinessList }">
<div class="detail">
<c:choose>
<c:when test="${fn:contains(business.goods_id, 'pc')}">
<div class="content_img">
<img src="${contextPath}/download.do?cate=place&imageFileName=${business.fileName}&bno=${business.goods_id}" alt="운동시설 메인이미지">
</div>
<div class="titleandoption">
<div class="list_title">${business.goods_title }</div>
       <c:choose>
 		<c:when test="${business.goods_option eq 'prod1retail'}">
 		<c:set var="option_pc" value="1개월"/>
 		</c:when>
 		<c:when test="${business.goods_option eq 'prod3retail'}">
 		<c:set var="option_pc" value="3개월"/>
 		</c:when>
 		<c:when test="${business.goods_option eq 'prod6retail' }">
		<c:set var="option_pc" value="6개월"/>
 		</c:when>
 		<c:otherwise>
 		<c:set var="option_pc" value="12개월"/>
 		</c:otherwise>
 		</c:choose>
<div class="list_option">${option_pc }</div>
</div>
</c:when>
<c:otherwise>
<div class="content_img">
<img src="${contextPath}/download.do?cate=trainer&imageFileName=${business.fileName}&bno=${business.goods_id}" alt="트레이너 메인이미지">
</div>
</c:otherwise>
</c:choose>
<div class="price_box">
<c:choose>
<c:when test="${business.original_price ne business.retail_price }">
 <div class="original_price">
 <fmt:formatNumber type="number" maxFractionDigits="3" value="${business.original_price}" />원
 </div>
<div class="retail_price">
<fmt:formatNumber type="number" maxFractionDigits="3" value="${business.retail_price}" />원
</div>
</c:when>
<c:otherwise>
<div class="retail_price">
<fmt:formatNumber type="number" maxFractionDigits="3" value="${business.retail_price}" />원
</div>
</c:otherwise>
</c:choose>
</div>
</div>
</c:forEach>
</c:if>
<c:if test="${! empty orderDonMap.orderShoppingList}">

</c:if>
<div class="under-line"></div>
<div>
<h3> 주문자 정보</h3>
<div>
<pre style="margin-left: 30px;">이름            ${member.name }</pre>
<pre style="margin-left:30px;">휴대전화        ${member.phone1 }-${member.phone2 }-${member.phone3 }</pre>
</div>
<div class="under-line"></div>
<h3> 결제 금액 </h3>
      <div class="order_price">
	<div class="order_price_box">
	<div class="price_title">
	상품 금액
	</div>
	<div class="price_content">
	<fmt:formatNumber type="number" maxFractionDigits="3" value="${orderDonMap.totalVO.total_price}" />
	<span class="won">원</span>
	</div>
	</div>
	<div class="price_mark">-</div>
	<div class="order_price_box">
	<div class="price_title">
	할인 금액
	</div>
	<div class="price_content">
	<fmt:formatNumber type="number" maxFractionDigits="3" value="${orderDonMap.totalVO.sale_price}" />
	<span class="won">원</span>
	</div>
	</div>
	<div class="price_mark">=</div>
	<div class="order_price_box">
	<div class="price_title">
	최종 결제 금액
	</div>
	<div class="price_content" >
	<fmt:formatNumber type="number" maxFractionDigits="3" value="${orderDonMap.totalVO.pay_price}" />
	<span class="won">원</span>
	</div>
	</div>
      </div>
</div>
<div class="under-line"></div>
<div class="bottom_box">
<div class="howPay">
<h3>결제 방법</h3>
<div class="bank">
<strong>신용카드 : </strong>${orderDonMap.totalVO.credit_company}
</div>
<div class="installment">
<strong>할부개월 : </strong>${orderDonMap.totalVO.credit_installment }
</div>
</div>
<div class="addPoint">
<h3>적립된 포인트</h3>
<div class="point">
${orderDonMap.totalVO.add_point }
</div>
</div>
</div>
 <div class="order_now">
 <a href="${contextPath }/main.do" class="main_button">쇼핑계속하기</a>
 <a href="${contextPath }/member/mypage/orderList.do" class="order_button">주문조회하기</a>
 </div>
</div>
</div>
</body>
</html>
