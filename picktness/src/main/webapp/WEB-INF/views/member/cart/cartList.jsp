<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <style>
      .btn_cart {
        border-top-left-radius: 5px;
        border-bottom-left-radius: 5px;
        border-top-right-radius: 5px;
        border-bottom-right-radius: 5px;
        border: 1px solid #2890f1;
        background-color: #2890f1;
        color: white;
        font-size: 12px;
        padding: 8px 0;
        margin: 10px;
        width: 120px;
      }

      .btn_cart:hover {
        color: white;
        border: 2px solid #2890f1;
        background-color: #2890f1;
      }
      .btn_cart_list {
        border-top-left-radius: 5px;
        border-bottom-left-radius: 5px;
        margin-right: -4px;
        border-top-right-radius: 5px;
        border-bottom-right-radius: 5px;
        margin-left: -3px;
        border: 2px solid #000;
        background-color: rgba(0, 0, 0, 0);
        color: #000;
        font-size: 12px;
        padding: 8px 30px;
      }

      .btn_cart_list:hover {
        color: #000;
        background-color: #fff;
      }
      .btn_cart_option {
        border-top-left-radius: 5px;
        border-bottom-left-radius: 5px;
        margin-right: -4px;
        border-top-right-radius: 5px;
        border-bottom-right-radius: 5px;
        margin-left: -3px;
        border: 2px solid #000;
        background-color: rgba(0, 0, 0, 0);
        color: #000;
        font-size: 12px;
        padding: 5px 5px;
      }

      .btn_cart_option:hover {
        color: #000;
        background-color: #fff;
      }
      .minus-plus {
        border-top-left-radius: 5px;
        border-bottom-left-radius: 5px;
        border-top-right-radius: 5px;
        border-bottom-right-radius: 5px;
        width: 65px;
        border: 2px solid #000;
        background-color: rgba(0, 0, 0, 0);
        color: #000;
        font-size: 12px;
        padding: 5px 0px;
      }
      .minusplus_cart {
        border: 0;
        background-color: #fff;
      }
      .minusplus_cart:hover {
        border: 0;
        cursor: pointer;
        background-color: #fff;
      }

      /*-- POPUP common style S ======================================================================================================================== --*/
      #mask {
        position: absolute;
        left: 0;
        top: 0;
        z-index: 999;
        background-color: #000000;
        display: none;
      }

      .layerpop {
        display: none;
        z-index: 1000;
        border: 2px solid #ccc;
        background: #fff;
        cursor: move;
      }

      .layerpop_area .title {
        padding: 10px 10px 10px 10px;
        border: 0px solid #aaaaaa;
        background: #f1f1f1;
        color: #3eb0ce;
        font-size: 1.3em;
        font-weight: bold;
        line-height: 24px;
      }

      .layerpop_area .layerpop_close {
        width: 50px;
        height: 25px;
        display: block;
        position: absolute;
        top: 10px;
        right: 10px;
      }

      .layerpop_area .layerpop_close:hover {
        background: transparent url("btn_exit_on.png") no-repeat;
        cursor: pointer;
      }

      .layerpop_area .content {
        width: 96%;
        margin: 2%;
        color: #828282;
      }
      /*-- POPUP common style E --*/
      .img_cart {
        width: 100px;
        height: 100px;
      }
      .firstmenucol {
        text-align: left;
        padding: 10px;
      }

      .tablesetting {
        border: 3px solid #000;
        border-radius: 4px;
        padding: 10px;
        width: 800px;
        align: center;
      }
      .tablesetting td {
        border-bottom: 2px solid #c0c0c0;
      }
      .delBtn {
        border: 0px;
        background: none;
      }
      .delBtn img {
        width: 30px;
      }
      .order_menu {
        margin: 30px auto;
      }
    </style>

    <meta charset="UTF-8" />
    <title>장바구니</title>
  </head>
  <script
    src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"
    type="text/javascript"
  ></script>
  <script
    src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"
    type="text/javascript"
  ></script>
  <script type="text/javascript">
    var slideIndex = 0; //slide index

    // HTML 로드가 끝난 후 동작
    window.onload = function () {
      showSlides(slideIndex);

      // Auto Move Slide
      var sec = 3000;
      setInterval(function () {
        slideIndex++;
        showSlides(slideIndex);
      }, sec);
    };

    // Next/previous controls
    function moveSlides(n) {
      slideIndex = slideIndex + n;
      showSlides(slideIndex);
    }

    // Thumbnail image controls
    function currentSlide(n) {
      slideIndex = n;
      showSlides(slideIndex);
    }

    function showSlides(n) {
      var slides = document.getElementsByClassName("mySlides");
      var dots = document.getElementsByClassName("dot");
      var size = slides.length;

      if (n + 1 > size) {
        slideIndex = 0;
        n = 0;
      } else if (n < 0) {
        slideIndex = size - 1;
        n = size - 1;
      }

      for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
      }
      for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
      }

      slides[n].style.display = "block";
      dots[n].className += " active";
    }

    function fn_articleForm(isLogOn, articleForm, loginForm) {
      if (isLogOn != "" && isLogOn != "false") {
        location.href = articleForm;
      } else {
        alert("구매할 상품을 하나 이상 선택해주세요.");
        location.href = loginForm + "?action=/board/recordForm.do";
      }
    }

    function selectAll(selectAll) {
      const checkboxes = document.getElementsByName("orderlist");

      checkboxes.forEach((checkbox) => {
        checkbox.checked = selectAll.checked;
      });
    }
    function popupOpen() {
      $(".layerpop").css("position", "absolute");
      //영역 가운에데 레이어를 뛰우기 위해 위치 계산
      //$('.layerpop').css("top",(($(window).height() - $('.layerpop').outerHeight()) / 2) + $(window).scrollTop());
      $(".layerpop").css("top", "50px");
      $(".layerpop").css(
        "left",
        ($(window).width() - $(".layerpop").outerWidth()) / 2 +
          $(window).scrollLeft()
      );
      //$('.layerpop').draggable();
      $("#layerbox").show();
    }

    function popupTOpen() {
      $(".layerpop").css("position", "absolute");
      //영역 가운에데 레이어를 뛰우기 위해 위치 계산
      //$('.layerpop').css("top",(($(window).height() - $('.layerpop').outerHeight()) / 2) + $(window).scrollTop());
      $(".layerpop").css("top", "250px");
      $(".layerpop").css(
        "left",
        ($(window).width() - $(".layerpop").outerWidth()) / 2 +
          $(window).scrollLeft()
      );
      //$('.layerpop').draggable();
      $("#layerTbox").show();
    }

    function popupClose() {
      $("#layerbox").hide();
      $("#mask").hide();
    }

    function popupTClose() {
      $("#layerTbox").hide();
      $("#mask").hide();
    }

    function goDetail() {
      /*팝업 오픈전 별도의 작업이 있을경우 구현*/
      popupTClose();
      popupOpen(); //레이어 팝업창 오픈
      wrapWindowByMask(); //화면 마스크 효과
    }

    function goTDetail() {
      /*팝업 오픈전 별도의 작업이 있을경우 구현*/
      popupClose();
      popupTOpen(); //레이어 팝업창 오픈
      wrapWindowByMask(); //화면 마스크 효과
    }

    var selectBoxChange = function (value) {
      $("#changeInput").val(value);

      if (value == "1개월") {
        $("#changeMoney").val("5만원");
      } else if (value == "3개월") {
        $("#changeMoney").val("13만원");
      } else if (value == "6개월") {
        $("#changeMoney").val("20만원");
      } else if (value == "12개월") {
        $("#changeMoney").val("40만원");
      } else {
        $("#changeMoney").val("");
      }
    };
    var selectTBoxChange = function (value) {
      $("#changeTInput").val(value);
    };

    var selectMBoxChange = function (value) {
      $("#changeMInput").val(value);
    };

    $(".delBtn").live("click", function () {
      var clickedRow = $(this).parent().parent();
      var cls = clickedRow.attr("class");

      // 각 항목의 첫번째 row를 삭제한 경우 다음 row에 td 하나를 추가해 준다.
      if (clickedRow.find("td:eq(0)").attr("rowspan")) {
        if (clickedRow.next().hasClass(cls)) {
          clickedRow.next().prepend(clickedRow.find("td:eq(0)"));
        }
      }

      clickedRow.remove();

      // rowspan 조정
      resizeRowspan(cls);
    });

    function count(type) {
      // 결과를 표시할 element
      const resultElement = document.getElementById("result");
      const total1 = document.getElementById("total");

      // 현재 화면에 표시된 값
      let number = resultElement.innerText;

      // 더하기/빼기
      if (type === "plus") {
        number = parseInt(number) + 1;
        if (1 > number) {
          number = 0;
        }
        total = number * 4000;
      } else if (type === "minus") {
        number = parseInt(number) - 1;
        if (1 > number) {
          number = 0;
        }
        total = number * 4000;
      }

      // 결과 출력
      resultElement.innerText = number;
      total1.innerText = total;
    }
  </script>

  <body>
    <h2 align="center">장바구니</h2>
    <table class="tablesetting" align="center">
      <tr height="10" align="center" bgcolor="#fff">
        <td class="firstmenucol" colspan="6">
          <input
            type="checkbox"
            name="orderlist"
            value="전체선택"
            onclick="selectAll(this)"
          />
          <span>전체선택</span>
        </td>
        <td>선택삭제</td>
      </tr>
      <tr align="center">
        <td width="3%"><input type="checkbox" name="orderlist" /></td>
        <td width="12%">
          <span class="img"
            ><img
              src="${contextPath}/images/member/1.jpg"
              alt="장바구니"
              class="img_cart"
          /></span>
        </td>
        <td width="20%" align="left">헬스보이 세종 새롬동점</td>
        <td width="8%">
          <input
            type="text"
            id="changeInput"
            style="border: none; background: transparent"
          />
        </td>
        <td width="10%">
          <button class="btn_cart_option" onClick="goDetail();">
            옵션 변경
          </button>
        </td>
        <td width="9%">
          <input
            type="text"
            id="changeMoney"
            style="border: none; background: transparent"
          />
        </td>
        <td width="9%">
          <button class="delBtn">
            <img src="${contextPath}/images/member/X.png" />
          </button>
        </td>
      </tr>
      <tr align="center">
        <td><input type="checkbox" name="orderlist" /></td>
        <td>
          <span class="img"
            ><img
              src="${contextPath}/images/member/박지성.jpg"
              alt="장바구니"
              class="img_cart"
          /></span>
        </td>
        <td align="left">박지성</td>
        <td>
          <input
            type="text"
            id="changeTInput"
            style="border: none; background: transparent"
          />
        </td>
        <td>
          <button class="btn_cart_option" onclick="goTDetail();">
            옵션 변경
          </button>
        </td>
        <td>
          <input
            type="text"
            id="changeMInput"
            style="border: none; background: transparent"
          />
        </td>
        <td>
          <button class="delBtn">
            <img src="${contextPath}/images/member/X.png" />
          </button>
        </td>
      </tr>
      <tr align="center">
        <td width="5%"><input type="checkbox" name="orderlist" /></td>
        <td width="15%">
          <span class="img"
            ><img
              src="${contextPath}/images/member/닭가슴살.jpg"
              alt="장바구니"
              class="img_cart"
          /></span>
        </td>
        <td width="30%" align="left">닭가슴살</td>
        <td width="10%"></td>
        <td width="15%">
          <div class="minus-plus">
            <button class="minusplus_cart" onclick='count("minus")'>-</button
            ><span id="result">0</span
            ><button class="minusplus_cart" onclick='count("plus")'>+</button>
          </div>
        </td>
        <td width="10%"><div id="total">0</div></td>
        <td width="15%">
          <button class="delBtn">
            <img src="${contextPath}/images/member/X.png" />
          </button>
        </td>
      </tr>
    </table>

    <table class="order_menu" border-bottom="0" width="800px">
      <tr>
        <td colspan="2" align="center">
          <span style="font-size: 25px; weight: bold"
            >총 결제금액 &nbsp; <b id="total1">0</b></span
          >
        </td>
      </tr>

      <tr>
        <td align="right">
          <a href="javascript:fn_backtoList('${ contextPath }/main.do')"
            ><button value="쇼핑계속하기" class="btn_cart_list">
              쇼핑 계속하기
            </button></a
          >
        </td>
        <td>
          <a
            class="cls1"
            href="javascript:fn_articleForm('${isLogOn}','${ contextPath }/board/recordForm.do','${ contextPath }/member/loginForm.do')"
            ><button value="주문하기" class="btn_cart">주문하기</button></a
          >
        </td>
      </tr>
    </table>
    <div id="layerbox" class="layerpop" style="width: 200px; height: 150px">
      <article class="layerpop_area">
        <div class="title">옵션</div>
        <a
          href="javascript:popupClose();"
          class="layerpop_close"
          id="layerbox_close"
          >확인</a
        >
        <br />
        <div class="content">
          <select id="selectDT" onchange="selectBoxChange(this.value);">
            <option value="1개월">1개월 5만원</option>
            <option value="3개월" selected>3개월 13만원</option>
            <option value="6개월">6개월 20만원</option>
            <option value="12개월">12개월 40만원</option>
          </select>
        </div>
      </article>
    </div>
    <div id="layerTbox" class="layerpop" style="width: 200px; height: 150px">
      <article class="layerpop_area">
        <div class="title">옵션</div>
        <a
          href="javascript:popupTClose();"
          class="layerpop_close"
          id="layerbox_close"
          >확인</a
        >
        <br />
        <div class="content">
          <select id="selectPT" onchange="selectTBoxChange(this.value);">
            <option value="박지성">박지성</option>
            <option value="김동현" selected>김동현</option>
            <option value="숀리">숀리</option>
            <option value="밥샵">밥샵</option>
          </select>
          <select id="selectMoney" onchange="selectMBoxChange(this.value);">
            <option value="10회">10회</option>
            <option value="15회" selected>15회</option>
            <option value="30회">30회</option>
            <option value="50회">50회</option>
          </select>
        </div>
      </article>
    </div>
  </body>
</html>
