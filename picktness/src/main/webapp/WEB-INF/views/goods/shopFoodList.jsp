<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib prefix="tiles"
uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
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
.fd_cate ul {
	height: 30px;
	border-bottom: solid 1px #ccc;
}

.fd_cate li {
	float: left;
	margin: 0px 20px 30px 0px;
	cursor: pointer;
	font-size:14px;
}
.order_by li a {
	font-size: 12px;
	float: right;
	margin: 0px 0px 30px 10px;
	color: #ccc;
	cursor: pointer;
}
.main_box {
	clear: both;
	text-align: left;
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
.main_box .title {
	text-align: left;
	font-size: 15px;
	display: block;
	font-weight: bold;
	height:40px;
}
.main_box .price {
	text-align: left;
	font-size: 15px;
	display: block;
}
.star img {
	width: 13px;
}

.star {
	text-align: left;
	font-size: 12px;
	color: #555;
}

.main_item_soldOut{
	vertical-align: top;
	position: relative;
	width: 200px;
	height:350px;
	display: inline-block;
	margin: 10px 0px 10px 57px;
	}
.main_item_soldOut .main_img{
	filter: brightness(50%);
}
.soldOutImg{
position: relative;
}
.soldOutText{
position:absolute;
top:50%;
left:50%;
transform: translate( -50%, -50% );
color:#fff;
font-weight:bold;
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
    $(function(){
    	
    });
	$(function() {
		switch ("${cate}") {
		case "all":
			$("#allcate").css("font-weight", "bold");
			break;
		case "tender":
			$("#tender").css("font-weight", "bold");
			break;
		case "protain":
			$("#protain").css("font-weight", "bold");
			break;
		}
		switch("${orderBy}"){
		case "best":
			$("#best").css("font-weight", "bold");
			$("#best").children("a").css("color", "#555");
			break;
		case "row":
			$("#row").css("font-weight", "bold");
			$("#row").children("a").css("color", "#555");
			break;
		}
	});
    </script>
    <title>식품</title>
  </head>
  <body>
  <div class="content-inner">
  <div class="content_title">식품</div>
  <div class="fd_cate">
			<ul>
				<li id="allcate"><a
					href="${contextPath}/goods/shopFoodList.do?cate=all">전체보기</a></li>
				<li id="tender"><a
					href="${contextPath}/goods/shopFoodList.do?cate=tender">닭가슴살</a></li>
				<li id="protain"><a
					href="${contextPath}/goods/shopFoodList.do?cate=protain">프로틴 쉐이크</a></li>
			</ul>
		</div>
		<div class="order_by">
		<ul>
		<li id="row">
		<a href="${contextPath }/goods/shopFoodList.do?cate=${cate }&orderBy=row">가격낮은순</a>
		</li>
		<li id="best">
		<a href="${contextPath }/goods/shopFoodList.do?cate=${cate }&orderBy=best">추천순</a>
		</li>
		</ul>
		</div>
				<c:choose>
		<c:when test="${!empty foodList }">
		<div class="main_box">
			<c:forEach items="${foodList }" var="food">
			<c:choose>
				<c:when test="${food.goods_qty == 0}">
				<div class="main_item_soldOut"
					onclick="location.href='${contextPath}/goods/gymDetail.do'">
					<div class="soldOutImg">
					<img class="main_img" src="${contextPath}/images/main/health4.jpg" />
				    <div class="soldOutText">
					<p>품절</p>
					</div>
					</div>
					<span class="title">${food.goods_title }</span>
					<span class="price">${food.priceRetail }원 </span>
					<c:if test="${food.review_count ne 0 }">
					<div class="star">
						<img src="${contextPath}/images/main/star.png" /> 
						<span class="star">${food.review_star }(${food.review_count })</span>
					</div>
					</c:if> 
				</div>
				</c:when>
				<c:otherwise>
				<div class="main_item"
					onclick="location.href='${contextPath}/goods/gymDetail.do'">
					<img class="main_img" src="${contextPath}/images/main/health4.jpg" />
					<span class="title">${food.goods_title }</span>
					<span class="price">${food.priceRetail }월 </span>
					<c:if test="${food.review_count ne 0 }">
					<div class="star">
						<img src="${contextPath}/images/main/star.png" /> 
						<span class="star">${food.review_star }(${food.review_count })</span>
					</div>
					</c:if> 
				</div>
				</c:otherwise>
				</c:choose>
			</c:forEach>
			</div>
			<div class="pageBar">
			<c:choose>
			<c:when test="${totalGoods > 100}">
			<c:forEach var="page" begin="1" end="10" step="1">
			<c:if test="${section > 1 && page == 1 }">
			<div class="pageButtonText">
			<a href="${contextPath }/goods/shopFoodList.do?cate=${cate }&section=${section-1 }&pageNum=${(section-1)*10 + 1 }">이전페이지</a>
			</div>
			</c:if>
			<c:choose>
			<c:when test="${page==pageNum }">
			<div class="pageButtonNow">
			<a href="${contextPath }/goods/shopFoodList.do?cate=${cate}&section=${section}&pageNum=${page}">${(section-1)*10+page }</a>
			</div>
			</c:when>
			<c:otherwise>
			<div class="pageButton">
			<a href="${contextPath }/goods/shopFoodList.do?cate=${cate}&section=${section}&pageNum=${page}">${(section-1)*10+page }</a>
			</div>
			</c:otherwise>
			</c:choose>
			<c:if test="${page==10 }">
			<div class="pageButtonText">
			<a href="${conteatPath }/goods/shopFoodList.do?cate=${cate }&section=${section+1 }&pageNum=${(section*10)+1 }">다음페이지</a>
			</div>
			</c:if>
			</c:forEach>
			</c:when>
			<c:when test="${totalGoods == 100 }">
			<c:forEach var="page" begin="1" end="10" step="1">
			<c:choose>
			<c:when test="${page==pageNum }">
			<div class="pageButtonNow">
			<a href="${contextPath }/goods/shopFoodList.do?cate=${cate}&section=${section}&pageNum=${page}">${page }</a>
			</div>
			</c:when>
			<c:otherwise>
			<div class="pageButton">
			<a href="${contextPath }/goods/shopFoodList.do?cate=${cate}&section=${section}&pageNum=${page}">${page }</a>
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
			<a href="${contextPath }/goods/shopFoodList.do?cate=${cate}&section=${section}&pageNum=${page}">${page }</a>
			</div>
			</c:when>
			<c:otherwise>
			<div class="pageButton">
			<a href="${contextPath }/goods/shopFoodList.do?cate=${cate }&section=${section }&pageNum=${page }">${page }</a>
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
            <p>현재 판매 중인 상품이 없습니다.<p>
          </div>
			</c:otherwise>
			</c:choose>
		
  </div>
  </body>
</html>
