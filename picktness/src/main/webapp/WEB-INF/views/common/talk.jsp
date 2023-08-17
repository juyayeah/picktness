<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>메인페이지</title>
    <style>
      .kakao_chat_img {
        width: 50px;
      }
    </style>
  </head>
  <body>
    <script
      src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js"
      integrity="sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh"
      crossorigin="anonymous"
    ></script>
    <script>
      Kakao.init("abeab8cce28d6c80ad107bfe4e602d58"); // 사용하려는 앱의 JavaScript 키 입력
    </script>

    <a id="chat-channel-button" href="javascript:chatChannel()">
      <img
        src="${contextPath}/images/kakao.png"
        alt="카카오톡 채널 채팅하기 버튼"
        class="kakao_chat_img"
      />
    </a>

    <script>
      function chatChannel() {
        Kakao.Channel.chat({
          channelPublicId: "_xlZCEG",
        });
      }
    </script>
  </body>
</html>
