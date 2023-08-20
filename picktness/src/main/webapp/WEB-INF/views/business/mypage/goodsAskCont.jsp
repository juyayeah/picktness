<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>table</title>
<script>
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
</script>
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

.listcontent td {
	max-width: 0;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.topbar {
	position: relative;
	float: left;
}

.topbar:first-child {
	padding: 0 90px 0 0;
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

.comments {
	position: relative;
	float: left;
	width: 430px;
	margin: auto;
}

.comments table {
border:1px solid #c0c0c0;
}

.comments th {
	width: 90px;
	padding: 3px 0; 
	color : #fff;
	background-color: #2890f1;
}

.comments td {
	min-width: 130px;
	border-bottom: 1px solid lightgray;
}
</style>
</head>

<body>
	<div class="listcontent">
		<div class="listcontentinner"></div>
		<h2 align="center">상품문의 관리</h2>

		<div>
			<div class="topbar">
				처리상태 <select>
					<option value="전체">전체</option>
					<option value="답변대기" selected>답변대기</option>
					<option value="답변완료">답변완료</option>
				</select>
			</div>
			<div class="topbar">
				조회기간 <input name="search_date" type="date" size="40">~<input
					name="search_date" type="date" size="40">
			</div>
			<div class="topbar">
				상세검색&nbsp; <input type="text" placeholder="상세검색">
				<button id="btn" value="검색">검색</button>
			</div>
		</div>
		<div>총 #건</div>

		<div class="tableWrapper">
			<table id="userListTable">
				<tr style="cursor: default;">
					<th width="5%">번호</th>
					<th width="20%">상품명</th>
					<th width="15%">작성자ID</th>
					<th width="30%">문의내용</th>
					<th width="15%">작성일</th>
					<th width="15%">처리상태</th>
				</tr>
				<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
				<td>6</td>
				</tr>
				<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
				<td>6</td>
				</tr>
				<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
				<td>6</td>
				</tr>
				<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
				<td>6</td>
				</tr>
				<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
				<td>6</td>
				</tr>
			<%-- 	<c:choose>
					<c:when test="${empty goodsAskList }">
						<tr height="10">
							<td colspan="6">
								<p align="center">
									<b><span style="font-size: 9pt;">등록된 상품문의가 없습니다.</span></b>
								</p>
							</td>
						</tr>
					</c:when>
					<c:when test="${!empty goodsAskList }">
						<c:forEach var="business" items="${goodsAskList }" varStatus="bno">
							<tr align="center">
							
								<td>${goods_ask.bno}</td>
								<td>${goods_ask.goods_title}</td>
								<td>${goods_ask.member_id}</td>
								<td>${goods_ask.ask_content}</td>
								<td>${goods_ask.askdate}</td>
								<td>${goods_ask.state}</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose> --%>
			</table>


			<div class="cls2">
				<c:if test="${totTrainerList != null }">
					<c:choose>
						<c:when test="${totTrainerList > 100 }">
							<c:forEach var="page" begin="1" end="10" step="1">
								<c:if test="${section > 1 && page==1 }">
									<a class="no-uline"
										href="${contextPath }/business/goodsAskList.do?section=${section-1}&pageNum=${(section-1)*10 +1}">&nbsp;
										pre </a>
								</c:if>
								<a class="no-uline"
									href="${contextPath }/business/goodsAskList.do?section=${section}&pageNum=${page}">${(section-1)*10 + page}&nbsp;
								</a>
								<c:if test="${page == 10 }">
									<a class="no-uline"
										href="${contextPath }/business/goodsAskList.do?section=${section+1}&pageNum=${section*10 +1}">&nbsp;
										next </a>
								</c:if>
							</c:forEach>
						</c:when>
						<c:when test="${totbusinesss == 100 }">
							<c:forEach var="page" begin="1" end="10" step="1">
								<a class="no-uline"
									href="${contextPath }/business/goodsAskList.do?section=${section}&pageNum=${page}">${page  }</a>
							</c:forEach>
						</c:when>

						<c:when test="${totbusinesss < 100 }">
							<c:forEach var="page" begin="1" end="${totbusinesss/10+1 }"
								step="1">
								<c:choose>
									<c:when test="${page==pageNum }">
										<a class="sel-page"
											href="${contextPath }/business/goodsAskList.do?section=${section}&pageNum=${page}">${page }</a>
									</c:when>
									<c:otherwise>
										<a class="no-uline"
											href="${contextPath }/business/goodsAskList.do?section=${section}&pageNum=${page}">${page }</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:when>
					</c:choose>
				</c:if>
			</div>
			<br> <br>
			<%-- <c:forEach var="business" items="${List }">
				<tr align="center">
								<td>${goods_ask.goods_title}</td>
								<td>${goods_ask.member_id}</td>
								<td>${goods_ask.ask_content}</td>
								<td>${goods_ask.askdate}</td>
								<td>${goods_ask.state}</td>
					<!-- 승인요청만 하이퍼 링크 -->
					<td><a
						href="${contextPath}/business/viewDetail.do?num=${business.num }">${business.num }</a></td>
				</tr>
			</c:forEach>
			</table>
 --%>
		</div>
	</div>
	<div>
		<div class="comments">
			<b>문의글</b>
			<table>
				<tr>
					<th>작성일</th>
					<td>${goods_ask.askdate}</td>
					<th>작성자ID</th>
					<td>${goods_ask.member_id }</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td>${goods_ask.goods_title }</td>
					<th>답변일</th>
					<td>${goods_ask_answer.askadate }</td>
				</tr>
				<tr>
					<th>문의내용</th>
					<td colspan="3">${goods_ask.ask_content }</td>
				</tr>
			</table>
		</div>
		<div class="comments">
			<b>문의답변</b>
			<table class="tables">
				<tr>
					<th>답변일</th>
					<td>${goods_ask_answer.askadate }</td>
					<th>작성자ID</th>
					<td>${goods_ask.member_id }</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td>${goods_ask.goods_title }</td>
					<th>처리상태</th>
					<td><a href="#" id="subscriberBtn" type="text" onclick='change()' >답변대기</a></td>
				</tr>
				<tr>
					<th>답변내용</th>
					<td colspan="3">${goods_ask_answer.answer_content }</td>
				</tr>
			</table>
			<br><br><br>
		</div>
	</div>
</body>

</html>