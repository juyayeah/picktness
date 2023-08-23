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
 	width: 860px;
	margin: 0 auto;
 }

a {
	background: transparent;
	text-decoration: none;
	color: inherit;
}

.tableWrapper {
	width: 860px;
	height: auto;
	max-height: 200px;
	background-color: white;
	overflow: auto;
}

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

#userListTable tr:first-child {
	background-color: #2890f1;
	color: white !important;
	font-weight: bold;
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

	<div align="justify" style="margin-bottom:2px;">
 조회기간 <input name="search_date" type="date" size="40">~<input name="search_date" type="date" size="40">
 				 &nbsp;&nbsp;&nbsp;&nbsp; 카테고리
				<select>
						<option value="전체" selected>전체</option>
						<option value="헬스">헬스</option>
						<option value="크로스핏">크로스핏</option>
						<option value="요가">요가</option>
						<option value="필라테스">필라테스</option>
						<option value="복싱">복싱</option>
						<option value="주짓수">주짓수</option>
				</select>
 
  &nbsp;&nbsp;상세검색 <select>
			<option value="전체" selected>전체</option>
			<option value="아이디">아이디</option>
			<option value="사업자명">사업자명</option>
			<option value="카테고리">카테고리</option>
			<option value="시설명">시설명</option>
			<option value="연락처">연락처</option>
		</select> <input type="text" size="17px" placeholder="상세검색">
			<button id="btn">검색</button>
	</div>


	<div class="tableWrapper">
		<table id="userListTable">
			<tr style="cursor: default;">
				<th width="10%">아이디</th>
				<th width="6%">사업자명</th>
				<th width="10%">카테고리</th>
				<th width="15%">연락처</th>
				<th width="10%">등록일</th>
				<th width="10%">시설명</th>
			</tr>
					<c:choose>
			<c:when test="${empty BusinessList }">
				<tr height="10">
					<td colspan="11">
						<p align="center">
							<b><span style="font-size: 9pt;">등록된 사업자가 없습니다.</span></b>
						</p>
					</td>
				</tr>
			</c:when>
			<c:when test="${!empty BusinessList }">
				<c:forEach var="business" items="${BusinessList }"
					varStatus="businessNum">
					<tr align="center">
						<td width="8%"><a href="${contextPath}/admin/mypage/busiMemberInfo.do">${business.id}</td>
						<td width="12%">${business.name}</td>
						<td width="12%">${business.cate}</td>
						<td width="9%">${business.phone1} ${business.phone2} ${business.phone3}</td>
						<td width="9%">${business.joindate}</td>
						<td width="9%">${business.b_name}</td>
					<%-- 	<td width="8%"><a href="${contextPath}/business/recordForm1.do?num=${business.num} ">수정</a></td>
<td width="8%"><a href="${contextPath}/business/removeRecord.do?num=${business.num} ">삭제</a></td>
 --%>					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>

	<div class="cls2">
		<c:if test="${totBusiness != null }">
			<c:choose>
				<c:when test="${totBusiness > 100 }">
					<c:forEach var="page" begin="1" end="10" step="1">
						<c:if test="${section > 1 && page==1 }">
							<a class="no-uline"
								href="${contextPath }/business/listBusiness.do?section=${section-1}&pageNum=${(section-1)*10 +1}">&nbsp;
								pre </a>
						</c:if>
						<a class="no-uline"
							href="${contextPath }/business/listBusiness.do?section=${section}&pageNum=${page}">${(section-1)*10 + page}&nbsp;
						</a>
						<c:if test="${page == 10 }">
							<a class="no-uline"
								href="${contextPath }/business/listBusiness.do?section=${section+1}&pageNum=${section*10 +1}">&nbsp;
								next </a>
						</c:if>
					</c:forEach>
				</c:when>
				<c:when test="${totBusiness == 100 }">
					<c:forEach var="page" begin="1" end="10" step="1">
						<a class="no-uline"
							href="${contextPath }/business/listBusiness.do?section=${section}&pageNum=${page}">${page  }</a>
					</c:forEach>
				</c:when>

				<c:when test="${totBusiness < 100 }">
					<c:forEach var="page" begin="1" end="${totBusiness/10+1 }" step="1">
						<c:choose>
							<c:when test="${page==pageNum }">
								<a class="sel-page"
									href="${contextPath }/business/listBusiness.do?section=${section}&pageNum=${page}">${page }</a>
							</c:when>
							<c:otherwise>
								<a class="no-uline"
									href="${contextPath }/business/listBusiness.do?section=${section}&pageNum=${page}">${page }</a>
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
					<td>${admin.e }</td>
					<td>${admin.num }</td>
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