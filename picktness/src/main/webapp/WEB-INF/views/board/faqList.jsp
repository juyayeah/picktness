<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <style>
      .faq_inner {
        position: relative;
        width: 1100px;
        margin: 0 auto;
      }
      .layout {
        max-width: 600px;
        margin: 0 auto;
      }

      .qna {
        list-style: none;
        margin: 0;
        padding: 0;
      }
      .qna > li {
        padding: 10px 0;
        box-sizing: border-box;
      }
      .qna > li:nth-child(n + 2) {
        /* 아이템 구분 점선 */
        border-top: 1px dashed #aaa;
      }
      .qna input {
        display: none;
      }

      .qna label {
        /* 제목 - 클릭 영역 */
        font-weight: bold;
        color: #000;
        margin: 20px 0 0;
        cursor: pointer;
      }
      .qna label::before {
        /* 제목 앞 화살표 */
        display: block;
        content: "";
        width: 0;
        height: 0;
        border: 8px solid transparent;
        border-left: 8px solid #a00;
        margin: 2px 0 0 8px;
        float: left;
      }
      .qna input:checked + label::before {
        /* 내용 펼침 상태 제목 앞 화살표 */
        border: 8px solid transparent;
        border-top: 8px solid #a00;
        border-bottom: 0;
        margin: 8px 4px 0;
      }

      .qna div {
        /* 내용 영역 - 기본 감춤 상태 */
        display: none;
        color: #666;
        font-size: 0.9375em;
        overflow: hidden;
        padding: 10px 0 10px 30px;
        box-sizing: border-box;
        transition: max-height 0.4s;
      }
      .qna input:checked + label + div {
        /* 내용 영역 펼침 */
        display: block;
      }
      .divider {
        border-top: 1px solid #ccc;
        margin-top: 20px;
        margin-bottom: 20px;
      }
      .faq_bgc p {
        background-color: aliceblue;
      }
      .button2 {
        float: right;
        background-color: #50aae6;
        color: white;
        border-radius: 10px;
        padding: 15px;
        min-height: 30px;
        min-width: 120px;
      }
    </style>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
      integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="style.css" />
    <title>FAQ</title>
  </head>
  <body>
    <div class="faq_inner">
      <h2>자주묻는 FAQ</h2>
      <s_sidebar_element>
        <div id="searchBox">
          <s_search>
            <input
              type="text"
              name=""
              value=""
              onkeypress="if (event.keyCode == 13) { }"
              class="text"
              placeholder="SEARCH"
            />

            <input value="검색" type="button" onclick="" class="submit" />
          </s_search>
        </div>
      </s_sidebar_element>
      <div class="divider"></div>

      <ul class="qna">
        <li>
          <input type="checkbox" id="qna-1" />
          <label for="qna-1">다른 사람 명의의 계좌로 환불받을 수 있나요?${ }</label>
          <div class="faq_bgc">
            <p>
              다른 사람 명의로는 환불할 수 없습니다. 고객님 본인 명의 계좌로만
              환불이 가능합니다.
            </p>
          </div>
        </li>
        <li>
          <input type="checkbox" id="qna-2" />
          <label for="qna-2">등록한 환불계좌를 등록/변경하고 싶어요.</label>
          <div class="faq_bgc">
            <p>
              마이페이지에서 환불계좌 등록 및 수정이 가능합니다. 환불계좌는
              주문자 명의의 본인 계좌만 등록할 수 있습니다.
            </p>
            <p>
              주문 진행 상태가 '환불진행중' 또는 '환불완료' 에서는 환불계좌를
              변경할 수 없습니다.
            </p>
          </div>
        </li>
        <li>
          <input type="checkbox" id="qna-3" />
          <label for="qna-3">반품 신청을 철회하고 싶어요.</label>
          <div class="faq_bgc">
            <p>
              반품할 상품을 아직 보내지 않은 경우, 마이페이지에서 반품철회를
              하실 수 있습니다.
            </p>
            <p>
              반품철회 후 택배사에서 상품 수거가 된 것으로 확인될 경우 해당
              주문은 반품처리한 것으로 재 변경됩니다.
            </p>
          </div>
        </li>
        <li>
          <input type="checkbox" id="qna-4" />
          <label for="qna-4"
            >배송된 상품이 부재중으로 반송된 경우 어떻게 하나요?</label
          >
          <div class="faq_bgc">
            <p>
              부재 등의 사유로 반송된 상품은 "마이페이지 > 주문 조회"]"에서
              택배사 영업소, 또는 배송 담당 택배원 연락처를 통해 재배송 요청을
              할 수 있습니다. 상품이 이미 반송되어 해당 업체로 입고된 경우, 왕복
              배송비를 추가 부담하셔야 합니다.
            </p>
          </div>
        </li>
        <li>
          <input type="checkbox" id="qna-5" />
          <label for="qna-5"
            >상품에 대해서 문의하려면 어떻게 해야 하나요?</label
          >
          <div class="faq_bgc">
            <p>
              상품에 관한 내용은 상품상세 화면에 자세히 안내되어 있습니다.
              마이페이지 > 주문내역에서 주문한 상품을 선택하면 상세페이지로
              이동합니다. 상품 상세 내용에 표시되어 있지 않은 내용은 판매자에게
              문의해 주십시오.
            </p>
            <p>
              > 판매자에게 문의 1. "마이페이지 > 주문내역에서 상품 선택 >
              배송/교환/반품 안내"에 표기된 판매자 연락처로 문의<br />
              2. "["마이페이지 > 1:1문의하기 > 문읜타입에서 판매자에게
              문의하기"를 선택한 후 질의 내용 작성
            </p>
          </div>
        </li>
      </ul>
      <div class="divider"></div>
     
    </div>
  </body>
</html>
