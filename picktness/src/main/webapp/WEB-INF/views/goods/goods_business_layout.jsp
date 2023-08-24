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
    <script src="//code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=abeab8cce28d6c80ad107bfe4e602d58&libraries=services,clusterer,drawing"
    ></script>
    <style>
      body {
        width: 100%;
        margin: 0px auto;
        border: 0px solid #bcbcbc;
      }
      #header {
        position: relative;
        width: 100%;
        z-index: 20;
        background-color: #fff;
      }
      #content {
        width: 100%;
        border: 0px solid #bcbcbc;
      }
      #footer {
        clear: both;
      }
      #talk {
        position: fixed;
        right: 15px;
        bottom: 15px;
      }
      .not_modal {
        position: fixed;
        z-index: 99;
        left: 0;
        top: 0;
        background: rgba(0, 0, 0, 0.52);
        width: 100%;
        height: 100vh;
        visibility: hidden;
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
    <title><tiles:insertAttribute name="title"/></title>
  </head>
  <body>
    <div id="header">
      <tiles:insertAttribute name="header" />
    </div>
    <div id="content">
      <tiles:insertAttribute name="body" />
    </div>
    <div id="footer">
      <tiles:insertAttribute name="footer" />
    </div>
    <div id="talk">
      <tiles:insertAttribute name="talk" />
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
    <script>
		var geocoder = new kakao.maps.services.Geocoder();
	$(function(){
		//지도 보이게 하기
        $(".map_button1").click(function () {
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
		    location.href="${contextPath}/goods/placeList.do?lat="+lat+"&lng="+lng+"&memLocation="+memberLocation;
	      });
	      });
    </script>
    <div class="not_modal"></div>
  </body>
</html>
