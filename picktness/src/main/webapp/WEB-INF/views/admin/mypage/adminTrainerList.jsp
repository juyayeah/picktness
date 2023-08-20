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
	width: 860px;
	margin: 0 auto;
}

a {
	background: transparent;
	text-decoration: none;
	color: inherit;
}


td
{
 max-width: 100%;
 overflow: hidden;
 text-overflow: ellipsis;
 white-space: nowrap;
}
.topbar{
align:justify;
width: 100%;
}

.tableWrapper {
	width: 100%;
	height: auto;
	max-height: 200px;
	background-color: white;
	overflow: auto;
}
/* 스크롤바 */
#userListTable {
	width: 100%;
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

 #userListTable th: first-child, #userListTable td:first-child {
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
	cursor: pointer;
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
			승인상태&nbsp;
			
			<select>
				<option value="전체" selected>전체</option>
				<option value="완료">완료</option>
				<option value="승인요청">승인요청</option>
				<option value="수정요청">수정요청</option>
			</select> &nbsp;&nbsp;조회기간&nbsp;<input name="search_date" type="date" size="40">~<input
				name="search_date" type="date" size="40"> &nbsp;&nbsp;상세검색&nbsp;<select>
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
				<c:choose>
			<c:when test="${empty adminTrainerList }">
				<tr height="10">
					<td colspan="11">
						<p align="center">
							<b><span style="font-size: 9pt;">등록된 트레이너가 없습니다.</span></b>
						</p>
					</td>
				</tr>
			</c:when>
			<c:when test="${!empty adminTrainerList }">
				<c:forEach var="admin" items="${adminTrainerList }"
					varStatus="bno">
					<tr align="center">
						<td>${trainer.id}</td>
						<td>${business.b_name}</td>
						<td>${admin.num}</td>
						<td>${trainer.cate}</td>
						<td>${trainer.name}</td>
						<td>${trainer.joindate}</td>
						<td>${trainer.state}</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>


	<div class="cls2">
		<c:if test="${totTrainerList != null }">
			<c:choose>
				<c:when test="${totTrainerList > 100 }">
					<c:forEach var="page" begin="1" end="10" step="1">
						<c:if test="${section > 1 && page==1 }">
							<a class="no-uline"
								href="${contextPath }/admin/adminTrainerList.do?section=${section-1}&pageNum=${(section-1)*10 +1}">&nbsp;
								pre </a>
						</c:if>
						<a class="no-uline"
							href="${contextPath }/admin/adminTrainerList.do?section=${section}&pageNum=${page}">${(section-1)*10 + page}&nbsp;
						</a>
						<c:if test="${page == 10 }">
							<a class="no-uline"
								href="${contextPath }/admin/adminTrainerList.do?section=${section+1}&pageNum=${section*10 +1}">&nbsp;
								next </a>
						</c:if>
					</c:forEach>
				</c:when>
				<c:when test="${totadmins == 100 }">
					<c:forEach var="page" begin="1" end="10" step="1">
						<a class="no-uline"
							href="${contextPath }/admin/adminTrainerList.do?section=${section}&pageNum=${page}">${page  }</a>
					</c:forEach>
				</c:when>

				<c:when test="${totadmins < 100 }">
					<c:forEach var="page" begin="1" end="${totadmins/10+1 }" step="1">
						<c:choose>
							<c:when test="${page==pageNum }">
								<a class="sel-page"
									href="${contextPath }/admin/adminTrainerList.do?section=${section}&pageNum=${page}">${page }</a>
							</c:when>
							<c:otherwise>
								<a class="no-uline"
									href="${contextPath }/admin/adminTrainerList.do?section=${section}&pageNum=${page}">${page }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:when>
			</c:choose>
		</c:if>
	</div>
	<br>
	<br>
				
				
				
				
				
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