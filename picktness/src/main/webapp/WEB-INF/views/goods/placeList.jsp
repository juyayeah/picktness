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
.content-inner {
	position: relative;
	max-width: 1100px;
	margin: 0 auto 50px auto;
}

.content_title {
	margin-top: 10px;
	font-size: 20px;
}

.member_location {
	margin: 10px 0px;
}

.map_button1 {
	display: inline-block;
	border-radius: 13px;
	background-color: #2890f1;
	width: fit-content;
	padding: 8px 14px 8px 8px;
	margin-right: 10px;
}

.map_button1 img {
	width: 25px;
}

.map_button1 span {
	vertical-align: super;
	font-size: 14px;
	color: white;
	margin-bottom: 15px;
}

.map_button2 {
	display: inline-block;
	border-radius: 13px;
	background-color: #2890f1;
	width: fit-content;
	padding: 8px 14px 8px 8px;
}

.map_button2 img {
	width: 25px;
}

.map_button2 span {
	vertical-align: super;
	font-size: 14px;
	color: white;
	margin-bottom: 15px;
}

.pc_cate ul {
	height: 30px;
	border-bottom: solid 1px #ccc;
}

.pc_cate li {
	float: left;
	margin: 0px 20px 30px 0px;
	cursor: pointer;
}

.order_by li {
	font-size: 13px;
	float: right;
	margin: 0px 0px 30px 10px;
	color: #ccc;
	cursor: pointer;
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
.list_null{
clear:both;
margin-top:100px;
text-align:center;
height:300px;
}
.pageBar{
width:100%;
margin-top:40px;
text-align:center;
}
.pageButton{
display:inline-block;
width:30px;
height:25px;
padding-top:5px;
text-align:center;
font-weight:bold;
}
.pageButtonNow{
display:inline-block;
width:30px;
height:25px;
padding-top:4px;
text-align:center;
border:1px solid #2890f1;
font-weight:bold;
color:#2890f1;
}
.pageButtonText{
display:inline-block;
width:100px;
height:24px;
padding-top:6px;
margin:0px 10px;
color:#a6a6a6;
font-size:14px;
}
</style>
<script>
	$(function() {
		switch ("${cate}") {
		case "all":
			$("#allcate").css("font-weight", "bold");
			break;
		case "health":
			$("#health").css("font-weight", "bold");
			break;
		case "cross":
			$("#cross").css("font-weight", "bold");
			break;
		case "yoga":
			$("#yoga").css("font-weight", "bold");
			break;
		case "pila":
			$("#pila").css("font-weight", "bold");
			break;
		case "boxing":
			$("#boxing").css("font-weight", "bold");
			break;
		case "jiu":
			$("#jiu").css("font-weight", "bold");
			break;
		case "allTime":
			$("#allTime").css("font-weight", "bold");
			break;
		}
	});
</script>
<title>운동시설리스트</title>
</head>
<body>
	<div class="content-inner">
		<div class="content_title">운동시설</div>
		<div class="member_location">${memLocation }</div>
		<div class="change_location">
			<div class="map_button1">
				<img src="${contextPath}/images/main/location.png" /> <span>위치
					변경하기</span>
			</div>
			<div class="map_button2">
				<img src="${contextPath}/images/goods/map.png" /> <span>지도로
					보기</span>
			</div>
		</div>
		<div class="pc_cate">
			<ul>
				<li id="allcate"><a
					href="${contextPath}/goods/placeList.do?cate=all">전체보기</a></li>
				<li id="health"><a
					href="${contextPath}/goods/placeList.do?cate=health">헬스</a></li>
				<li id="cross"><a
					href="${contextPath}/goods/placeList.do?cate=cross">크로스핏</a></li>
				<li id="yoga"><a
					href="${contextPath}/goods/placeList.do?cate=yoga">요가</a></li>
				<li id="pila"><a
					href="${contextPath}/goods/placeList.do?cate=pila">필라테스</a></li>
				<li id="boxing"><a
					href="${contextPath}/goods/placeList.do?cate=boxing">복싱</a></li>
				<li id="jiu"><a
					href="${contextPath}/goods/placeList.do?cate=jiu">주짓수</a></li>
				<li id="allTime"><a href="${contextPath }/goods/placeList.do?cate=allTime">24시간</a></li>
			</ul>
		</div>
		<c:choose>
		<c:when test="${!empty placeList }">
		<div class="main_box">
			<c:forEach items="${placeList }" var="place">
				<div class="main_item"
					onclick="location.href='${contextPath}/goods/gymDetail.do'">
					<img class="main_img" src="${contextPath}/images/main/health4.jpg" />
					<span class="title">${place.b_name }</span>
					<span class="location">${place.addrBasic } 
					</span>
					<span class="location"><fmt:formatNumber pattern="0.0" value="${place.distance/1000 }"/>km</span>
					<span class="price">${place.prod1retail }/월 </span>
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
			<div class="pageBar">
			<c:choose>
			<c:when test="${totalGoods > 100}">
			<c:forEach var="page" begin="1" end="10" step="1">
			<c:if test="${section > 1 && page == 1 }">
			<div class="pageButtonText">
			<a href="${contextPath }/goods/placeList.do?cate=${cate }&section=${section-1 }&pageNum=${(section-1)*10 + 1 }">이전페이지</a>
			</div>
			</c:if>
			<c:choose>
			<c:when test="${page==pageNum }">
			<div class="pageButtonNow">
			<a href="${contextPath }/goods/placeList.do?cate=${cate}&section=${section}&pageNum=${page}">${(section-1)*10+page }</a>
			</div>
			</c:when>
			<c:otherwise>
			<div class="pageButton">
			<a href="${contextPath }/goods/placeList.do?cate=${cate}&section=${section}&pageNum=${page}">${(section-1)*10+page }</a>
			</div>
			</c:otherwise>
			</c:choose>
			<c:if test="${page==10 }">
			<div class="pageButtonText">
			<a href="${conteatPath }/goods/placeList.do?cate=${cate }&section=${section+1 }&pageNum=${(section*10)+1 }">다음페이지</a>
			</div>
			</c:if>
			</c:forEach>
			</c:when>
			<c:when test="${totalGoods == 100 }">
			<c:forEach var="page" begin="1" end="10" step="1">
			<c:choose>
			<c:when test="${page==pageNum }">
			<div class="pageButtonNow">
			<a href="${contextPath }/goods/placeList.do?cate=${cate}&section=${section}&pageNum=${page}">${page }</a>
			</div>
			</c:when>
			<c:otherwise>
			<div class="pageButton">
			<a href="${contextPath }/goods/placeList.do?cate=${cate}&section=${section}&pageNum=${page}">${page }</a>
			</div>
			</c:otherwise>
			</c:choose>
			</c:forEach>
			</c:when>
			<c:when test="${totalGoods <100 }">
			<c:forEach var="page" begin="1" end="${(totalGoods-1)/12+1 }" step="1">
			<c:choose>
			<c:when test="${page==pageNum }">
			<div class="pageButtonNow">
			<a href="${contextPath }/goods/placeList.do?cate=${cate}&section=${section}&pageNum=${page}">${page }</a>
			</div>
			</c:when>
			<c:otherwise>
			<div class="pageButton">
			<a href="${contextPath }/goods/placeList.do?cate=${cate }&section=${section }&pageNum=${page }">${page }</a>
			</div>
			</c:otherwise>
			</c:choose>
			</c:forEach>
			</c:when>
			</c:choose>
			</div>
			</c:when>
			<c:otherwise>
			<div class="list_null">
            <img src="${contextPath}/images/goods/exclamation.png">
            <p>현재 위치 주변에 운동시설이 없습니다.<br>
            위치를 바꾸고 다시 시도해 주세요.</p>
          </div>
			</c:otherwise>
			</c:choose>
		</div>
</body>
</html>
