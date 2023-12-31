<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<c:if test='${not empty message }'>
<script>
alert("${message}");
</script>
</c:if>
    <style>
        .container {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            
            margin:70px 0px 150px 0px;
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
        
        .pBtn {
            color: black;
            width: 120px; 
            height: 50px;
            border: none;
            background-color: white;
            cursor: pointer;
            font-size: 20px;
        }

        .bBtn {
            color: black;;
            width: 120px; 
            height: 50px;
            border: none;
            background-color: white;
            cursor: pointer;
            font-size: 20px;
        }

        input[type="text"],
        input[type="password"],
        .loginB,
        .custom-button {
            width: 300px;
            height: 50px; 
            padding: 10px;
            border: 1px solid #c3c7ca;
            border-radius: 5px;
            box-sizing: border-box;
            outline: none;
        }
        .loginB {
            background-color: #2890F1;
            color: white;
            border: none;
            cursor: pointer;
        }
        .loginB :hover {
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

        .footer-select {
            text-align: center;
            margin-top: 20px;
            color: black;
        }
        .footer-select a {
            
            color: black;
            font-size: 14px;
        }

        .class1 {
            width: 5%;
        }
		.kakao_login{
		margin:30px;
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
                businessButton.style.color = 'black';
                businessButton.style.textDecoration = 'none';
                personalLoginForm.style.display = 'block';
                businessLoginForm.style.display = 'none';
            } else if (loginType === 'business') {
                personalButton.style.color = 'black';
                personalButton.style.textDecoration = 'none';
                businessButton.style.color = '#2890F1';            
                personalLoginForm.style.display = 'none';
                businessLoginForm.style.display = 'block';
            }
        }
        
        // 페이지 로딩 시 초기값 설정
         window.onload = function() {
        	if(${type == null}){

            var personalButton = document.getElementById('personalButton');
            var businessButton = document.getElementById('businessButton');
            var personalLoginForm = document.getElementById('personalLoginForm');
            var businessLoginForm = document.getElementById('businessLoginForm');
            
            personalButton.style.color = '#2890F1';
            businessButton.style.color = 'black';
            businessButton.style.textDecoration = 'none';
            personalLoginForm.style.display = 'block';
            businessLoginForm.style.display = 'none';
        	} else{

                var personalButton = document.getElementById('personalButton');
                var businessButton = document.getElementById('businessButton');
                var personalLoginForm = document.getElementById('personalLoginForm');
                var businessLoginForm = document.getElementById('businessLoginForm');
                
                personalButton.style.color = 'black';
                personalButton.style.textDecoration = 'none';
                businessButton.style.color = '#2890F1';            
                personalLoginForm.style.display = 'none';
                businessLoginForm.style.display = 'block';
        	}
        }; 
        
        function loginWithKakao() {
            Kakao.Auth.authorize({
              redirectUri: 'http://localhost:8080/callback',
            });
          }

          // 아래는 데모를 위한 UI 코드입니다.
          displayToken()
          function displayToken() {
            var token = getCookie('authorize-access-token');
            if(token) {
              Kakao.Auth.setAccessToken(token);
              Kakao.Auth.getStatusInfo()
                .then(function(res) {
                  if (res.status === 'connected') {
                    document.getElementById('token-result').innerText
                      = 'login success, token: ' + Kakao.Auth.getAccessToken();
                  }
                })
                .catch(function(err) {
                  Kakao.Auth.setAccessToken(null);
                });
            }
          }

          function getCookie(name) {
            var parts = document.cookie.split(name + '=');
            if (parts.length === 2) { return parts[1].split(';')[0]; }
          }
    </script>
    <meta charset="UTF-8">
    <title>로그인창</title>
</head>
<body>
    <div class="container">
        <div class="login-container">
            <button id="personalButton" class="pBtn" onclick="showLoginForm('personal')">개인회원</button> | 
            <button id="businessButton" class="bBtn" onclick="showLoginForm('business')">사업자</button>

            <div id="personalLoginForm">
                <form action="${contextPath}/member/login.do" method="post">
                	<input type="hidden" name="userType" value="member">
                    <input type="text" id="id" name="id" placeholder="아이디" required>
                    <br>
                    <input type="password" id="password" name="pwd" placeholder="비밀번호" required>
                    <br>
                    <button class="loginB" type="submit">로그인</button>
                </form>
                <div class="footer-select">
                    <a href="${contextPath}/member/findById.do">아이디 찾기</a> |
                    <a href="${contextPath}/member/findByPwd.do">비밀번호 찾기</a> |
                    <a href="${contextPath}/member/selectJoin.do">회원가입</a>
                </div>
                <div class="kakao_login">
               <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=8aeab8c87d417852240221b7ac49e0a6&redirect_uri=http://localhost:8080/kakao/callback">
                <img src="${contextPath }/images/kakao_login.png" alt="카카오 로그인 버튼"/>
                </a>
                </div>
            </div>
            
            <div id="businessLoginForm" style="display: none;">
                <form action="${contextPath}/member/login.do" method="post">
                	<input type="hidden" name="userType"value="business">
                    <input type="text" id="businessId" name="id" placeholder="사업자 아이디" required>
                    <br>
                    <input type="password" id="businessPassword" name="pwd" placeholder="비밀번호" required>
                    <br>
                    <button class="loginB" type="submit">로그인</button>
                </form>
                <div class="footer-select">
                    <a href="${contextPath}/member/findById.do">아이디 찾기</a> |
                    <a href="${contextPath}/member/findByPwd.do">비밀번호 찾기</a> |
                    <a href="${contextPath}/member/selectJoin.do">회원가입</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
