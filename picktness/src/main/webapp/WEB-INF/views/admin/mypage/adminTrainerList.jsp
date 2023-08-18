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
.listcontent {
	position: relative;
	max-width: 860px;
	margin: 0 auto;
}

a {
	background: transparent;
	text-decoration: none;
	color: inherit;
}


th.column_a {width: 7%;}
th.column_b {width: 10%;}
th.column_c {width: 6%;}
th.column_d {width: 10%;}
th.column_e {width: 7%;}
th.column_f {width: 10%;}

td
{
 max-width: 0;
 overflow: hidden;
 text-overflow: ellipsis;
 white-space: nowrap;
}
.topbar{
align:justify;
width: 100%;
}

.tableWrapper {
	width: 860px;
	height: auto;
	max-height: 200px;
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
		<div class="listcontentinner"></div>
		<h2 align="center">트레이너 관리</h2>

		<div class="topbar">
			승인상태 &nbsp;
			
			<select>
				<option value="전체" selected>전체</option>
				<option value="완료">완료</option>
				<option value="승인요청">승인요청</option>
				<option value="수정요청">수정요청</option>
			</select> 조회기간&nbsp;<input name="search_date" type="date" size="40">~<input
				name="search_date" type="date" size="40"> 상세검색&nbsp;<select>
				<option value="전체" selected>전체</option>
				<option value="헬스">헬스</option>
				<option value="크로스핏">크로스핏</option>
				<option value="요가">요가</option>
				<option value="필라테스">필라테스</option>
				<option value="복싱">복싱</option>
				<option value="주짓수">주짓수</option>
			</select> <input type="text" placeholder="상세검색"> <button id="btn" value="검색">검색</button>
		</div>
		<div>총 #건</div>

		<div class="tableWrapper">
			<table id="userListTable">
				<tr style="cursor: default;">
					<th>사업자명</th>
					<th>시설명</th>
					<th>카테고리</th>
					<th>트레이너명</th>
					<th>등록일</th>
					<th>승인상태</th>
				</tr>
				<c:forEach var="admin" items="${List }">
					<tr align="center">
						<td>${trainer.e }</td>
						<td>${trainer.name }</td>
						<td>${trainer.id }</td>
						<td>${trainer.email }</td>
						<td>${trainer.joinDate }</td>
						<!-- 승인요청만 하이퍼 링크 -->
						<td><a href="${contextPath}/admin/viewDetail.do?num=${admin.num }">${admin.num }</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>

</html>