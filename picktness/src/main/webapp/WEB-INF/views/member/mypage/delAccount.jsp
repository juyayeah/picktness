<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <c:set var="contextPath" value="${pageContext.request.contextPath }" />
      <% request.setCharacterEncoding("utf-8"); %>
        <!DOCTYPE html>
        <html>

        <head>
          <meta charset="UTF-8">
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>회원정보 수정</title>
          <link rel="stylesheet" type="text/css" href="styles.css">
        </head>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js" />
        </script>
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
  function yesleaving() {
    var leaving = confirm('정말로 탈퇴하시겠습니까?');
    if (leaving) {
      alert('${member.id }님!\n\n그동안 픽트니스를 이용해 주셔서 진심으로 감사드리며 다시 뵐 수 있는 날을 고대하겠습니다. 회원님께서 불편해 하셨던 부분은 겸허히 받아들이고 다음번에 하며 돌아오실때에 이번에 겪으신 불편한 점을 충분히 개선하도록 하겠습니다. \n 언제나 건강하세요.');
      window.location.href = "${contextPath}/member/logout.do";
    }
  }
</script>
<body>
  <div class="withdrawform">
		<h2 align="center">회원 탈퇴 안내</h2>
    <hr style="background-color: #2890F1; height: 1px; width: 100%;">
    <p style="font-size: 14px;">저희 픽트니스 서비스를 이용해 주셔서 감사합니다. 회원 탈퇴에 대해 안내드리오니 회원 탈퇴를 원하시는 경우, 아래의 사항을 확인하시고 절차를 진행해주시기 바랍니다.</p>
    <table>
			<tr>
        <h3>안내 사항</h3>
        회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요
				<td><ul>
          <li>1. 계정 정보 및 데이터의 복구가 불가능합니다.</li>
          <br>
          <li>2. 탈퇴 후 재가입하더라도 이전 정보는 복구되지 않고 아이디는 재사용하실 수 없습니다.</li>
          <br>
          <li>3. 서비스 이용 기록 및 적립된 포인트 등도 삭제됩니다.</li>
        </ul></td>
			</tr>
      <tr>
				<td height="80px">픽트니스를 이용하며 불편하셨던 점을 알려주시면 고객님의 의견을 적극 반영하여
					앞으로의 불편함을 최소화 하도록 노력하겠습니다.</td>
			</tr>
		</table>

		<table style="border: 1px solid #a0a0a0;  border-collapse: collapse;">
			<tr>
        상세이유
				<td><textarea style="min-height: 60px; width: 600px; border:0px; outline: none;"
						name="reason" placeholder="ex) 더 이상 이 서비스를 이용할 필요가 없어서"></textarea></td>
			</tr>
		</table>

		<table width="600px">
			<tr>
				<td height="120px" align="center">정말 탈퇴하시겠습니까?</td>
			</tr>
			<tr>
				<td align="center">
					<button class="button_white" onclick="location.href='${contextPath}/member/mypage/memberDetail.do?id=${member.id}'">아니오</button>&nbsp;&nbsp;
					<button class="button_blue" onclick=yesleaving();>네</button>
				</td>
			</tr>
		</table>
		<br>
		<br>
	</div>
        </body>
        </html>