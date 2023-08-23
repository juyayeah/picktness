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
<meta charset="UTF-8" />
<style>
.bodybody {
width:860px;
}
.busitable{
width:700px;
margin: 10px auto;
padding: 10px;
}
.busith{
height:40px;
}
</style>
<title>사업자정보</title>
</head>
<body>
	<div class="bodybody">
		<h2 align="center">사업자 정보</h2>
<table class="busitable">
<tr>
<th class="busith" width="25%" align="right">사업자ID</th>
<td width="65%" align="left">${business.id }</td>
<td width="10%"></td>
</tr>
<tr>
<th class="busith" align="right">사업자명</th>
<td>${business.name }</td>
<td><button id="modBtn" onclick='modinfo()'>수정</button></td>
</tr>
<tr>
<th class="busith" align="right">시설명</th>
<td>${business.b_name}</td>
<td><button id="modBtn" onclick='modinfo()'>수정</button></td>
</tr>
<tr>
<th class="busith" align="right">사업장소재지</th>
<td>${business.addrbasic } ${business.addrbasic }</td>
<td><button id="modBtn" onclick='modinfo()'>수정</button></td>
</tr>
<tr>
<th class="busith" align="right">정산대금 입금계좌</th>
<td>${business.b_bank } ${business.b_account }</td>
<td><button id="modBtn" onclick='modinfo()'>수정</button></td>
</tr>
<tr>
<th class="busith" align="right">이메일 주소</th>
<td>${business.email1} ${business.email1}</td>
<td><button id="modBtn" onclick='modinfo()'>수정</button></td>
</tr>
<tr>
<th class="busith" align="right">사업자연락처</th>
<td>${business.phone1 } ${business.phone2 } ${business.phone3 }</td>
<td><button id="modBtn" onclick='modinfo()'>수정</button></td>
</tr>
<tr>
<th class="busith" align="right">사업자번호</th>
<td>${business.b_number }</td>
<td></td>
</tr>

<tr>
<td colspan="3" align="center"><button type="reset">목록으로</button> <input class="btn_blue" type="submit" value="수정반영"></td>
</tr>
<tr>
<td colspan="3" align="center"><span style="font-size: 10px; color: #2890f1;">*사업자 정보를 삭제하시겠습니까?</span></td>
</tr><tr>
<td colspan="3" align="center"><a href="${contextPath}/board/removeRecord.do?num=${article.num} "><button class="btn_blue">삭제</button></a></td>
</tr>
</table>
	</div>
</body>
</html>
