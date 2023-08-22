<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> 
<%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="tiles"
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
padding-bottom:2px;
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
	background-color: #cfe6fc;
	color: #2890f1;
	font-size: 12px;
	padding: 2px 10px;
}

#btn:hover {
	color: white;
	background-color: #2890f1;
}

.modbtn{
border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	margin-right: -4px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: -3px;
	border: 1px solid #2890f1;
	background-color: #cfe6fc;
	color:#2890f1;
	font-size: 12px;
	padding: 2px 5px;
}
.modbtn:hover {
	color:  #2890f1;
	background-color: #fff;
}
.delbtn{
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
	<div class="listcontent">
		<div class="listcontentinner"></div>
		<h2 align="center">트레이너 사업자 관리</h2>

		<div class="topbar"><span style="padding-right:700px">총 #건 </span><a href="${contextPath }/business/mypage/trainerForm.do"><button id="btn" value="트레이너 등록">트레이너 등록</button></a></div>

		<div class="tableWrapper">
			<table id="userListTable">
				<tr style="cursor: default;">
					<th width="10%">번호</th>
					<th width="20%">트레이너명</th>
					<th width="25%">연락처</th>
					<th width="20%">입사일</th>
					<th width="10%">승인상태</th>
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
						<td>고길동</td>
						<td>01045671234</td>
						<td>2023.05.01</td>
						<td>승인대기</td>
						<td><a href="${contextPath}/business/mypage/modTrainer.do?name=${trainer.name}"><button class="modbtn">수정</button></a> &nbsp; <a href="${contextPath}/business/mypage/delTrainer.do?name=${trainer.name}"><button class="delbtn">삭제</button></a></td>
					</tr>
					<!-- 하드코딩 끝-->
					<%-- </c:when>
					<c:when test="${!empty trainerList }">
				<c:forEach var="trainer" items="${trainerList }">
					<tr align="center">
						<td>${trainer.goods_id }</td>
						<td>${trainer.name }</td>
						<td>${trainer.phone1 },${trainer.phone2 },${trainer.phone3 }</td>
						<td>${trainer.joindate }</td>
						<td>${trainer.state }</td>
						<td><a href="${contextPath}/business/mypage/modTrainer.do?name=${trainer.name}"><button class="modbtn">수정</button></a> <a href="${contextPath}/business/mypage/delTrainer.do?name=${trainer.name}"><button class="delbtn">삭제</button></a></td>
					</tr>
				</c:forEach>
				</c:when>
				</c:choose> --%>
			</table>
		</div>
	</div>
</body>

</html>