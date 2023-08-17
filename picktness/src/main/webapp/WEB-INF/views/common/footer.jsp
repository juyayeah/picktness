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
    <title>하단 부분</title>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

    <link
      rel="stylesheet"
      href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"
    />
    <link
      rel="stylesheet"
      href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"
    />

    <style>
      .footer_menu {
        position: relative;
        width: 100%;
        height: 50px;
        background-color: #eee;
      }
      .footer_menu ul {
        position: relative;
        max-width: 1100px;
        min-height: 120px;
        margin: 0 auto;
      }
      .footer_menu ul li {
        color: #555;
        font-size: 13px;
        float: left;
        margin: 15px 15px 15px 0;
      }
      .footer_inner {
        position: relative;
        max-width: 1100px;
        height: 220px;
        margin: 0 auto;
        background-color: white;
      }
      .logo_f_i {
        position: absolute;
        top: 30px;
        width: 90px;
      }
      .footer_company {
        position: absolute;
        top: 22px;
        left: 180px;
        width: 290px;
        background-color: white;
      }
      .company_name {
        font-weight: bold;
        margin-bottom: 10px;
        color: #555;
        font-size: 13px;
      }
      .company_content {
        color: #555;
        font-size: 13px;
      }
      .footer_service {
        position: absolute;
        top: 22px;
        left: 600px;
        width: 290px;
        background-color: white;
      }
      .footer_service_title {
        color: #555;
        font-size: 13px;
        font-weight: bold;
        margin-bottom: 10px;
      }
      .footer_service_img {
        width: 18px;
      }
      .footer_number {
        display: inline;
        font-weight: bold;
        color: #555;
        font-size: 25px;
      }
      .footer_number_time {
        color: #555;
        font-size: 13px;
        margin-top: 5px;
      }
    </style>
  </head>
  <body>
    <div class="footer_menu">
      <ul>
        <li>
          <a href="${contextPath}/footer/privacy.do">개인정보처리방침</a>
        </li>
        <li>
          <a href="${contextPath}/footer/uselaw.do">이용약관</a>
        </li>
        <li>
          <a href="${contextPath}/footer/service_location.do"
            >위치기반 서비스 이용약관
          </a>
        </li>
      </ul>
    </div>
    <div class="footer_inner">
      <div class="logo_f">
        <img
          class="logo_f_i"
          src="${contextPath}/images/logogray.png"
          alt="픽트니스 로고 이미지"
        />
      </div>
      <div class="footer_company">
        <p class="company_name">(주)픽트니스</p>
        <p class="company_content">
          대표 : 우주, 이상우, 서유민, 차현호<br />
          주소 : 대전 광역시둔산 2동오라클빌딩 1005호<br />
          사업자 등록 번호 : 123-45-67891<br />
          통신판매업신고번호 : 제2023-대전서구-1005호<br /><br />
          Copyright©픽트니스 All rights reserved.
        </p>
      </div>
      <div class="footer_service">
        <p class="footer_service_title">고객센터</p>
        <img
          src="${contextPath}/images/phone.png"
          alt="휴대폰사진"
          class="footer_service_img"
        />
        <p class="footer_number">1501-1055</p>
        <p class="footer_number_time">월~금 9:00AM ~ 6:00PM</p>
      </div>
    </div>
  </body>
</html>
