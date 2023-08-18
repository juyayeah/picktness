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
      .content-inner {
        position: relative;
        max-width: 1100px;
        margin: 0 auto 100px auto;
      }
      .content_title {
        margin-top: 10px;
        font-size: 20px;
      }
      .member_location {
        margin: 10px 0px;
      }
      .map_button1 {
        display: inline-block;
        border-radius: 13px;
        background-color: #2890f1;
        width: fit-content;
        padding: 8px 14px 8px 8px;
        margin-right: 10px;
      }
      .map_button1 img {
        width: 25px;
      }
      .map_button1 span {
        vertical-align: super;
        font-size: 14px;
        color: white;
        margin-bottom: 15px;
      }
      .map_button2 {
        display: inline-block;
        border-radius: 13px;
        background-color: #2890f1;
        width: fit-content;
        padding: 8px 14px 8px 8px;
      }
      .map_button2 img {
        width: 25px;
      }
      .map_button2 span {
        vertical-align: super;
        font-size: 14px;
        color: white;
        margin-bottom: 15px;
      }
      .pc_cate ul {
        height: 30px;
        border-bottom: solid 1px #ccc;
      }
      .pc_cate li {
        float: left;
        margin: 0px 20px 30px 0px;
        cursor: pointer;
      }
      .order_by li {
        font-size: 13px;
        float: right;
        margin: 0px 0px 30px 10px;
        color: #ccc;
        cursor: pointer;
      }
      .main_box {
        clear: both;
        text-align: center;
      }
      .main_cate {
        font-weight: bold;
        font-size: 35px;
        margin: 10px;
      }
      .main_item {
        vertical-align: top;
        position: relative;
        width: 200px;
        display: inline-block;
        margin: 10px 30px;
      }
      .img {
        position: relative;
        width: 200px;
      }
      .main_item .title {
        text-align: left;
        font-size: 15px;
        display: block;
        font-weight: bold;
      }
      .main_item .location {
        text-align: left;
        font-size: 12px;
        color: #555;
        display: block;
      }
      .main_item .price {
        text-align: left;
        font-size: 15px;
        display: block;
      }
      .cates {
        text-align: left;
      }
      .cate {
        display: inline-block;
        border: 2px solid #bfbfbf;
        width: fit-content;
        padding: 4px 8px;
        margin: 5px 0px;
        border-radius: 10px;
        font-size: 13px;
      }
      .star img {
        width: 13px;
      }
      .star {
        text-align: left;
        font-size: 12px;
        color: #555;
      }
    </style>
    <script></script>
    <title>운동시설리스트</title>
  </head>
  <body>
    <div class="content-inner">
      <div class="content_title">운동시설</div>
      <div class="member_location"></div>
      <div class="change_location">
        <div class="map_button1">
          <img src="${contextPath}/images/main/location.png" />
          <span>위치 변경하기</span>
        </div>
        <div class="map_button2">
          <img src="${contextPath}/images/goods/map.png" />
          <span>지도로 보기</span>
        </div>
      </div>
      <div class="pc_cate">
        <ul>
          <li id="allcate">전체보기</li>
          <li id="health">헬스</li>
          <li id="yoga">요가</li>
          <li id="cross">크로스핏</li>
          <li id="boxing">킥복싱</li>
          <li id="jitsu">주짓수</li>
          <li id="all_time">24시간</li>
        </ul>
      </div>
      <div class="order_by">
        <ul>
          <li id="rowP">가격 낮은 순</li>
          <li id="near">거리순</li>
          <li id="recom">추천순</li>
        </ul>
      </div>
      <div class="main_box">
        <div
          class="main_item"
          onclick="location.href='${contextPath}/goods/gymDetail.do'"
        >
          <img class="img" src="${contextPath}/images/main/health4.jpg" />
          <span class="title">헬스보이짐&필라걸 둔산점</span>
          <span class="location"> 대전 서구 둔산동 </span>
          <span class="price"> 70,000원/월 </span>
          <div class="cates">
            <div class="cate">24시간</div>
            <div class="cate">헬스</div>
          </div>
          <div class="star">
            <img src="${contextPath}/images/main/star.png" />
            <span class="star">4.5(2)</span>
          </div>
        </div>
        <div class="main_item">
          <img class="img" src="${contextPath}/images/main/health3.jpg" />
          <span class="title">비식스 대전 둔산점</span>
          <span class="location"> 대전 서구 둔산동 </span>
          <span class="price"> 70,000원/월 </span>
          <div class="cates">
            <div class="cate">헬스</div>
          </div>
          <div class="star"></div>
        </div>
        <div class="main_item">
          <img class="img" src="${contextPath}/images/main/health2.jpg" />
          <span class="title">제이엠휘트니스 시청점</span>
          <span class="location"> 대전 서구 둔산동 </span>
          <span class="price"> 70,000원/월 </span>
          <div class="cates">
            <div class="cate">헬스</div>
          </div>
          <div class="star"></div>
        </div>
        <div class="main_item">
          <img class="img" src="${contextPath}/images/main/health1.jpg" />
          <span class="title">제이엠휘트니스 시청점</span>
          <span class="location"> 대전 서구 둔산동 </span>
          <span class="price"> 70,000원/월 </span>
          <div class="cates">
            <div class="cate">헬스</div>
          </div>
          <div class="star">
            <img src="${contextPath}/images/main/star.png" />
            <span class="star">4.5(2)</span>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
