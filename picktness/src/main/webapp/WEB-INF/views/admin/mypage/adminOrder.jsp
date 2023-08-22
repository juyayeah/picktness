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
<title>Insert title here</title>
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

/* 테이블부분 */
.tableWrapper {
	width: 860px;
	height: auto;
	max-height: 300px;
	background-color: white;
	overflow: auto;
}
.tablebody table th:first-child {
	border-top-left-radius: 8px;
	border-bottom-left-radius: 8px;
}

.tablebody table th:last-child {
	border-top-right-radius: 8px;
	border-bottom-right-radius: 8px;
}

#btn {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	margin-right: -4px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: -3px;
	border: 1px solid #2890f1;
	font-size: 12px;
	padding: 2px 10px;
	color: white;
	background-color: #2890f1;
}

#btn:hover {
	background-color: #cfe6fc;
	color: #2890f1;
}

.oneline {
	display: inline;
}

.bodybody h4 {
	align: left;
	margin: 10px 0;
	display: inline;
}
</style>
</head>
<body>
	<div class="bodybody">
		<h2 align="center">상품 주문/결제관리</h2>

			<h4>거래현황(당일)</h4>
			<div class="tablebody">
			<table>
				<tr class="solid">
					<th>신규주문</th>
					<td align="right"><a href="#"><b>2</b></a>건</td>
					<th>취소완료</th>
					<td align="right"><a href="#"><b>{#}</b></a>건</td>
					<th>환불요청</th>
					<td align="right"><a href="#"><b>{#}</b></a>건</td>
					<th>환불완료</th>
					<td align="right"><a href="#"><b>{#}</b></a>건</td>
				</tr>
			</table>
			<br>
			<h4>주문/배송</h4>
			<span style="padding-left:430px;"> 조회기간 <input
				name="search_date" type="date" size="40">~<input
				name="search_date" type="date" size="40">
				<button id="btn" value="검색">검색</button></span>

			<table>
				<tr>
					<th>배송준비</th>
					<td align="right"><a href="#"><b>{#}</b></a>건</td>
					<th>배송중</th>
					<td align="right"><a href="#"><b>{#}</b></a>건</td>
					<th>배송완료</th>
					<td align="right"><a href="#"><b>{#}</b></a>건</td>
					<th></th>
					<td></td>
					<!-- <th></th>
<td align="right"><a href="#"><b>2</b></a>건</td> -->
				</tr>
			</table>
			</div>
						<br>
			<h4>거래 현황</h4>
			<span style="padding-left:430px;"> 조회기간 <input
				name="search_date" type="date" size="40">~<input
				name="search_date" type="date" size="40">
				<button id="btn" value="검색">검색</button></span>
				
				<div class="tablebodysec">
			<table>
				<tr>
					<th>결제완료</th>
					<td align="right"><a href="#"><b>2</b></a>건</td>
					<th>환불요청</th>
					<td align="right"><a href="#"><b>{#}</b></a>건</td>
					<th>환불완료</th>
					<td align="right"><a href="#"><b>{#}</b></a>건</td>
					<th>취소완료</th>
					<td align="right"><a href="#"><b>{#}</b></a>건</td>
				</tr>
				<tr>
					<th>배송</th>
					<td align="right"><a href="#"><b>2</b></a>건</td>
					<th>사업장정산</th>
					<td align="right"><a href="#"><b>{#}</b></a>건</td>
					<th>계</th>
					<td align="right"><a href="#"><b>{#}</b></a>건</td>
					<th></th>
					<td align="right"><a href="#"><b>{#}</b></a>건</td>
				</tr>
			</table>
			</div>
	
		</div>
		
</body>
</html>