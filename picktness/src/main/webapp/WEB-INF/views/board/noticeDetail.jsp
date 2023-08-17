<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% 
request.setCharacterEncoding("utf-8"); 
%>
<!DOCTYPE html>
<html>
<head>
    <title>공지사항</title>
    <style>

    </style>
</head>
<body>
    <div>
<h2>태풍 '카눈'으로 인한 배송 지연 및 결항 공지</h2>
<hr width="100%" color="#959ea6" style="padding=30px">
<p>2023.07.20</p><br>
<br>
<p>안녕하세요 픽트니스입니다.</p>

<p>현재 태풍 '카눈'의 영향으로 전국적인 배송 지연이 발생할 수 있습니다.<br>
    제주/도서산간 지역의 경우 선박 결항이 예정되어 있어 내용 안내드립니다.
    <br>
    배송 과정에 발생할 수 있는 피해를 최소화하기 위함이니 너른 양해 부탁드립니다.
    <br>
     1. 제주 지역
     - 선박 결항 일자: 8/9(수)~10(목)<br>
     - 선박 출항 재개 일자: 8/11(금)<br>
    <br>
     2. 도서산간 지역<br>
     1) 신안군, 완도군<br>
     - 선박 결항 일자: 8/9(수)~10(목)<br>
     - 선박 출항 재개 일자: 8/11(금)<br>
     2) 울릉도, 진도<br>
     - 선박 결항 일자: 8/9(수)~14(월)<br>
     - 선박 출항 재개 일자: 8/15(화)<br>
     ※ 기상 변동에 따라 지역 추가 및 선박 운영 여부 변동될 수 있습니다.
    <br>
     안전한 배송할 수 있도록 노력하겠습니다.<br>
     감사합니다.
     </p>
    </div>
    <div></div>
    <button type="button" onclick="alert('Hello World!')">목록으로</button>
</body>
</html>