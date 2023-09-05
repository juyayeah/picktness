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
      .menu {
        margin: 30px auto;
        width: 170px;
        border: 1px solid #2890f1;
        border-radius: 5px;
        height: 170px;
        text-align: center;
        padding: 20px;
      }
      .menu_title {
        font-size: 17px;
      }
      .line {
        margin-top: 15px;
        border: 1px solid #2890f1;
        text-align: center;
      }
      .menu_list_item {
        display: block;
        margin-top: 25px;
      }
    </style>
    <title>회원 정보 수정창</title>
  </head>
  <body>
    <div class="menu">
      <a href="${contextPath}/board/noticeList.do" class="menu_title"
        >고객센터</a
      >
      <div class="line"></div>
      <div class="menu_list">

        <a
          href="${contextPath}/board/noticeList.do"
          class="menu_list_item"
          >공지사항</a
        >

      </div>
    </div>
  </body>
</html>
