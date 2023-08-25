<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<style>
.shopping_main_inner{
	position: relative;
	max-width: 1100px;
	margin: 0 auto 50px auto;
}
.shop_banner {
margin-top:-12px;
	width: 100%;
}

</style>
<title>픽트니스 쇼핑</title>
</head>
<body>
<div class="shopping_main_inner">
	<img class="shop_banner"
		src="${contextPath}/images/main/shop_banner.png" />
		
</div>
</body>
</html>
