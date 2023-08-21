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
<title>사업자 탈퇴 안내</title>
</head>
<body>
<div>
<table>
<tr>
<td>탈퇴를 신청하기 전에  안내사항을 꼭 확인해주시기 바랍니다.</td>
</tr>
<tr>
<td>
회원 탈퇴 안내:  사업자 탈퇴시 유의사항<br>
1) 사업자 탈퇴 후 사업장 정보 및 모든 트레이너 및 회원 정보는 소멸되며 재 가입을 하시더라도 복구되지 않습니다.<br> 
2) 사업자 탈퇴 후 재가입은 가능하오나 기존 내역 조회는 되지 않습니다. (탈퇴 후 재가입은 1개월 이후에 가능합니다.) <br>
3) 사업자 탈퇴 후에는 모든 거래내역 확인이 불가합니다.<br>
</td>
</tr>
<tr>
<td>
 * "전자상거래 등에서의 소비자 보호에 관한 법률 제 6조 (거래기록의 보존 등)"에 따라, 탈퇴 후에도 주문정보는 5년간 보관됩니다.
</td>
</tr>
<tr>
<td>정말 탈퇴하시겠습니까?</td>
</tr>
</table>
<button class="btn_white">아니오</button>
<button class="btn_blue">네</button> 
</div>
</body>
</html>