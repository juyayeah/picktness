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
      .location_search {
        background-color: #2890f1;
        border-radius: 13px;
        width: 430px;
        height: 40px;
        text-align: center;
        margin: 50px auto;
        padding-top: 15px;
        padding-left: 30px;
      }
      .location_search img {
        width: 25px;
        position: absolute;
        top: 15x;
        left: 340px;
      }
      .location_search {
        color: #fff;
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
	height: 40px;
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
<title>픽트니스 쇼핑</title>
</head>
<body>
	<div class="shopping_main_inner">
	    <div class="location_search">
        <img src="${contextPath}/images/main/location.png" />
        <div class="location_search_text">
          ${memLocation }
        </div>
      </div>
		<img class="shop_banner"
			src="${contextPath}/images/main/shop_banner.png" />
		<div class="main_box">
			<c:choose>
				<c:when test="${!empty placeList }">
				<div class="main_cate">헬스</div>
					<c:forEach items="${placeList }" var="place">
						<div class="main_item" onClick="location.href='#'">
							<img class="main_img"
								src="${contextPath}/images/main/health4.jpg" /> <span
								class="title">${place.b_name }</span> <span class="location">${place.addrBasic }
							</span> <span class="location"> <fmt:formatNumber pattern="0.0"
									value="${place.distance/1000 }" />km
							</span> <span class="price">${place.prod1retail }/월 </span>
							<div class="cates">
								<c:if test="${place.allTime == 'Y' }">
									<div class="cate">24시간</div>
								</c:if>
								<div class="cate">${place.cate }</div>
							</div>
							<c:if test="${place.review_count ne 0 }">
								<div class="star">
									<img src="${contextPath}/images/main/star.png" /> <span
										class="star">${place.review_star }(${place.review_count })</span>
								</div>
							</c:if>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
	</div>
</body>
</html>
