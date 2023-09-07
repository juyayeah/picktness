<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib prefix="tiles"
uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <style>
      .search_inner {
        width: 1100px;
        position: relative;
        margin: 0 auto;
        padding-top: 50px;
      }
      .search_title {
        font-weight: bold;
        font-size: 24px;
        color: #333;
      }
      .search_line {
        width: 1100px;
        height: 1px;
        background-color: #333;
        margin: 10px 0px;
      }
      .search_null{
        padding:50px;
        text-align: center;
      }
      .search_null_title{
        font-weight: bold;
        color: #2890F1;
        margin-left:10px;
      }
      .main_box {
	clear: both;
	text-align: left;
}

.main_cate {
	font-weight: bold;
	font-size: 35px;
	margin: 10px;
}

.main_item {
	vertical-align: top;
	position: relative;
	width: 200px;
	height:350px;
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
	height:40px;
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
    </style>
    <script>
      $(".input-search").attr("value", "${search_content}");
    </script>
    <title>검색창</title>
  </head>
  <body>
    <div class="search_inner">
      <span class="search_title">${search_content} 검색결과</span>

      <div class="search_line"></div>
      <c:choose>
      <c:when test="${empty result}">
                <div class="search_null">
            <img src="${contextPath}/images/goods/exclamation.png">
            <p><span class="search_null_title">${search_content}</span>에 대한 검색 결과가 없습니다.<br>
            검색어가 올바른지 확인 후 다시 검색해 주세요.</p>
          </div>
        </c:when>
        <c:otherwise>
        <c:if test="${not empty result.business }">
		<div class="main_box">
			<c:forEach items="${result.business }" var="place">
				<div class="main_item"
					onclick="location.href='${contextPath}/goods/placeDetail.do?goods_id=${place.goods_id }'">
					<img class="main_img" src="${contextPath}/download.do?cate=place&imageFileName=${place.fileName}&bno=${place.goods_id}" />
					<span class="title">${place.b_name }</span>
					<span class="location">${place.addrBasic } 
					</span>
					<span class="location"><fmt:formatNumber pattern="0.0" value="${place.distance/1000 }"/>km</span>
					<span class="price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${place.prod1retail}" />/월</span>
					<div class="cates">
						<c:if test="${place.allTime == 'Y' }">
							<div class="cate">24시간</div>
						</c:if>
						<div class="cate">${place.cate }</div>
					</div>
					<c:if test="${place.review_count ne 0 }">
					<div class="star">
						<img src="${contextPath}/images/main/star.png" /> 
						<span class="star">${place.review_star }(${place.review_count })</span>
					</div>
					</c:if> 
				</div>
			</c:forEach>
			</div>
        </c:if>
        <c:if test="${not empty result.trainer}">
        <c:forEach var="trainer" items="${result.trainer }">
        ${trainer.name }
        </c:forEach>
        </c:if>
        <c:if test="${not empty result.shopping }">
        <div class="main_box">
		<c:forEach var="shop" items="${result.shopping }">
<c:choose>
				<c:when test="${shop.goods_qty == 0}">
				<div class="main_item_soldOut"
					onclick="location.href='${contextPath}/goods/goodsDetail.do?goods_id=${shop.goods_id}'">
					<div class="soldOutImg">
					<img class="main_img" src="${contextPath}/download.do?cate=shop&imageFileName=${shop.fileName}&bno=${shop.goods_id}" />
				    <div class="soldOutText">
					<p>품절</p>
					</div>
					</div>
					<span class="title">${shop.goods_title }</span>
					<span class="price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${shop.priceRetail}" />원 </span>
					<c:if test="${shop.review_count ne 0 }">
					<div class="star">
						<img src="${contextPath}/images/main/star.png" /> 
						<span class="star">${shop.review_star }(${shop.review_count })</span>
					</div>
					</c:if> 
				</div>
				</c:when>
				<c:otherwise>
				<div class="main_item"
					onclick="location.href='${contextPath}/goods/goodsDetail.do?goods_id=${shop.goods_id}'">
					<img class="main_img" src="${contextPath}/download.do?cate=shop&imageFileName=${shop.fileName}&bno=${shop.goods_id}" />
					<span class="title">${shop.goods_title }</span>
					<span class="price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${shop.priceRetail}" />원 </span>
					<c:if test="${shop.review_count ne 0 }">
					<div class="star">
						<img src="${contextPath}/images/main/star.png" /> 
						<span class="star">${shop.review_star }(${shop.review_count })</span>
					</div>
					</c:if> 
				</div>
				</c:otherwise>
				</c:choose>
		</c:forEach>
        </div>
        </c:if>
          </c:otherwise>
          </c:choose>
    </div>
  </body>
</html>
