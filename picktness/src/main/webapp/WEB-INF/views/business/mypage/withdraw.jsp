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
.withdrawform {
	width: 600px;
	margin: auto;
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

.button_blue a {
	color: #fff;
}

select option[value=""][disabled] {
	display: none;
}

select {
	width: 610px;
	padding: .8em .1em;
	margin:10px 0;
	border: 1px solid #999;
	font-family: inherit;
	border-radius: 0px;
}
</style>

<script type="text/javascript">
function yesleaving(){
	alert('사업자님!\n\n그동안 픽트니스를 이용해 주셔서 진심으로 감사드리며 다시 뵐 수 있는 날을 고대하겠습니다. 사업자님께서 불편해 하셨던 부분은 겸허히 받아들이고 다음번에 하며 돌아오실때에 이번에 겪으신 불편한 점을 충분히 개선하도록 하겠습니다. \n 언제나 건강하세요.')	
}
</script>
</head>
<body>
	<div class="withdrawform">
		<h2 align="center">사업자 탈퇴 안내</h2>
		<table>
			<tr>
				<td height="80px">픽트니스를 이용하며 불편하셨던 점을 알려주시면 고객님의 의견을 적극 반영하여
					앞으로의 불편함을 최소화 하도록 노력하겠습니다.</td>
			</tr>
			<tr>
				<td><select name="reason" required>
						<option value="" disabled selected>떠나시는 이유를 선택해주세요.</option>
						<option>비싼 수수료</option>
						<option>폐업</option>
						<option>이용이 불편함</option>
						<option>대응이 불친절함</option>
						<option>기타</option>
				</select></td>
			</tr>
		</table>

		<table style="border: 1px solid #a0a0a0;  border-collapse: collapse;">
			<tr>
				<td style="border: 1px solid #a0a0a0;">상세이유</td>
			</tr>
			<tr>
				<td><textarea style="min-height: 60px; width: 600px; border:0px;"
						name="reason"></textarea></td>
			</tr>
		</table>

		<table width="600px">
			<tr>
				<td height="120px" align="center">정말 탈퇴하시겠습니까?</td>
			</tr>
			<tr>
				<td align="center">
					<button class="button_white">아니오</button>&nbsp;&nbsp;
					<button class="button_blue"><a onclick='yesleaving();'>네</a></button>
				</td>
			</tr>
		</table>
		<br>
		<br>
	</div>
</body>
</html>