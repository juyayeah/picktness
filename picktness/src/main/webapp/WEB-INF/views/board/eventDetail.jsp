<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<style>
      .event_inner {
        position: relative;
        width: 1100px;
        margin: 0 auto;
      }
      .divider {
        border-top: 1px solid #ccc;
        margin-top: 20px;
        margin-bottom: 1px;
        margin-top: 0px; 
      }
 

      .evet_block1{
        display:inline;
        font-size: 20px;
      }
      .event_block2{
        display:inline-block;
        float:right;
        
      }
      .event_block3 {
        position: relative;
        width: 100%;
        height: 50px;
        background-color: #eee;
        border-top:1px solid rgb(15, 15, 15);
        margin-top:0px;
        display: inline-block;
        
      }

      .event_date{
        margin-top: 0px;
      
        display: inline-block;
        
      }
      .event_img{
        text-align: center;
      }

      .list-group{

        position: relative;
        width: 860px;
        margin: 0 auto;
      }



        .event_btn2{
          text-align: center;
          margin-top:20px;
        
        }
        .evnet_btn3{
          background-color: skyblue;
          color:white;
        }
</style>
<meta charset="UTF-8">
<title>이벤트 조회</title>
</head>
<body>
<div class="event_inner">
<h1>이벤트</h1>
<span class="event_block1" style="font-size:25px;">이벤트 참여</span>
<span class="event_block2"><input class="event_btn3" type="button" value="이벤트 목록보기"></span> 

<span class="event_block3">

  <p style="font-size:20px;">갓성비 브랜드 랭커 ! 픽트니스 오픈 event <%-- ${event.title } --%></p>

<p class="event_date">
  2023 08.17 - 2023.8-21 <%-- ${event.date } --%>
</p>


</span>
<div class="event_img">
<img  src="${contextPath}/images/board/event_01.jpg" alt="이벤트 사진">
<br>
<img  src="${contextPath}/images/board/event_02.jpg" alt="이벤트 사진">

</div>

<div class="list-group" style="margin-top: 20px;">
  <div class="divider"></div>
  <a href="/board/${board.next_board.id}?page=${param.page}&searchKeyword=${param.searchKeyword}" class="list-group-item list-group-item-action <c:if test="${empty board.next_board}">disabled</c:if>">
      <span style="font-weight: bold;">다음글</span> │ <c:choose>
          <c:when test="${empty board.next_board}">
              다음글이 없습니다.
          </c:when>
          <c:otherwise>
              <span style="color: blue;">${board.next_board.title}</span>
          </c:otherwise>
      </c:choose>
  </a>
  <br>
  <div class="divider"></div>
  
  
  <a href="/board/${board.prev_board.id}?page=${param.page}&searchKeyword=${param.searchKeyword}" class="list-group-item list-group-item-action <c:if test="${empty board.prev_board}">disabled</c:if>">
      <span style="font-weight: bold;">이전글</span> │ <c:choose>
          <c:when test="${empty board.prev_board}">
              이전글이 없습니다.
          </c:when>
          <c:otherwise>
              <span style="color: blue;">${board.prev_board.title}</span>
          </c:otherwise>
      </c:choose>
  </a>
  <div class="divider"></div>
  </div>
</div>
<div class="event_btn2">
<input type="button" value="목록으로" style="margin-bottom:20px">
</div>

</body>
</html>