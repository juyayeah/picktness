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
<title>정산관리</title>
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
	width: 1000px;
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
		<h2 align="center">정산관리</h2>
				<div style="float:right; margin-bottom:2px;">상세검색&nbsp;<select>
				<option value="전체" selected>전체</option>
				<option value="사업자아이디">사업자아이디</option>
				<option value="상품아이디">상품아이디</option>
				<option value="소매가">소매가</option>
				<option value="옵션">옵션</option>
				<option value="수수료">수수료</option>
				<option value="상태">상태</option>
				<option value="정산금">정산금</option>
			</select> <input type="text" placeholder="상세검색" size="17"> <button id="btn" value="검색">검색</button>
		</div>
<br>
		<div class="tableWrapper">
			<table id="userListTable">
				<tr style="cursor: default;">
					<th width="5%">번호</th>
					<th width="12%">사업자아이디</th>
					<th width="10%">주문날짜</th>
					<th width="12%">상품아이디</th>
					<th width="11%">소매가</th>
					<th width="10%">옵션</th>
					<th width="10%">수수료</th>
					<th width="7%">상태</th>
					<th width="10%">정산금</th>
					<th width="10%">정산일</th>
				</tr>

				<!-- 조건리스트 -->
			<c:choose>
					<c:when test="${empty adSettlementList}">
						<tr height="10">
							<td colspan="9">
								<p align="center">
									<b><span style="font-size: 9pt;">등록된 정산내역이 없습니다.</span></b>
								</p>
							</td>
						</tr>
	
	 </c:when>
					<c:when test="${!empty adSettlementList }">
				<c:forEach var="trainer" items="${adSettlementList }">
								<tr align="center">
					<td>${business_balance.bno}</td>
					<td>${business_balance.id}</td>
					<td>${business_balance.orderDate}</td>
					<td>${business_balance.goods_id}</td>
					<td>${business_balance.retailPrice}</td>
					<td>${business_balance.option}</td>
					<td>${business_balance.charge}</td>
					<td>${business_balance.state}</td>
					<td>${business_balance.balancePrice}</td>
				</tr>
				</c:forEach>
				</c:when>
				</c:choose> 
			</table>
		</div>
		</div>
</body>
</html>