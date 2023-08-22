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
<meta charset="utf-8">
<title>정산내역</title>
<style>
.bodybody div {
	position: relative;
	width: 860px;
	margin: 0 auto;
}

.bodybody a {
	background: transparent;
	text-decoration: none;
	color: inherit;
}

.bodybody ul {
	list-style: none;
}

.bodybody em {
	font-size: 15px;
	color: #2890f1;
	font-weight: 800;
}

.bodybody th {
	width: 10%;
	background-color: #cfe6fc;
	color: #000;
}

.bodybody td {
	padding: 10px;
	width: 10%;
	background-color: #fff;
	border: solid 1px #e7f3fd;
}

.bodybody table {
	width: 860px;
	min-width: 600px;
	border-collapse: collapse;
}

.bodybody b {
	color: #2089f1;
	font-size: 20px
}

/* .td_first {
	width: 20%;
	align: right;
}

.td_second {
	width: 5%;
}

.td_third {
	width: 40%;
	align: left;
	size: 40px;
} */

/* 테이블부분 */
.listcontent a {
	background: transparent;
	text-decoration: none;
	color: inherit;
}

.listcontent td {
	max-width: 0;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.tableWrapper {
	width: 860px;
	height: auto;
	max-height: 300px;
	background-color: white;
	overflow: auto;
}
/* 스크롤바 */
#userListTable {
	width: 860px;
	border: 0px;
	border-collapse: collapse;
}

#userListTable th {
	padding: 5px;
	border-right: 1px solid lightgray;
}

#userListTable td {
	border-right: 1px solid lightgray;
	border-left: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
}

#userListTable th:last-child, #userListTable td:last-child {
	border-right: 1px solid lightgray;
}

#userListTable tr:first-child {
	background-color: #2890f1 !important;
	color: white !important;
	font-weight: bold !important;
}

#userListTable tr:nth-child(odd) {
	background-color: white;
}

#userListTable th {
	position: sticky;
	top: 0px;
	background-color: #2890f1 !important;
}

.tableWrapper th {
	background-color: #2890f1;
	color: #ffffff;
}

.tableWrapper table th:first-child {
	border-top-left-radius: 8px;
}

.tableWrapper table th:last-child {
	border-top-right-radius: 8px;
	
}
/* .bodybody table th:first-child {
	border-top-left-radius: 8px;
	border-bottom-left-radius: 8px;
}

.bodybody table th:last-child {
	border-top-right-radius: 8px;
	border-bottom-right-radius: 8px;
	
} */

#btn {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	margin-right: -4px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: -3px;
	border: 1px solid #2890f1;
	background-color: #cfe6fc;
	color: #2890f1;
	font-size: 12px;
	padding: 2px 10px;
}

#btn:hover {
	color: white;
	background-color: #2890f1;
}

</style>
</head>
<body>
	<div class="listcontent">
		<h2 align="center">정산내역</h2>
				<div style="float:right; margin-bottom:2px;">조회기간<input name="search_date" type="date"
					size="40">~<input name="search_date" type="date" size="40"> <button id="btn" value="검색"> 검색</button></div>
					</div>
<br>
		<div class="tableWrapper">
			<table id="userListTable">
				<tr style="cursor: default;">
					<th width="10%">회차</th>
					<th width="20%">정산금액</th>
					<th width="15%">정산날짜</th>
				</tr>

				<!-- 조건리스트 -->
				<%-- 				<c:choose>
					<c:when test="${empty trainerList}">
						<tr height="10">
							<td colspan="6">
								<p align="center">
									<b><span style="font-size: 9pt;">등록된 트레이너가 없습니다.</span></b>
								</p>
							</td>
						</tr> --%>
				<!-- 하드코딩 -->
				<tr align="center">
					<td><a href="${contextPath}/business/mypage/settlementDetail.do">1</a></td>
					<td><a href="${contextPath}/business/mypage/settlementDetail.do">800,000</a></td>
					<td>2023-05-01</td>
				</tr>
				<!-- 하드코딩 끝-->
				<%-- </c:when>
					<c:when test="${!empty trainerList }">
				<c:forEach var="trainer" items="${trainerList }">
					<tr align="center">
						<td><a href="${contextPath}/business/mypage/settlementDetail.do">${}</a></td>
						<td><a href="${contextPath}/business/mypage/settlementDetail.do">${}</a></td>
						<td>${ }</td>
					</tr>
				</c:forEach>
				</c:when>
				</c:choose> --%>
			</table>
			<div align="right"><span style="font-size: 13px; color: #2089f1;">* 정산금은 월(1일~말일) 단위로 다음달 15일(주말 및 공휴일 다음날)에 입금됩니다.</span></div>
		</div>
</body>
</html>