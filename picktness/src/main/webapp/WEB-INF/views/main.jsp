<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@taglib prefix="tiles"
uri="http://tiles.apache.org/tags-tiles"%> <%@taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>픽트니스</title>
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=abeab8cce28d6c80ad107bfe4e602d58&libraries=services,clusterer,drawing"
    ></script>
    <script>
          $(function () {
            $(".main_banner_list").slick({
              autoplay: true,
              prevArrow: $(".prev"),
              nextArrow: $(".next"),
            });

      var geocoder = new kakao.maps.services.Geocoder();
      $(function(){
      	//지도 보이게 하기
             $(".location_search").click(function () {
             $(".not_modal").css("visibility", "visible");
             $(".modal_location").css("visibility", "visible");
               });
      	//위치 지정가능 지도
      	var mapContainer1 = document.getElementById('location_map'), // 지도를 표시할 div
         	mapOption1 = {
             center: new kakao.maps.LatLng(${lat}, ${lng}), // 지도의 중심좌표
             level: 3 // 지도의 확대 레벨
         };
      	var map1 = new kakao.maps.Map(mapContainer1, mapOption1); // 지도를 생성합니다
         	var marker = new kakao.maps.Marker({
             	map: map1,
             	position: new kakao.maps.LatLng(${lat}, ${lng})
         });

      	//주소 검색시
         	 $("#input_location").on("propertychange change paste input",function () {
         	     var changeLocation = $("#input_location").val();
         	     geocoder.addressSearch(changeLocation, function (result, status) {
         	     // 정상적으로 검색이 완료됐으면
         	     if (status === kakao.maps.services.Status.OK) {
         	     var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
         	     lat = result[0].y;
         	     lng = result[0].x;
         	     // 결과값으로 받은 위치를 마커로 표시합니다
         	     marker.setPosition(coords);

         	     // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
         	     map1.setCenter(coords);
      				}
      			});
      		}
      	);
      	// map1에서 뒤로가기 클릭시
      	  $("#arrow1").click(function () {
               $(".not_modal").css("visibility", "hidden");
               $(".modal_location").css("visibility", "hidden");
               $("#input_location").val("");
      	  });
      	// map1 위치지정 클릭시 controller에 전송하기
            $(".modal_fix").click(function () {
      	    var memberLocation = $("#input_location").val();
      	    location.href="${contextPath}/main.do?lat="+lat+"&lng="+lng+"&memLocation="+memberLocation;
            });
            });
          });
    </script>
    <style>
      .main_banner {
        width: 100%;
      }

      .main_banner_list img {
        width: 100%;
      }

      .prev {
        position: absolute;
        top: 330px;
        left: 100px;
      }

      .next {
        position: absolute;
        top: 330px;
        right: 100px;
      }

      .prev img,
      .next img {
        width: 40px;
        opacity: 50%;
      }

      .container-inner {
        position: relative;
        max-width: 1100px;
        min-height: 120px;
        margin: 0 auto;
      }

      .location_search {
        background-color: #2890f1;
        border-radius: 13px;
        width: 430px;
        height: 40px;
        text-align: center;
        margin: 50px auto;
        padding-top: 15px;
        padding-left: 30px;
        cursor: pointer;
      }

      .location_search img {
        width: 25px;
        position: absolute;
        top: 15x;
        left: 340px;
      }

      .location_search {
        color: #fff;
      }

      .main_box {
        clear: both;
        text-align: left;
      }

      .main_cate {
        font-weight: bold;
        font-size: 35px;
        margin: 10px;
        text-align: center;
      }

      .main_item {
        vertical-align: top;
        position: relative;
        width: 200px;
        display: inline-block;
        margin: 10px 0px 10px 57px;
      }

      .main_img {
        position: relative;
        width: 200px;
      }

      .main_item .title {
        text-align: left;
        font-size: 15px;
        display: block;
        font-weight: bold;
        height: 25px;
      }

      .main_item .l_title {
        text-align: left;
        font-size: 15px;
        display: block;
        font-weight: bold;
        height: 40px;
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

      .all_content {
        border: 2px solid #bfbfbf;
        width: fit-content;
        padding: 10px 40px;
        margin: 10px auto 40px auto;
        border-radius: 30px;
        font-size: 13px;
        cursor: pointer;
      }

      .all_content img {
        width: 11px;
      }

      .work_place {
        text-align: left;
        font-size: 15px;
        display: block;
      }

      .shop_banner {
        width: 1100px;
      }

      .modal_location {
        z-index: 100;
        background-color: white;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-left: -250px;
        margin-top: -250px;
        text-align: center;
        visibility: hidden;
      }

      .modal_map {
        z-index: 100;
        background-color: white;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-left: -250px;
        margin-top: -250px;
        text-align: center;
        visibility: hidden;
      }

      .modal_head {
        border-bottom: 1px solid #555;
      }

      .map-arrow {
        width: 23px;
        float: left;
        margin: 10px 50px 10px 10px;
      }

      .modal_title {
        display: inline-block;
        width: fit-content;
        padding: 10px;
        font-size: 20px;
        font-weight: bold;
      }

      .modal_title2 {
        display: inline-block;
        width: fit-content;
        padding: 10px;
        font-size: 20px;
        font-weight: bold;
      }

      .modal_fix {
        float: right;
        margin: 10px 10px 10px 0px;
      }

      #location_map {
        width: 500px;
        height: 500px;
      }

      #map_map {
        width: 500px;
        height: 500px;
      }

      .modal_search {
        background-color: white;
        padding: 10px;
      }

      #input_location {
        width: 100%;
        height: 100%;
        border: 0;
        padding: 0;
        background: transparent;
        outline: none;
      }

      input:focus {
        outline: none;
      }
    </style>
  </head>
  <body>
    <div class="main_banner">
      <div class="main_banner_list">
        <div>
          <img src="${contextPath}/images/main/main_banner.png" />
        </div>
        <div>
          <img src="${xontextPath}/images/main/main_banner2.png" />
        </div>
      </div>
      <div class="prev">
        <img src="${contextPath}/images/main/left-arrow.png" />
      </div>
      <div class="next">
        <img src="${contextPath}/images/main/right-arrow.png" />
      </div>
    </div>
    <div class="container-inner">
      <div class="location_search">
        <img src="${contextPath}/images/main/location.png" />
        <div class="location_search_text">${memLocation }</div>
      </div>
      <c:choose>
        <c:when test="${!empty healthList }">
          <div class="main_box">
            <div class="main_cate">헬스</div>
            <c:forEach items="${healthList }" var="place">
              <div class="main_item" onClick="location.href='#'">
                <img
                  class="main_img"
                  src="${contextPath}/download.do?cate=place&imageFileName=${place.fileName}&bno=${place.goods_id}"
                />
                <span class="l_title">${place.b_name }</span>
                <span class="location">${place.addrBasic } </span>
                <span class="location">
                  <fmt:formatNumber
                    pattern="0.0"
                    value="${place.distance/1000 }"
                  />km
                </span>
                <span class="price"
                  ><fmt:formatNumber
                    type="number"
                    maxFractionDigits="3"
                    value="${place.prod1retail}"
                  />/월
                </span>
                <div class="cates">
                  <c:if test="${place.allTime == 'Y' }">
                    <div class="cate">24시간</div>
                  </c:if>
                  <div class="cate">${place.cate }</div>
                </div>
                <c:if test="${place.review_count ne 0 }">
                  <div class="star">
                    <img src="${contextPath}/images/main/star.png" />
                    <span class="star"
                      >${place.review_star }(${place.review_count })</span
                    >
                  </div>
                </c:if>
              </div>
            </c:forEach>
          </div>
          <div
            class="all_content"
            onclick="location.href='${contextPath}/goods/placeList.do?cate=health'"
          >
            전체보기 <img src="${contextPath}/images/main/all_arrow.png" />
          </div>
        </c:when>
      </c:choose>

      <c:choose>
        <c:when test="${!empty pilaList }">
          <div class="main_box">
            <div class="main_cate">필라테스</div>
            <c:forEach items="${pilaList }" var="place">
              <div class="main_item" onClick="location.href='#'">
                <img
                  class="main_img"
                  src="${contextPath}/images/main/health4.jpg"
                />
                <span class="l_title">${place.b_name }</span>
                <span class="location">${place.addrBasic } </span>
                <span class="location">
                  <fmt:formatNumber
                    pattern="0.0"
                    value="${place.distance/1000 }"
                  />km
                </span>
                <span class="price">
                  <fmt:formatNumber
                    type="number"
                    maxFractionDigits="3"
                    value="${place.prod1retail}"
                  />/월</span
                >
                <div class="cates">
                  <c:if test="${place.allTime == 'Y' }">
                    <div class="cate">24시간</div>
                  </c:if>
                  <div class="cate">${place.cate }</div>
                </div>
                <c:if test="${place.review_count ne 0 }">
                  <div class="star">
                    <img src="${contextPath}/images/main/star.png" />
                    <span class="star"
                      >${place.review_star }(${place.review_count })</span
                    >
                  </div>
                </c:if>
              </div>
            </c:forEach>
          </div>
          <div
            class="all_content"
            onclick="location.href='${contextPath}/goods/placeList.do?cate=pila'"
          >
            전체보기 <img src="${contextPath}/images/main/all_arrow.png" />
          </div>
        </c:when>
      </c:choose>
      <!--mainbox2-->
      <c:choose>
        <c:when test="${!empty trainerList }">
          <div class="main_box">
            <div class="main_cate">트레이너</div>
            <c:forEach items="${trainerList }" var="trainer">
              <div
                class="main_item"
                onclick="location.href='${contextPath}/goods/trainerDetail.do'"
              >
                <img
                  class="main_img"
                  src="${contextPath}/images/main/tr1.png"
                />
                <span class="title">${trainer.name }</span>
                <span class="trainer_work">${trainer.b_name }</span>
                <span class="location">${trainer.addrBasic } </span>
                <span class="location">
                  <fmt:formatNumber
                    pattern="0.0"
                    value="${trainer.distance/1000 }"
                  />km
                </span>
                <fmt:parseNumber
                  var="price"
                  integerOnly="true"
                  type="number"
                  value="${trainer.prod10retail}"
                />
                <span class="price"
                  ><fmt:formatNumber
                    value="${price /10}"
                    pattern="#,###,###"
                  />/회</span
                >
                <div class="cates">
                  <div class="cate">${trainer.cate }</div>
                </div>
                <c:if test="${trainer.review_count ne 0 }">
                  <div class="star">
                    <img src="${contextPath}/images/main/star.png" />
                    <span class="star"
                      >${trainer.review_star }(${trainer.review_count })</span
                    >
                  </div>
                </c:if>
              </div>
            </c:forEach>
          </div>
          <div
            class="all_content"
            onclick="location.href='${contextPath}/goods/trainerList.do?cate=all'"
          >
            전체보기 <img src="${contextPath}/images/main/all_arrow.png" />
          </div>
        </c:when>
      </c:choose>
      <!--mainbox3-->
      <img
        class="shop_banner"
        src="${contextPath}/images/main/shop_banner.png"
      />
      <c:choose>
        <c:when test="${!empty goodsList }">
          <div class="main_box">
            <div class="main_cate">금주의 베스트 기구/용품/장비</div>
            <c:forEach items="${goodsList }" var="goods">
              <div
                class="main_item"
                onclick="location.href='${contextPath}/goods/gymDetail.do'"
              >
                <img
                  class="main_img"
                  src="${contextPath}/download.do?cate=shop&imageFileName=${goods.fileName}&bno=${goods.goods_id}"
                />
                <span class="l_title">${goods.goods_title }</span>
                <span class="price"
                  ><fmt:formatNumber
                    type="number"
                    maxFractionDigits="3"
                    value="${goods.priceRetail}"
                  />원
                </span>
                <c:if test="${goods.review_count ne 0 }">
                  <div class="star">
                    <img src="${contextPath}/images/main/star.png" />
                    <span class="star"
                      >${goods.review_star }(${goods.review_count })</span
                    >
                  </div>
                </c:if>
              </div>
            </c:forEach>
          </div>
          <div
            class="all_content"
            onclick="location.href='${contextPath}/goods/shopGoodsList.do?cate=all'"
          >
            전체보기 <img src="${contextPath}/images/main/all_arrow.png" />
          </div>
        </c:when>
      </c:choose>
      <!--//main_box-->
      <c:choose>
        <c:when test="${!empty foodList }">
          <div class="main_box">
            <div class="main_cate">운동 후엔 프로틴 쉐이크</div>
            <c:forEach items="${foodList }" var="food">
              <div
                class="main_item"
                onclick="location.href='${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id}'"
              >
                <img
                  class="main_img"
                  src="${contextPath}/download.do?cate=shop&imageFileName=${food.fileName}&bno=${food.goods_id}"
                />
                <span class="l_title">${food.goods_title }</span>
                <span class="price"
                  ><fmt:formatNumber
                    type="number"
                    maxFractionDigits="3"
                    value="${food.priceRetail}"
                  />원
                </span>
                <c:if test="${food.review_count ne 0 }">
                  <div class="star">
                    <img src="${contextPath}/images/main/star.png" />
                    <span class="star"
                      >${food.review_star }(${food.review_count })</span
                    >
                  </div>
                </c:if>
              </div>
            </c:forEach>
          </div>
          <div
            class="all_content"
            onclick="location.href='${contextPath}/goods/shopFoodList.do?cate=protain'"
          >
            전체보기 <img src="${contextPath}/images/main/all_arrow.png" />
          </div>
        </c:when>
      </c:choose>
    </div>
    <div class="modal_location">
      <div class="modal_head">
        <img
          class="map-arrow"
          id="arrow1"
          src="${contextPath}/images/goods/map-arrow.png"
        />
        <div class="modal_title">지도에서 위치 지정</div>
        <div class="modal_fix">위치지정</div>
      </div>
      <div class="modal_search">
        <input
          type="text"
          spellcheck="false"
          id="input_location"
          maxlength="100"
          placeholder="동, 역으로 검색해서 지정하기"
        />
      </div>
      <div id="location_map"></div>
    </div>
    <div class="modal_map">
      <div class="modal_head">
        <img
          class="map-arrow"
          id="arrow2"
          src="${contextPath}/images/goods/map-arrow.png"
        />
        <div class="modal_title2"></div>
        <div class="modal_fix">위치지정</div>
      </div>
      <div id="map_map"></div>
    </div>
  </body>
</html>
