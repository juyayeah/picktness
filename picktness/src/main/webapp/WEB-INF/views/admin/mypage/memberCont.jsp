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
<title>회원관리</title>
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
margin-bottom:2px;
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
<script type="text/javascript">
$(function(){
	$("input:radio[name='state']:radio[value='leaving']").prop('checked', true); // 선택하기
	$("input:radio[name='state']:radio[value='using']").prop('checked', true); // 해제하기
	});
</script>
</head>

<body>
	<div class="listcontent">
		<h2 align="center">회원 관리</h2>

		<div class="topbar" >
		<input type='radio' name='state' value='using' />활동중 <input type='radio' name='state' value='leaving' />활동정지
		
			<span style="margin-left:50px;">가입일&nbsp;</span><input name="search_date" type="date" size="40">~<input
				name="search_date" type="date" size="40"> &nbsp;&nbsp;상세검색&nbsp;<select>
				<option value="전체" selected>전체</option>
				<option value="아이디">아이디</option>
				<option value="이름">이름</option>
			</select> <input type="text" placeholder="상세검색" size="17"> <button id="btn" value="검색">검색</button>
		</div>

		<div class="tableWrapper">
			<table id="userListTable">
				<tr style="cursor: default;">
					<th width="10px">아이디</th>
					<th width="10px">이름</th>
					<th width="10px">휴대전화</th>
					<th width="10px">이메일</th>
					<th width="10px">가입일</th>
					<th width="10px">관리</th>
				</tr>
				<c:choose>
			<c:when test="${empty memberCont }">
				<tr height="10">
					<td colspan="11">
						<p align="center">
							<b><span style="font-size: 9pt;">등록된 회원이 없습니다.</span></b>
						</p>
					</td>
				</tr>
			</c:when>
			<c:when test="${!empty memberCont }">
				<c:forEach var="admin" items="${memberCont }"
					varStatus="bno">
					<tr align="center">
						<td><a href="${contextPath}/admin/mypage/adminMemberDetail.do">${member.id}</a></td>
						<td>${member.name}</td>
						<td>${member.phone1} ${member.phone2} ${member.phone3}</td>
						<td>${member.email1}${member.email2}</td>
						<td>${trainer.joindate}</td>
						<td>${member.del_yn}</td>
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
								href="${contextPath }/admin/memberCont.do?section=${section-1}&pageNum=${(section-1)*10 +1}">&nbsp;
								pre </a>
						</c:if>
						<a class="no-uline"
							href="${contextPath }/admin/memberCont.do?section=${section}&pageNum=${page}">${(section-1)*10 + page}&nbsp;
						</a>
						<c:if test="${page == 10 }">
							<a class="no-uline"
								href="${contextPath }/admin/memberCont.do?section=${section+1}&pageNum=${section*10 +1}">&nbsp;
								next </a>
						</c:if>
					</c:forEach>
				</c:when>
				<c:when test="${totadmins == 100 }">
					<c:forEach var="page" begin="1" end="10" step="1">
						<a class="no-uline"
							href="${contextPath }/admin/memberCont.do?section=${section}&pageNum=${page}">${page  }</a>
					</c:forEach>
				</c:when>

				<c:when test="${totadmins < 100 }">
					<c:forEach var="page" begin="1" end="${totadmins/10+1 }" step="1">
						<c:choose>
							<c:when test="${page==pageNum }">
								<a class="sel-page"
									href="${contextPath }/admin/memberCont.do?section=${section}&pageNum=${page}">${page }</a>
							</c:when>
							<c:otherwise>
								<a class="no-uline"
									href="${contextPath }/admin/memberCont.do?section=${section}&pageNum=${page}">${page }</a>
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