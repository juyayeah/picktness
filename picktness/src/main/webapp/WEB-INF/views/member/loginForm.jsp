<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        height: 100vh;
        margin: 0;
        background-color: #f3f3f3;
      }
      .login-container {
        width: 60%;
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
      input[type="text"],
      input[type="pwd"],
      button {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
      }
      button[type="submit"] {
        background-color: #2890f1;
        color: white;
        border: none;
        cursor: pointer;
      }
      button[type="submit"]:hover {
        background-color: #1e73c6;
      }
      .kakao-button {
        background-color: #fee500;
        color: black;
        border: none;
        cursor: pointer;
      }
      .kakao-button:hover {
        background-color: #ffd100;
      }
      .footer {
        text-align: center;
        margin-top: 20px;
        color: black;
      }
      .footer a {
        text-decoration: none;
        color: black;
      }
    </style>

    <meta charset="UTF-8" />
    <title>로그인창</title>
  </head>
  <body>
    <div class="container">
      <div class="login-container">
        <h2>로그인창 수정123</h2>
        <form action="${contextPath}/member/login.do" method="post">
          <input type="text" id="id" name="id" placeholder="아이디" required />

          <input
            type="pwd"
            id="pwd"
            name="pwd"
            placeholder="비밀번호"
            required
          />

          <button type="submit">로그인</button>
        </form>

        <button class="kakao-button">카카오로 로그인</button>

        <div class="footer">
          <a href="#">아이디 찾기</a> | <a href="#">비밀번호 찾기</a> |
          <a href="#">회원가입</a>
        </div>
      </div>
    </div>
  </body>
</html>
