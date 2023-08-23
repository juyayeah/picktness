<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>상품관리</title>
<style>
.bodybody{
	position: absolute;
	width: 860px;
	margin: 0 auto;
	display: inline;
}

.bodybody a {
	background: transparent;
	text-decoration: none;
	color: inherit;
}

.bodybody ul {
	list-style: none;
}

.bodybody table {
	width: 100%;
	border: 0px;
	border-collapse: collapse;
	text-align: center;
}

.bodybody th {
	width: 10%;
	background-color: #2890f1;
	color: #ffffff;
}

.bodybody td {
	width: 10%;
	border: solid 1px lightgray;
}

.bodybody table th:first-child {
	border-top-left-radius: 8px;
}

.bodybody table th:last-child {
	border-top-right-radius: 8px;
}

.bodybody table td:first-child {
	border-bottom-left-radius: 8px;
}

.bodybody table td:last-child {
	border-bottom-right-radius: 8px;
}


/* * {
	box-sizing: border-box;
}
 */
.listcontent {
	position: relative;
	width: 860px;
	margin: 0 auto;
}

a {
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

.topbar {
	position: relative;
	float: left;
	padding-bottom:2px;
}

.topbar:first-child {
	padding: 0 85px 0 0;
}

.topbar:last-child {
	padding: 0 0 0 30px;
}

.tableWrapper {
	width: 100%;
	height: auto;
	max-height: 300px;
	background-color: white;
	overflow: auto;
}
/* 스크롤바 */
#userListTable {
	width: 100%;
	border: 0px;
	border-collapse: collapse;
	text-align: center;
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

#userListTable th: first-child, #userListTable td:first-child {
	border-right: 0px;
}

#userListTable tr:first-child {
	background-color: #2890f1;
	color: white;
	font-weight: bold;
	border-right: 0px;
}

#userListTable tr:nth-child(odd) {
	background-color: white;
}

#userListTable th {
	position: sticky;
	top: 0px;
	background-color: #2890f1 !important;
}

.listcontent th {
	background-color: #2890f1;
	color: #ffffff;
}

.listcontent table th:first-child {
	border-top-left-radius: 8px;
}

.listcontent table th:last-child {
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
	font-size: 12px;
	padding: 2px 10px;
	cursor: pointer;
}

#btn:hover {
	color: white;
	background-color: #2890f1;
}
</style>
<!-- <script>
const subs = document.getElementById("subscriberBtn")

subs.addEventListener("click", function() {
    if(subs.innerText === '답변대기') {
        subs.innerText = '답변완료';
    } else subs.innerText ='답변중';
});

function change() {
    const subs = document.getElementById('subscriberBtn');
    subs.innerText = '답변완료'
}
</script> -->


</head>
<body>
	<div class="bodybody">

		<h2 align="center">상품 주문/결제 리스트</h2>
		<div>
			주문상태 <select>
				<option value="전체" selected>전체</option>
				<option value="결제완료">결제완료</option>
				<option value="배송중">배송중</option>
				<option value="배송완료">배송완료</option>
				<option value="이용중">이용중</option>
				<option value="이용전">이용전</option>
				<option value="이용완료">이용완료</option>
				<option value="주문취소">주문취소</option>
				<option value="환불요청">환불요청</option>
				<option value="환불완료">환불완료</option>
			</select> 조회기간<input name="search_date" type="date" size="40">~<input
				name="search_date" type="date" size="40"> 상세검색 <select>
				<option value="전체" selected>전체</option>
				<option value="주문자번호">주문자번호</option>
				<option value="주문자">주문자</option>
				<option value="상품명">상품명</option>
				<option value="결제일">결제일</option>
				<option value="상태변경">상태변경</option>
			</select> <input type="text" placeholder="상세검색"> <input id="btn" type="button"
				value="검색">
		</div>

		<table>
			<tr>
				<th width="10%">주문번호</th>
				<th width="10%">주문자</th>
				<th width="15%">상품명</th>
				<th width="10%">결제금액</th>
<!-- 				<th width="15%">취소/환불 금액</th> -->
				<th width="15%">결제일</th>
				<th width="11%">주문상태</th>
				<th width="11%">상태변경</th>
			</tr>
			<c:choose>
					<c:when test="${empty adminProdList}">
						<tr height="10px">
							<td colspan="8">
								<p align="center" style="margin: 5px auto;">
									<b><span style="font-size: 9pt;">등록된 상품이 없습니다.</span></b>
								</p>
							</td>
						</tr>
						</c:when>
					<c:when test="${!empty adminProdList }">
				<c:forEach var="trainer" items="${adminProdList }">
					<tr align="center">
					<td></td>
						<td>${order_shop.order_num}</td>
						<td>${order_shop.member_id}</td>
						<td>${order_shop.goods_title}</td>
						<td>${order.total_price}</td>
						<td>${order_shop.orderdate}</td>
						<td><select>
						<option value="배송준비중">배송준비중</option>
						<option value="배송중">배송중</option>
						<option value="배송완료">배송완료</option>
						<option value="환불완료">환불완료</option>
				</select></td>
						<td>${order_shop.state}</td>
						</tr>
				</c:forEach>
				</c:when>
				</c:choose> 
		</table>
	</div>
</body>

</html>