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
        height: 460px;
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
      <a href="${contextPath}/member/mypage/memberDetail.do" class="menu_title"
        >마이페이지</a
      >
      <div class="line"></div>
      <div class="menu_list">
        <a
          href="${contextPath}/member/mypage/orderList.do"
          class="menu_list_item"
          >주문내역</a
        >
        <a
          href="${contextPath}/member/mypage/cancelList.do"
          class="menu_list_item"
          >취소/환불 내역</a
        >
        <a
          href="${contextPath}/member/mypage/goodsAskList.do"
          class="menu_list_item"
          >상품 문의 내역</a
        >
        <a
          href="${contextPath}/member/mypage/oneOnOneAskList.do"
          class="menu_list_item"
          >1:1 문의</a
        >
        <a
          href="${contextPath}/member/mypage/boardList.do"
          class="menu_list_item"
          >게시글 관리</a
        >
        <a
          href="${contextPath}/member/mypage/replyList.do"
          class="menu_list_item"
          >댓글 관리</a
        >
        <a
          href="${contextPath}/member/mypage/reviewList.do"
          class="menu_list_item"
          >리뷰 관리</a
        >
        <a
          href="${contextPath}/member/mypage/pointList.do?option=all"
          class="menu_list_item"
          >포인트</a
        >
        <a
          href="${contextPath}/member/mypage/memberDetail.do"
          class="menu_list_item"
          >회원정보 수정</a
        >
      </div>
    </div>
  </body>
</html>
