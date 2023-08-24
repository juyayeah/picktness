<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <script>
      $(function () {
        $(".logo_h_i").click(function () {
          $(location).attr("href", "http://localhost:8080/main.do");
        });
        $(".menu_sp").hover(
          function () {
            $(".menu_sp_dt").css("display", "block");
            $(".menu_sp_title").css("color", "#2890f1");
            $(".menu_sp_title").css("font-weight", "bold");
          },
          function () {
            $(".menu_sp_dt").css("display", "none");
            $(".menu_sp_title").css("color", "black");
            $(".menu_sp_title").css("font-weight", "normal");
          }
        );
        $(".menu_tr").hover(
          function () {
            $(".menu_tr_dt").css("display", "block");
            $(".menu_tr_title").css("color", "#2890f1");
            $(".menu_tr_title").css("font-weight", "bold");
          },
          function () {
            $(".menu_tr_dt").css("display", "none");
            $(".menu_tr_title").css("color", "black");
            $(".menu_tr_title").css("font-weight", "normal");
          }
        );
        $(".menu_sh").hover(
          function () {
            $(".menu_sh_fd").css("display", "block");
            $(".menu_sh_gd").css("display", "block");
            $(".menu_sh_title").css("color", "#2890f1");
            $(".menu_sh_title").css("font-weight", "bold");
          },
          function () {
            $(".menu_sh_fd").css("display", "none");
            $(".menu_sh_gd").css("display", "none");
            $(".menu_sh_title").css("color", "black");
            $(".menu_sh_title").css("font-weight", "normal");
          }
        );
        $(".menu_cm").hover(
          function () {
            $(".menu_cm_dt").css("display", "block");
            $(".menu_cm_title").css("color", "#2890f1");
            $(".menu_cm_title").css("font-weight", "bold");
          },
          function () {
            $(".menu_cm_dt").css("display", "none");
            $(".menu_cm_title").css("color", "black");
            $(".menu_cm_title").css("font-weight", "normal");
          }
        );
        $(".menu_all ").hover(
          function () {
            $(".menu_all_list").css("display", "block");
            $(".menu_open_img").css("display", "none");
            $(".menu_close_img").css("display", "block");
          },
          function () {
            $(".menu_all_list").css("display", "none");
            $(".menu_open_img").css("display", "block");
            $(".menu_close_img").css("display", "none");
          }
        );
      });
      function openMenu() {
        $(".menu_all_list").css("display", "block");
        $(".menu_open_img").css("display", "none");
        $(".menu_close_img").css("display", "block");
      }
      function closeMenu() {
        $(".menu_all_list").css("display", "none");
        $(".menu_open_img").css("display", "block");
        $(".menu_close_img").css("display", "none");
      }
    </script>
    <style>
      .header-inner {
        position: relative;
        max-width: 1100px;
        min-height: 120px;
        margin: 0 auto;
      }
      a {
        background: transparent;
        text-decoration: none;
        color: inherit;
      }
      ul {
        list-style: none;
        padding-left: 0px;
      }
      .util {
        position: absolute;
        right: 0;
      }
      .util ul {
        overflow: hidden;
      }
      .util ul li {
        float: left;
        position: relative;
        padding: 0 12px 0 0;
        font-size: 13px;
        color: #4d4d4d;
      }
      .logo_h_i {
        display: block;
        position: absolute;
        cursor: pointer;
        top: 50px;
        left: 0;
        width: 130px;
      }
      .header-inner .header-search {
        position: absolute;
        top: 60px;
        left: 300px;
        text-align: center;
        z-index: 100;
        width: 500px;
      }
      .option_box {
        display: inline-block;
        position: relative;
        font-size: 13px;
      }
      .option_box img {
        width: 10px;
      }
      .top_search {
        position: relative;
        display: inline-block;
        width: 380px;
        height: 40px;
        border: 1px solid #2890f1;
        border-radius: 6px;
        background: #fff;
        padding: 0 45px 0 15px;
        text-align: left;
      }
      .input-search {
        width: 70%;
        height: 100%;
        border: 0;
        padding: 0;
        font-size: 13px;
        color: #555;
        text-align: left;
        background: transparent;
        outline: none;
      }
      input::-webkit-search-decoration,
      input::-webkit-search-cancel-button,
      input::-webkit-search-results-button,
      input::-webkit-search-results-decoration {
        display: none;
      }
      .btn_top_search {
        position: absolute;
        top: 50%;
        right: 10px;
        width: 35px;
        height: 35px;
        transform: translateY(-50%);
        background-color: transparent;
        border: 0;
        cursor: pointer;
      }
      .btn_top_search_img {
        width: 15px;
        height: 15px;
      }
      .my_menu {
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-use-select: none;
        user-select: none;
        display: block;
        position: absolute;
        top: 55px;
        right: 0;
        width: 130px;
      }
      .btn_top_mypage {
        background-color: transparent;
        border: 0;
        cursor: pointer;
        width: 50px;
        height: 50px;
      }
      .btn_top_cart {
        background-color: transparent;
        border: 0;
        cursor: pointer;
        width: 50px;
        height: 50px;
      }
      .btn_top_mypage_img {
        width: 32px;
      }
      .btn_top_cart_img {
        width: 38px;
      }
      .navibar_fixed {
        width: 100%;
        height: 57px;
        border-bottom: 1px solid #eee;
        background: #fff;
        z-index: 101;
      }
      .navi_inner {
        display: flex;
        position: relative;
        width: 1100px;
        min-width: 1100px;
        max-width: 1100px;
        height: 100%;
        margin: 0 auto;
        padding-left: 140px;
      }
      .menu_sp {
        background-color: white;
        position: absolute;
        width: 150px;
        top: 15px;
        left: 190px;
        text-align: center;
        cursor: pointer;
      }
      .menu_sp_dt,
      .menu_tr_dt {
        margin-bottom: 0px;
        display: none;
      }
      .menu_tr {
        background-color: white;
        position: absolute;
        width: 150px;
        top: 15px;
        left: 340px;
        text-align: center;
        cursor: pointer;
      }
      .menu_sh {
        background-color: white;
        position: absolute;
        width: 300px;
        top: 15px;
        left: 490px;
        cursor: pointer;
      }
      .menu_sh_fd {
        display: none;
        position: absolute;
        width: 150px;
        height: 132px;
        top: 20px;
        background-color: white;
      }
      .menu_sh_gd {
        display: none;
        position: absolute;
        width: 150px;
        height: 132px;
        top: 20px;
        left: 150px;
        background-color: white;
      }
      .menu_sh_title {
        display: block;
        margin-left: 60px;
      }
      .menu_cm {
        background-color: white;
        position: absolute;
        width: 150px;
        top: 15px;
        right: 70px;
        text-align: center;
        cursor: pointer;
      }
      .menu_cm_dt {
        display: none;
        margin-bottom: 0px;
      }
      .menu_all {
        position: absolute;
        left: 30xp;
        top: 15px;
      }
      .menu_open_img {
        width: 20px;
        cursor: pointer;
      }
      .menu_close_img {
        width: 17px;
        cursor: pointer;
        display: none;
      }
      .menu_all_list {
        display: none;
        width: 600px;
      }
      .menu_all_list ul {
        background-color: white;
        width: 150px;
        height: 216px;
        float: left;
        margin: 0px;
        position: relative;
      }
      .menu_list_a {
        display: block;
        height: 30px;
        text-align: center;
      }
      .menu_all_list li a {
        display: block;
      }
      .menu_list_title {
        font-weight: 900;
        text-align: center;
        margin-top: 10px;
        margin-bottom: 5px;
      }
      .menu_list_title a:hover {
        color: #2890f1;
      }
      .menu_list_a:hover {
        background-color: #e6e6e6;
      }
    </style>
  </head>
  <body>
    <div class="header-inner">
      <c:choose>
        <c:when test="${isLogOn!=null}">
          <div class="util">
            <ul>
              <li>
                <a href="${contextPath}/member/logout.do">로그아웃</a>
              </li>
              <li>
                <a href="#">회원정보수정</a>
              </li>
              <li>
                <a href="#">고객센터</a>
              </li>
            </ul>
          </div>
        </c:when>
        <c:otherwise>
          <div class="util">
            <ul>
              <li>
                <a href="${contextPath}/member/loginForm.do">로그인</a>
              </li>
              <li>
                <a href="${contextPath}/member/selectJoin.do">회원가입</a>
              </li>
              <li>
                <a href="#">고객센터</a>
              </li>
            </ul>
          </div>
        </c:otherwise>
      </c:choose>
      <!--/util-->
      <div class="logo_h">
        <img
          class="logo_h_i"
          src="${contextPath}/images/logo.png"
          alt="픽트니스 로고 이미지"
        />
      </div>
      <!--/logo-->
      <div class="header-search">
        <form method="get" action="${contextPath}/goods/searchGoods.do">
          <div class="top_search">
            <input
              type="search"
              class="input-search"
              spellcheck="false"
              placeholder="검색어를 입력하세요"
              maxlength="100"
              name="search_content"
            />
            <button type="submit" class="btn_top_search">
              <img
                class="btn_top_search_img"
                src="${contextPath}/images/search.png"
                alt="검색 아이콘"
              />
            </button>
          </div>
        </form>
      </div>
      <!--/header-search-->
      <div class="my_menu">
        <button
          type="button"
          class="btn_top_mypage"
          onclick="location.href='${contextPath}/member/mypage/memberDetail.do?id=${member.id}'"
        >
          <img
            class="btn_top_mypage_img"
            src="${contextPath}/images/mypage.png"
            alt="마이페이지"
          />
        </button>
        <button
          type="button"
          class="btn_top_cart"
          onclick="location.href='${contextPath}/member/cart/cartList.do'"
        >
          <img
            class="btn_top_cart_img"
            src="${contextPath}/images/cart.png"
            alt="카트"
          />
        </button>
      </div>
      <!--/my_menu-->
    </div>
    <!--/header-inner-->
    <div class="navibar_fixed">
      <div class="navi_inner">
        <div class="menu_all">
          <div class="menu_open">
            <img
              class="menu_open_img"
              src="${contextPath}/images/menu.png"
              onclick="openMenu()"
            />
          </div>
          <div class="menu_close">
            <img
              class="menu_close_img"
              src="${contextPath}/images/close.png"
              onclick="closeMenu()"
            />
          </div>
          <div class="menu_all_list">
            <ul class="menu_list_place">
              <li class="menu_list_title">
                <a href="${contextPath}/goods/placeList.do?cate=all">운동시설</a>
              </li>
              <li class="menu_list_a"><a href="${contextPath}/goods/placeList.do?cate=health">헬스</a></li>
              <li class="menu_list_a"><a href="${contextPath}/goods/placeList.do?cate=cross">크로스핏</a></li>
              <li class="menu_list_a"><a href="${contextPath}/goods/placeList.do?cate=yoga">요가</a></li>
              <li class="menu_list_a"><a href="${contextPath}/goods/placeList.do?cate=pila">필라테스</a></li>
              <li class="menu_list_a"><a href="${contextPath}/goods/placeList.do?cate=boxing">복싱</a></li>
              <li class="menu_list_a"><a href="${contextPath}/goods/placeList.do?cate=jiu">주짓수</a></li>
            </ul>
            <ul class="menu_list_traniner">
              <li class="menu_list_title">
                <a href="${contextPath}/goods/trainerList.do?cate=all">트레이너</a>
              </li>
              <li class="menu_list_a"><a href="${contextPath}/goods/trainerList.do?cate=health">헬스</a></li>
              <li class="menu_list_a"><a href="${contextPath}/goods/trainerList.do?cate=cross">크로스핏</a></li>
              <li class="menu_list_a"><a href="${contextPath}/goods/trainerList.do?cate=yoga">요가</a></li>
              <li class="menu_list_a"><a href="${contextPath}/goods/trainerList.do?cate=pila">필라테스</a></li>
              <li class="menu_list_a"><a href="${contextPath}/goods/trainerList.do?cate=boxing">복싱</a></li>
              <li class="menu_list_a"><a href="${contextPath}/goods/trainerList.do?cate=jiu">주짓수</a></li>
            </ul>
            <ul class="menu_list_food">
              <li class="menu_list_title"><a href="">식품</a></li>
              <li class="menu_list_a"><a href="">프로틴 쉐이크</a></li>
              <li class="menu_list_a"><a href="">닭가슴살</a></li>
            </ul>
            <ul class="menu_list_goods">
              <li class="menu_list_title"><a href="">기구/용품/장비</a></li>
              <li class="menu_list_a"><a href="">스트레칭/마사지</a></li>
              <li class="menu_list_a"><a href="">테이프/아대</a></li>
              <li class="menu_list_a"><a href="">근력/유산소 용품</a></li>
            </ul>
          </div>
        </div>
        <!--/menu_all_list-->
        <div class="menu_sp">
          <span
            class="menu_sp_title"
            onclick="location.href='${contextPath}/goods/placeList.do?cate=all'"
            >운동시설</span
          >
          <ul class="menu_sp_dt">
            <li class="menu_list_a"><a href="${contextPath}/goods/placeList.do?cate=health">헬스</a></li>
            <li class="menu_list_a"><a href="${contextPath}/goods/placeList.do?cate=cross">크로스핏</a></li>
            <li class="menu_list_a"><a href="${contextPath}/goods/placeList.do?cate=yoga">요가</a></li>
            <li class="menu_list_a"><a href="${contextPath}/goods/placeList.do?cate=pila">필라테스</a></li>
            <li class="menu_list_a"><a href="${contextPath}/goods/placeList.do?cate=boxing">복싱</a></li>
            <li class="menu_list_a"><a href="${contextPath}/goods/placeList.do?cate=jiu">주짓수</a></li>
          </ul>
        </div>
        <!--/menu_sp-->
        <div class="menu_tr">
          <span
            class="menu_tr_title"
            onClick="location.href='${contextPath}/goods/trainerList.do?cate=all'"
            >트레이너</span
          >
          <ul class="menu_tr_dt">
            <li class="menu_list_a"><a href="${contextPath}/goods/trainerList.do?cate=health">헬스</a></li>
            <li class="menu_list_a"><a href="${contextPath}/goods/trainerList.do?cate=cross">크로스핏</a></li>
            <li class="menu_list_a"><a href="${contextPath}/goods/trainerList.do?cate=yoga">요가</a></li>
            <li class="menu_list_a"><a href="${contextPath}/goods/trainerList.do?cate=pila">필라테스</a></li>
            <li class="menu_list_a"><a href="${contextPath}/goods/trainerList.do?cate=boxing">복싱</a></li>
            <li class="menu_list_a"><a href="${contextPath}/goods/trainerList.do?cate=jiu">주짓수</a></li>
          </ul>
        </div>
        <!--/menu_tr-->
        <div class="menu_sh">
          <span class="menu_sh_title" onclick="location.href='#'">쇼핑</span>
          <div class="menu_sh_fd">
            <ul class="menu_sh_fd_2">
              <li class="menu_list_title"><a href="">식품</a></li>
              <li class="menu_list_a"><a href="">프로틴 쉐이크</a></li>
              <li class="menu_list_a"><a href="">닭가슴살</a></li>
            </ul>
          </div>
          <div class="menu_sh_gd">
            <ul class="menu_sh_gd_2">
              <li class="menu_list_title"><a href="">기구/용품/장비</a></li>
              <li class="menu_list_a"><a href="">스트레칭/마사지</a></li>
              <li class="menu_list_a"><a href="">테이프/아대</a></li>
              <li class="menu_list_a"><a href="">근력/유산소 용품</a></li>
            </ul>
          </div>
        </div>
        <!--/menu_sp-->
        <div class="menu_cm">
          <span class="menu_cm_title" onclick="location.href='#'"
            >커뮤니티</span
          >
          <ul class="menu_cm_dt">
            <li class="menu_list_a"><a href="">자유게시판</a></li>
            <li class="menu_list_a"><a href="">오늘 식단</a></li>
          </ul>
        </div>
      </div>
      <!--navi_inner-->
    </div>
    <!--/navibar_fixed-->
  </body>
</html>
