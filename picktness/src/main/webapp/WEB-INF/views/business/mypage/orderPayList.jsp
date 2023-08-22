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
.bodybody {
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
.bodybody table th:first-child {
	border-top-left-radius: 8px;
	border-bottom-left-radius: 8px;
}

.bodybody table th:last-child {
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
	background-color: #cfe6fc;
	color: #2890f1;
	font-size: 12px;
	padding: 2px 10px;
}

#btn:hover {
	color: white;
	background-color: #2890f1;
}

.modbtn {
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
	padding: 2px 5px;
}

.modbtn:hover {
	color: #2890f1;
	background-color: #fff;
}


.topbar {
	position: relative;
	float: left;
	padding-bottom:2px;
}

.delbtn {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	margin-right: -4px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: -3px;
	border: 1px solid #a0a0a0;
	background-color: #c0c0c0;
	color: #000;
	font-size: 12px;
	padding: 2px 5px;
}

.delbtn:hover {
	color: #000;
	background-color: #fff;
}
</style>


</head>
<body>
	<div class="bodybody">
		<h2 align="center">주문/결제관리 리스트</h2>
		
		<div>
			<div class="topbar">
				이용상태 <select>
					<option value="전체">전체</option>
					<option value="이용전" selected>이용전</option>
					<option value="이용시작">이용시작</option>
					<option value="이용완료">이용완료</option>
				</select>
			</div>
			<div class="topbar">
				상품 <select>
					<option value="전체" selected>전체</option>
					<option value="이용권">이용권</option>
					<option value="PT">PT</option>
				</select>
			</div>
			<div class="topbar">
				트레이너명 <select>
					<option value="전체" selected>전체</option>
					<c:forEach var="trainer.name" items="${trainerList }" varStatus="status">
					<option><c:out value="${trainerVO.name}"/></option>
					</c:forEach>
				</select>
			</div>
			<div class="topbar">
				조회기간 <input name="search_date" type="date" size="30">~<input
					name="search_date" type="date" size="30">
			</div>
			<div>
			<input type="text" size="10px" placeholder="상세검색">
				<button id="btn" style="size:20;" value="검색" onclick="search()">검색</button>
			</div>
		</div>
			
	</div>
	<div class="listcontent">
		<div class="listcontentinner"></div>
<br>
		<div class="tableWrapper">
			<table id="userListTable">
				<tr style="cursor: default;">
					<th width="15%">주문번호</th>
					<th width="10%">주문자ID</th>
					<th width="10%">상품</th>
					<th width="15%">상품명</th>
					<th width="15%">결제금액</th>
					<th width="15%">결제일자</th>
					<th width="15%">이용상태</th>
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
					<td>145612</td>
					<td>고길동</td>
					<td>이용권</td>
					<td>1개월</td>
					<td>15,000,000</td>
					<td>2023-05-01</td>
					<td><span id="use" onClick="change()">이용전</span>
					</td>
				</tr>
				<!-- 하드코딩 끝-->
				<%-- </c:when>
					<c:when test="${!empty trainerList }">
				<c:forEach var="trainer" items="${trainerList }">
					<tr align="center">
						<td>${order_business.order_num }</td>
						<td>${order_business.memberId }</td>
						<td>${order_business. goods_option}</td>
						<td>${order_business.goods_title }></td>
						<td>${order_business.price }</td>
						<td>${order_business.orderdate }</td>
						<td>${order_business.state }</td>
					</tr>
				</c:forEach>
				</c:when>
				</c:choose> --%>
			</table>
		</div>
	</div>
<script>
document.getElementById("use").onclick = function() {state()};
function state() {
	var use=
document.getElementById("use"); if(use.innerHTML == "이용전"){
	use.innerHTML="이용중";} else if(use.innerHTML =="이용중"){
		use.innerHTML="이용완료";}
	}


</script>
</body>
</html>