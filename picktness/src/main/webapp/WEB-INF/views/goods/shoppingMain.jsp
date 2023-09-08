<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<style>
.shopping_main_inner {
	position: relative;
	max-width: 1100px;
	margin: 0 auto 50px auto;
}

.shop_banner {
	margin-top: -12px;
	width: 100%;
}

.main_box {
	clear: both;
	text-align: left;
}

.main_cate {
	font-weight: bold;
	font-size: 35px;
	margin: 10px;
	text-align:center;
}

.main_item {
	cursor:pointer;
	vertical-align: top;
	position: relative;
	width: 200px;
	display: inline-block;
	margin: 10px 0px 10px 57px;
}

.main_img {
	position: relative;
	width: 200px;
}

.main_item .title {
	text-align: left;
	font-size: 15px;
	display: block;
	font-weight: bold;
	
}

.main_item .location {
	text-align: left;
	font-size: 12px;
	color: #555;
	display: block;
}

.main_item .price {
	text-align: left;
	font-size: 15px;
	display: block;
}
	.main_item .original_price{
	font-size:13px;
	text-decoration: line-through;
	}
.cates {
	text-align: left;
}

.cate {
	display: inline-block;
	border: 2px solid #bfbfbf;
	width: fit-content;
	padding: 4px 8px;
	margin: 5px 0px;
	border-radius: 10px;
	font-size: 13px;
}

.star img {
	width: 13px;
}

.star {
	text-align: left;
	font-size: 12px;
	color: #555;
}

.all_content {
	border: 2px solid #bfbfbf;
	width: fit-content;
	padding: 10px 40px;
	margin: 20px auto 40px auto;
	border-radius: 30px;
	font-size: 13px;
	cursor:pointer;
}

.all_content img {
	width: 11px;
}
.list_null{
clear:both;
margin-top:100px;
text-align:center;
height:300px;
}
</style>
<title>픽트니스 쇼핑</title>
</head>
<body>
	<div class="shopping_main_inner">
		<img class="shop_banner"
			src="${contextPath}/images/main/shop_banner.png" />
		<div class="main_box">
			<div class="main_cate">식품</div>
			<c:choose>
				<c:when test="${!empty foodList }">
					<c:forEach items="${foodList }" var="food">
						<div class="main_item" onclick="location.href='${contextPath}/goods/goodsDetail.do?goods_id=${food.goods_id}'">
							<img class="main_img"
								src="${contextPath}/download.do?cate=shop&imageFileName=${food.fileName}&bno=${food.goods_id}" /> <span
								class="title">${food.goods_title }</span> <span class="price">
			<c:choose>
              <c:when test="${food.priceOrigin ne food.priceRetail}">
                <span class="original_price">
                <fmt:formatNumber
                    type="number"
                    maxFractionDigits="3"
                    value="${food.priceOrigin}"
                  />원
                </span>
                <span class="price"
                  ><fmt:formatNumber
                    type="number"
                    maxFractionDigits="3"
                    value="${food.priceRetail}"
                  />원
                </span>
                </c:when>
                <c:otherwise>
                                <span class="price"
                  ><fmt:formatNumber
                    type="number"
                    maxFractionDigits="3"
                    value="${food.priceRetail}"
                  />원
                </span>
                </c:otherwise>
                </c:choose>
							</span>
							<c:if test="${food.review_count ne 0 }">
								<div class="star">
									<img src="${contextPath}/images/main/star.png" /> <span
										class="star">${food.review_star }(${food.review_count })</span>
								</div>
							</c:if>
						</div>
					</c:forEach>
											<div class="all_content" onclick="location.href='${contextPath }/goods/shopFoodList.do'">
							전체보기 <img src="${contextPath}/images/main/all_arrow.png" />
						</div>
				</c:when>
				<c:otherwise>
							<div class="list_null">
            <img src="${contextPath}/images/goods/exclamation.png">
            <p>현재 판매 중인 상품이 없습니다.<p>
          </div>
				</c:otherwise>
			</c:choose>
						<div class="main_cate">기구/용품/장비</div>
			<c:choose>
				<c:when test="${!empty goodsList }">
					<c:forEach items="${goodsList }" var="goods">
						<div class="main_item" onClick="location.href='#'">
							<img class="main_img"
								src="${contextPath}/download.do?cate=shop&imageFileName=${goods.fileName}&bno=${goods.goods_id}" /> <span
								class="title">${goods.goods_title }</span> <span class="price">
				<c:choose>
              <c:when test="${goods.priceOrigin ne goods.priceRetail}">
                <span class="original_price">
                <fmt:formatNumber
                    type="number"
                    maxFractionDigits="3"
                    value="${goods.priceOrigin}"
                  />원
                </span>
                <span class="price"
                  ><fmt:formatNumber
                    type="number"
                    maxFractionDigits="3"
                    value="${goods.priceRetail}"
                  />원
                </span>
                </c:when>
                <c:otherwise>
                                <span class="price"
                  ><fmt:formatNumber
                    type="number"
                    maxFractionDigits="3"
                    value="${goods.priceRetail}"
                  />원
                </span>
                </c:otherwise>
                </c:choose>
							</span>
							<c:if test="${goods.review_count ne 0 }">
								<div class="star">
									<img src="${contextPath}/images/main/star.png" /> <span
										class="star">${goods.review_star }(${goods.review_count })</span>
								</div>
							</c:if>
						</div>
					</c:forEach>
						<div class="all_content" onclick="location.href='${contextPath }/goods/shopGoodsList.do'">
							전체보기 <img src="${contextPath}/images/main/all_arrow.png" />
						</div>
				</c:when>
				<c:otherwise>
							<div class="list_null">
            <img src="${contextPath}/images/goods/exclamation.png">
            <p>현재 판매 중인 상품이 없습니다.<p>
          </div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>
