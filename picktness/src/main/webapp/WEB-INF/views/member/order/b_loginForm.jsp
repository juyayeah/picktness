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
            height: 80vh;
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

        .button2{
          color: #2890F1;
          text-decoration: underline;
          width: 120px; 
          height: 50px;
          border: none;
          background-color: white;
          cursor: pointer;
          font-size: 20px;
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

        input[type="text"],
        input[type="password"],
        button {
            width: 300px;
            height: 50px; 
            padding: 10px;
            border: 1px solid #ccc;
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

        .class1{
          width: 5%;
        }
    </style>
    <meta charset="UTF-8">
    <title>사업자로그인창 </title>
</head>
<body>
    <div class="container">
        <div class="login-container">
          <button class="button1" onclick="${contextPath}/member/loginForm.do">개인회원</button> | <button class="button2" onclick="${contextPath}/member/b_loginForm.do">사업자</button>

            <form action="/login" method="post">
                <input type="text" id="id" name="id" placeholder="아이디" required>
                <br>
                <input type="password" id="password" name="password" placeholder="비밀번호" required>
                <br>
                <button type="submit">로그인</button>
            </form>
            
            <div class="footer">
                <a href="#">아이디 찾기</a> |
                <a href="#">비밀번호 찾기</a> |
                <a href="#">회원가입</a>
            </div>
        </div>
    </div>
</body>
</html>
