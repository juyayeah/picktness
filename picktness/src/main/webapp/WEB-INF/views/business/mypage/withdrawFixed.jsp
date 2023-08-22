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
<style>
.withdrawform{
width:600px;
margin:auto;
}

.button_white {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	margin-right: -4px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: -3px;
	border: 2px solid #000;
	background-color: #fff;
	color: #000;
	font-size: 12px;
	padding: 10px 30px;
}

.button_white:hover {
	cursor: pointer;
	border-color: #2890f1;
}

.button_blue:hover {
	cursor: pointer;
	border-color: #fff;
}

.button_blue {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	margin-right: -4px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: -3px;
	border: 2px solid #2890f1;
	background-color: #2890f1;
	color: #fff;
	font-size: 12px;
	padding: 10px 38px;
}
.button_blue a{
color: #fff;}

</style>

</head>
<body>
<div class="withdrawform">
	<h2 align="center">사업자 탈퇴 안내</h2>
<table>
<tr>
<td height="80px">탈퇴를 신청하기 전에  안내사항을 꼭 확인해주시기 바랍니다.</td>
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
<td height="80px">
 * "전자상거래 등에서의 소비자 보호에 관한 법률 제 6조 (거래기록의 보존 등)"에 따라, 탈퇴 후에도 주문정보는 5년간 보관됩니다.
</td>
</tr>
<tr>
<td height="120px" align="center">정말 탈퇴하시겠습니까?</td>
</tr>
<tr>
<td align="center">
<button class="button_white">아니오</button>&nbsp;&nbsp;
<button class="button_blue">네</button> 
</td>
</tr>
</table>
<br><br>
</div>
</body>
</html>