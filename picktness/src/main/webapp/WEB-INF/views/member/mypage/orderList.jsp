<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <style></style>
    <title>주문내역</title>
    <style>
    .content-inner{
    margin:30px;
    }
    .content-title{
    	width:100%;
	font-size:18px;
	font-weight:bold;
	text-align:center;
	margin:20px 0px;
    }
    .main_box{
    margin:10px;
    border:1px solid #ddd;
    padding:10px;
    }
      .detail{
      margin: 20px 0px;
      border:1px solid #ddd;
      padding:10px;
      }
             .content_img {
      display:inline-block;
      text-align:center;
      }
            .content_img img {
      width:122px;
      }
            .titleandoption{
      vertical-align: 25px;
      display:inline-block;
      width:400px;
      }
      .list_title{
      margin:5px 0px 9px 0px;
      }
            .price_box{
     display:inline-block;
      width:250px;
      }
      	.original_price{
	text-decoration: line-through;
	font-size:13px;
	}
	.after_button{
	display:inline-block;
	text-align:center;
	vertical-align: 43px;
	}
	.notyet{
	color:#ccc;
	}
	.total_price{
	text-align:right;
	font-weight:bold;
	font-size:17px;
	}
	.state-before{
	color:tomato;
	}
	.state-ing{
	color:#2890f1;
	}
	.state-end{
	color:green;
	}
    </style>
    <script>
    </script>
  </head>
  <body>
    <div class="content-inner">
    <div class="content-title">
 	주문내역
    </div>
    <c:forEach var="order" items="${orderTotalList }">
    <div class="main_box">
    <div class="order_date">${order.orderDate } 주문</div>
    <div class="order_num"><a href="">주문번호 ${order.order_num } 주문 상세</a></div>
    <c:forEach var="place" items="${orderBusinessList}">
    <c:if test="${order.order_num eq place.order_num }">
    <c:set var="state" value="${place.state }"/>
    
    <div class="detail">
    <div class="content_img">
	<img src="${contextPath}/download.do?cate=place&imageFileName=${place.fileName}&bno=${place.goods_id}" alt="운동시설 메인이미지">
	</div>
    <div class="titleandoption">
    <c:choose>
    <c:when test="${state eq '사용전'}">
    <div class="state-before">${state }</div>
    </c:when>
    <c:when test="${state eq '사용중' }">
    <div class="state-ing">${state }</div>
    </c:when>
    <c:otherwise>
    <div class="state-end">${state }</div>
    </c:otherwise>
    </c:choose>
	<div class="list_title">${place.goods_title }</div>
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
 		<div class="price_box">
 		<c:choose>
<c:when test="${place.original_price ne place.retail_price }">
 <span class="original_price">
 <fmt:formatNumber type="number" maxFractionDigits="3" value="${place.original_price}" />원
 </span>
<span class="retail_price">
<fmt:formatNumber type="number" maxFractionDigits="3" value="${place.retail_price}" />원
</span>
</c:when>
<c:otherwise>
<span class="retail_price">
<fmt:formatNumber type="number" maxFractionDigits="3" value="${place.retail_price}" />원
</span>
</c:otherwise>
</c:choose>
<span>${option_pc }</span>
</div>
</div>
<div class="after_button">
<c:choose>
<c:when test="${state ne '사용전'}">
<div>
<span class="notyet">취소/환불</span>
</div>
</c:when>
<c:otherwise>
<div>
<a href="">취소/환불</a>
</div>
</c:otherwise>
</c:choose>
<c:choose>
<c:when test="${place.state eq '사용전'}">
<div>
<span class="notyet">리뷰 작성하기</span>
</div>
</c:when>
<c:otherwise>
<div>
<a href="">리뷰 작성하기</a>
</div>
</c:otherwise>
</c:choose>
</div>
    </div>
    </c:if>
    </c:forEach>
    <c:forEach var="trainer" items="${orderTrainerList }">
    <c:if test="${order.order_num eq trainer.order_num }">
    
    </c:if>
    </c:forEach>
     <div class="total_price">
    총 <fmt:formatNumber type="number" maxFractionDigits="3" value="${order.pay_price}" />원
    </div>
    </div>
    </c:forEach>
    </div>
  </body>
</html>
