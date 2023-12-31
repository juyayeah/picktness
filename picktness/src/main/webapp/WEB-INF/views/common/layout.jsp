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
<script src="//code.jquery.com/jquery-3.6.4.min.js"></script>
<script
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />

<style>
body {
	width: 100%;
	margin: 0px auto;
	border: 0px solid #bcbcbc;
}

#header {
	position: relative;
	width: 100%;
	z-index: 20;
	background-color: #fff;
}

#quickmenu {
	position: sticky;
	z-index: 3;
	top: 10px;
}

#content {
	width: 100%;
	border: 0px solid #bcbcbc;
}

#footer {
	clear: both;
}

#talk {
	position: fixed;
	right: 15px;
	bottom: 15px;
}

.not_modal {
	position: fixed;
	z-index: 99;
	left: 0;
	top: 0;
	background: rgba(0, 0, 0, 0.52);
	width: 100%;
	height: 100vh;
	visibility: hidden;
}
</style>
<title><tiles:insertAttribute name="title" /></title>
</head>
<body>
	<div id="header">
		<tiles:insertAttribute name="header" />
	</div>
	<div id="quickmenu">
		<tiles:insertAttribute name="quickmenu" />
	</div>
	<div id="content">
		<tiles:insertAttribute name="body" />
	</div>
	<div id="footer">
		<tiles:insertAttribute name="footer" />
	</div>
	<div id="talk">
		<tiles:insertAttribute name="talk" />
	</div>
	<div class="not_modal"></div>
</body>
</html>
