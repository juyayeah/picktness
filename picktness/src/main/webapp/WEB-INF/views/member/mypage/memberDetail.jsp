<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib prefix="tiles"
uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <style>
      .mypage_content {
        margin: 30px;
        border: 1px solid tomato;
      }
    </style>
    <script>

    </script>
    <title>회원 정보 수정창</title>
  </head>
  <body>
    <div class="mypage_content">회원 정보를 수정하세요</div>
  </body>
</html>
