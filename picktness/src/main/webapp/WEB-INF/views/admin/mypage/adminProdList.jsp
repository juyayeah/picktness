<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib prefix="tiles"
uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>상품관리</title>
<style>
.bodybody {
	position: relative;
	max-width: 1100px;
	min-height: 120px;
	margin: 0 auto;
}

a {
	background: transparent;
	text-decoration: none;
	color: inherit;
}

ul {
	list-style: none;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th {
	border: 1px solid #2890f1;
	background-color: #2890f1;
}

th td {
	border: 1px solid #2890f1;
}
</style>
</head>
<body>
<div class="bodybody">
	<div>
<h2 align="center"> 상품 주문/결제관리 리스트</h2>
		<table border="0">
			<tr>
				<td>판매중</td>
				<td><select>
						<option value="전체">전체</option>
						<option value="판매중">판매중</option>
						<option value="판매종료">판매종료</option>
						<option value="재고없음" selected>재고없음</option>
				</select></td>
				<td>조회기간</td>
				<td><input name="search_date" type="date" size="40">~<input
					name="search_date" type="date" size="40"></td>
				<td>카테고리</td>
				<td><select>
						<option value="전체" selected>전체</option>
						<option value="프로틴쉐이크">프로틴쉐이크</option>
						<option value="닭가슴살">닭가슴살</option>
						<option value="스트레칭/마사지">스트레칭/마사지</option>
						<option value="테이프/아대">테이프/아대</option>
						<option value="근력/유산소용품">근력/유산소용품</option>
				</select></td>
				<td><input type="text" placeholder="검색내용을 입력해주세요">
				<td><input type="submit" value="검색"></td>
			</tr>
		</table>
		</div>
		<div>
		<table border="0">
			<tr align="center">
				<td align="left">총 #건</td>
				<td colspan="6"></td>
				<td align="right"><input type="button" value="상품등록"></td>
			</tr>
		</table>
		</div>
		<div>
		<table border="1">
			<tr>
				<th width="4%">번호</th>
				<th width="6%">카테고리</th>
				<th width="10%">상품명</th>
				<th width="4%">판매가</th>
				<th width="4%">판매상태</th>
				<th width="4%">재고</th>
				<th width="7%">등록일</th>
				<th width="5%">수정/삭제</th>
			</tr>
			<tr align="center">
				<td>#</td>
				<td>#</td>
				<td>#</td>
				<td>#</td>
				<td>#</td>
				<td>#</td>
				<td>#</td>
				<td><input type="button" value="수정"><input
					type="button" value="삭제"></td>
			</tr>
		</table>
	</div>
	</div>
	
</body>
</html>