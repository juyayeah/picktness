<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
    <style>
    h2 {
    margin-top: 50px;
    margin-bottom: 50px;
    }    
    .container{
        text-align: center;
        margin-top: 50px;
        margin-bottom: 50px;
    }
    button{
        width:120px;
        height: 50px;
        border-radius: 5px;
    }
    .button1{
        cursor:pointer;
        background-color: white;
        border: 1px solid black;
        margin-right: 30px;
    }
    .button1:hover {
    //background-color: #D3D3D3; 
    //border-color: #D3D3D3; 
    }   
    .button2{
        cursor:pointer;
        background-color: #2890F1;
        border: 1px solid #2890F1;
        color: white;
        margin-left: 30px;
    }
    .button2:hover {
    background-color: #1E73C6; 
    border-color: #1E73C6; 
    }   
    </style>
    <script>
        
    </script>
    <meta charset="UTF-8">
    <title>가입창</title>
</head>
<body>
    <div class="container">
<img src="https://ifh.cc/g/K47PP3.png" border='0' width="200" height="200">
<h2>축하합니다<br>회원가입이 완료되었습니다!</h2>
<button type="button" onclick="location.href='${contextPath}/main.do'" class="button1">메인으로</button>
<button type="button" onclick="location.href='${contextPath}/member/loginForm.do'" class="button2">로그인</button>
</div>
</body>
</html>
