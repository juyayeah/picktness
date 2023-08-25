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

    </style>
    <script>
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
					href="${contextPath}/goods/shopFoodList.do?cate=protain">프로틴</a></li>
			</ul>
		</div>
		<div class="order_by">
		<ul>
		<li id="row">
		<a href="${contextPath }/goods/shopFoodList.do?orderBy=row">가격낮은순</a>
		</li>
		<li id="best">
		<a href="${contextPath }/goods/shopFoodList.do?orderBy=best">추천순</a>
		</li>
		</ul>
		</div>
		
		
  </div>
  </body>
</html>
