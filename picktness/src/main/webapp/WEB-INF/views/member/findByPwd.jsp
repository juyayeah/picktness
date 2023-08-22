<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js" /></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<body style="background-color: white;">
    <h1>아이디 찾기</h1>
    <h4>본인확인 이메일로 인증</h4>
    <h5>본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</h5>
    <div class="form-row">
        <label for="id">이름</label><br>
        <input type="text" id="name" name="name" >
    </div>
    <div class="form-row">
        <label for="id">이메일</label><br>
        <input type="text" id="email" name="email" >
        <button>인증번호 받기</button>
    </div>
    <div class="form-row">
        <label for="id">인증번호</label><br>
        <input type="text" placeholder="인증번호 숫자 6자리 입력">
        <button>확인</button>
    </div>  
    <button>아이디 찾기</button>
</body>
</html>
