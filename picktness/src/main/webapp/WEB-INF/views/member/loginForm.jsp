<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
    <style>
        .container {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 50vh;
            margin: 0;
        }
        .login-container {
            width: 30%;
            text-align: center;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        h1 {
            margin-bottom: 20px;
        }
        form {
            width: 100%;
        }
        label {
            display: block;
            text-align: left;
            margin-bottom: 5px;
        }

        .button1 {
            color: black;
            width: 120px; 
            height: 50px;
            border: none;
            background-color: white;
            cursor: pointer;
            font-size: 20px;
        }

        .button2 {
            color: #2890F1;
            text-decoration: underline;
            width: 120px; 
            height: 50px;
            border: none;
            background-color: white;
            cursor: pointer;
            font-size: 20px;
        }

        input[type="text"],
        input[type="password"],
        button {
            width: 300px;
            height: 50px; 
            padding: 10px;
            border: 1px solid #2890F1;
            border-radius: 5px;
            box-sizing: border-box;
            outline: none;
        }
        button[type="submit"] {
            background-color: #2890F1;
            color: white;
            border: none;
            cursor: pointer;
        }
        button[type="submit"]:hover {
            background-color: #1E73C6;
        }
        
        .custom-button {
            border: none;
            padding: 0;
            background: none;
        }

        .button-image {
            max-width: 100%;
            max-height: 100%;
            display: block;
            margin: auto;
            cursor: pointer;
        }

        .footer {
            text-align: center;
            margin-top: 20px;
            color: black;
        }
        .footer a {
            text-decoration: none;
            color: black;
            font-size: 14px;
        }

        .class1 {
            width: 5%;
        }
    </style>
    <script>
        function showLoginForm(loginType) {
            var personalButton = document.getElementById('personalButton');
            var businessButton = document.getElementById('businessButton');
            var personalLoginForm = document.getElementById('personalLoginForm');
            var businessLoginForm = document.getElementById('businessLoginForm');

            if (loginType === 'personal') {
                personalButton.style.color = '#2890F1';
                personalButton.style.textDecoration = 'underline';
                businessButton.style.color = 'black';
                businessButton.style.textDecoration = 'none';
                personalLoginForm.style.display = 'block';
                businessLoginForm.style.display = 'none';
            } else if (loginType === 'business') {
                personalButton.style.color = 'black';
                personalButton.style.textDecoration = 'none';
                businessButton.style.color = '#2890F1';
                businessButton.style.textDecoration = 'underline';
                personalLoginForm.style.display = 'none';
                businessLoginForm.style.display = 'block';
            }
        }
        
        // 페이지 로딩 시 초기값 설정
        window.onload = function() {
            var personalButton = document.getElementById('personalButton');
            var businessButton = document.getElementById('businessButton');
            var personalLoginForm = document.getElementById('personalLoginForm');
            var businessLoginForm = document.getElementById('businessLoginForm');
            
            personalButton.style.color = '#2890F1';
            personalButton.style.textDecoration = 'underline';
            businessButton.style.color = 'black';
            businessButton.style.textDecoration = 'none';
            personalLoginForm.style.display = 'block';
            businessLoginForm.style.display = 'none';
        };
    </script>
    <meta charset="UTF-8">
    <title>로그인창</title>
</head>
<body>
    <div class="container">
        <div class="login-container">
            <button id="personalButton" class="button1" onclick="showLoginForm('personal')">개인회원</button> | 
            <button id="businessButton" class="button2" onclick="showLoginForm('business')">사업자</button>

            <div id="personalLoginForm">
                <form action="/login" method="post">
                    <input type="text" id="id" name="id" placeholder="아이디" required>
                    <br>
                    <input type="password" id="password" name="password" placeholder="비밀번호" required>
                    <br>
                    <button type="submit">로그인</button>
                </form>
                <div class="button3">
                    <button type="button" class="custom-button"  onClick="https://kauth.kakao.com/oauth/authorize">
                        <img src="https://ifh.cc/g/8gHrO6.png" alt="카카오톡로그인" class="button-image button-image-kakao">
                    </button>
                </div>
                <div class="footer">
                    <a href="#">아이디 찾기</a> |
                    <a href="#">비밀번호 찾기</a> |
                    <a href="${contextPath}/member/selectJoin.do">회원가입</a>
                </div>
            </div>
            
            <div id="businessLoginForm" style="display: none;">
                <form action="/login" method="post">
                    <input type="text" id="businessId" name="businessId" placeholder="사업자 아이디" required>
                    <br>
                    <input type="password" id="businessPassword" name="businessPassword" placeholder="비밀번호" required>
                    <br>
                    <button type="submit">로그인</button>
                </form>
                <div class="footer">
                    <a href="#">아이디 찾기</a> |
                    <a href="#">비밀번호 찾기</a> |
                    <a href="${contextPath}/member/selectJoin.do">회원가입</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
