<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib prefix="tiles"
uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>table</title>
<style>
/* * {
	box-sizing: border-box;
}
 */
.listcontent{
	position: relative;
 	max-width: 1100px;
	margin: 0 auto;
 }

a {
	background: transparent;
	text-decoration: none;
	color: inherit;
}

.tableWrapper {
	width: 800px;
	height: auto;
	max-height: 200px;
	background-color: white;
	overflow: auto;
}

#userListTable {
	width: 1100px;
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
	border-right: 0px !important;
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

th {
	background-color: #2890f1;
	color: #ffffff;
}

table th:first-child {
	border-top-left-radius: 8px;
}

table th:last-child {
	border-top-right-radius: 8px;
}

#btn {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	margin-right: -4px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: -3px;
	border: 1px solid #2890f1;
	background-color: rgba(0, 0, 0, 0);
	color: #2890f1;
	font-size:12px; 
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
		<div class="listcontentinner">
	<h2 align="center">사업자 관리</h2>

	<div align="justify">
 조회기간<input name="search_date" type="date" size="40">~<input name="search_date" type="date" size="40"> 상세검색 <select>
			<option value="전체" selected>전체</option>
			<option value="주문자번호">주문자번호</option>
			<option value="주문자">주문자</option>
			<option value="상품명">상품명</option>
			<option value="결제일">결제일</option>
			<option value="상태변경">상태변경</option>
		</select> <input type="text" size="12px" placeholder="상세검색">
			<button id="btn">검색</button>
	</div>


	<div class="tableWrapper">
		<table id="userListTable">
			<tr style="cursor: default;">
				<th width="4%">주문번호</th>
				<th width="6%">주문자</th>
				<th width="2%"></th>
				<th width="10%">상품명</th>
				<th width="4%">결제금액</th>
				<th width="7%">취소/환불 금액</th>
				<th width="5%">결제일</th>
				<th width="7%">주문상태</th>
				<th width="7%">상태변경</th>
			</tr>
			<c:forEach var="admin" items="${List }">
				<tr align="center">
					<td>${admin.e }</td>
					<td>${admin.num }</td>
					<td><img src="C:\goods\1\chicken.jpg" alt="이미지" /></td>
					<td><a
						href="${contextPath}/admin/viewDetail.do?num=${admin.num }">${admin.num }</a></td>
					<td>${admin.name }</td>
					<td>${admin.id }</td>
					<td>${admin.email }</td>
					<td>${admin.joinDate }</td>
					<td><select>
							<option value="배송준비중">배송준비중</option>
							<option value="배송중">배송중</option>
							<option value="배송완료">배송완료</option>
							<option value="환불완료">환불완료</option>
					</select></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
</div>
</body>

</html>