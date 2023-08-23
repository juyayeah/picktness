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
<title>상품관리</title>
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
.bodybody a {
	background: transparent;
	text-decoration: none;
	color: inherit;
}

.bodybody td {
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

.bodybody th {
	background-color: #2890f1;
	color: #ffffff;
}

.bodybody table th:first-child {
	border-top-left-radius: 8px;
}

.bodybody table th:last-child {
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
	background-color: #fff;
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

<script>
function delProd(){
	
	alert('상품을 삭제하시겠습니까?')
}
</script>
</head>
<body>
	<div class="bodybody">
		<h2 align="center">상품 관리</h2>
		<div>
			<div class="topbar">
				판매상태 <select>
					<option value="전체">전체</option>
					<option value="판매중">판매중</option>
					<option value="판매종료">판매종료</option>
					<option value="재고없음" selected>재고없음</option>
				</select>
			</div>
			<div class="topbar" style="padding-left:20px;">
				조회기간 <input name="search_date" type="date" size="30">~<input
					name="search_date" type="date" size="30">
			</div>
			<div class="topbar" style="padding-left:20px;">
				카테고리 <select>
					<option value="전체" selected>전체</option>
					<option value="프로틴쉐이크">프로틴쉐이크</option>
					<option value="닭가슴살">닭가슴살</option>
					<option value="스트레칭/마사지">스트레칭/마사지</option>
					<option value="테이프/아대">테이프/아대</option>
					<option value="근력/유산소용품">근력/유산소용품</option>
				</select>
			</div>
			<div class="topbar">
				<input type="text" size="12px" placeholder="상세검색">
				<button id="btn" style="size: 20;" value="검색" onclick="search()">검색</button>
			</div>
		</div>

		<div class="topbar">
			<span style="padding-right: 730px">총 #건 </span><a
				href="${contextPath }/admin/mypage/adminProdForm.do"><button
					id="btn" value="상품 등록">상품 등록</button></a>
		</div>

		<div class="tableWrapper">
			<table id="userListTable">
				<tr style="cursor: default;">
					<th width="10%">번호</th>
					<th width="20%">카테고리</th>
					<th width="25%">상품명</th>
					<th width="20%">판매가</th>
					<th width="10%">판매상태</th>
					<th width="10%">재고</th>
					<th width="10%">등록일</th>
					<th width="15%">수정/삭제</th>
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
					<td>1</td>
					<td>식품</td>
					<td>닭고기</td>
					<td>8,000</td>
					<td>판매중</td>
					<td>333</td>
					<td>2023.05.01</td>
					<td><a
						href="${contextPath}/admin/mypage/modProd.do?name=${trainer.name}"><button
								class="modbtn">수정</button></a> &nbsp; <a
						href="${contextPath}/admin/mypage/delProd.do?name=${trainer.name}"><button
								class="delbtn" onclick="delProd()">삭제</button></a></td>
				</tr>
				<!-- 하드코딩 끝-->
				<%-- </c:when>
					<c:when test="${!empty trainerList }">
				<c:forEach var="trainer" items="${trainerList }">
					<tr align="center">
						<td>${}</td>
						<td>${}</td>
						<td>${}</td>
						<td>${}</td>
						<td>${}</td>
						<td>${}</td>
						<td>${}</td>
						<td><a href="${contextPath}/admin/mypage/modTrainer.do?name=${trainer.name}"><button class="modbtn">수정</button></a> <a href="${contextPath}/admin/mypage/delTrainer.do?name=${trainer.name}"><button class="delbtn">삭제</button></a></td>
					</tr>
				</c:forEach>
				</c:when>
				</c:choose> --%>
			</table>
		</div>
	</div>
</body>
</html>