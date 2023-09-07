<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<style>
.content-inner {
	position: relative;
	max-width: 1100px;
	margin: 0 auto 50px auto;
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

.pc_cate ul {
	height: 30px;
	border-bottom: solid 1px #ccc;
}

.pc_cate li {
	float: left;
	margin: 0px 20px 30px 0px;
	cursor: pointer;
	font-size:14px;
}

.main_box {
	clear: both;
	text-align: left;
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
	height:380px;
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
}
.main_item .trainer_work{
	text-align: left;
	font-size: 12px;
	display: block;
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
.list_null{
clear:both;
margin-top:100px;
text-align:center;
height:300px;
}
.pageBar{
width:100%;
margin-top:40px;
text-align:center;
}
.pageButton{
display:inline-block;
width:30px;
height:25px;
padding-top:5px;
text-align:center;
font-weight:bold;
}
.pageButtonNow{
display:inline-block;
width:30px;
height:25px;
padding-top:4px;
text-align:center;
border:1px solid #2890f1;
font-weight:bold;
color:#2890f1;
}
.pageButtonText{
display:inline-block;
width:100px;
height:24px;
padding-top:6px;
margin:0px 10px;
color:#a6a6a6;
font-size:14px;
}
	.main_item .original_price{
	font-size:13px;
	text-decoration: line-through;
	}
</style>
<script>
	$(function() {
		switch ("${cate}") {
		case "all":
			$("#allcate").css("font-weight", "bold");
			break;
		case "health":
			$("#health").css("font-weight", "bold");
			break;
		case "cross":
			$("#cross").css("font-weight", "bold");
			break;
		case "yoga":
			$("#yoga").css("font-weight", "bold");
			break;
		case "pila":
			$("#pila").css("font-weight", "bold");
			break;
		case "boxing":
			$("#boxing").css("font-weight", "bold");
			break;
		case "jiu":
			$("#jiu").css("font-weight", "bold");
			break;
		case "allTime":
			$("#allTime").css("font-weight", "bold");
			break;
		}
	});
</script>
<title>트레이너리스트</title>
</head>
<body>
	<div class="content-inner">
		<div class="content_title">트레이너</div>
		<div class="member_location">${memLocation }</div>
		<div class="change_location">
			<div class="map_button1">
				<img src="${contextPath}/images/main/location.png" /> <span>위치
					변경하기</span>
			</div>
		</div>
		<div class="pc_cate">
			<ul>
				<li id="allcate"><a
					href="${contextPath}/goods/trainerList.do?cate=all">전체보기</a></li>
				<li id="health"><a
					href="${contextPath}/goods/trainerList.do?cate=health">헬스</a></li>
				<li id="cross"><a
					href="${contextPath}/goods/trainerList.do?cate=cross">크로스핏</a></li>
				<li id="yoga"><a
					href="${contextPath}/goods/trainerList.do?cate=yoga">요가</a></li>
				<li id="pila"><a
					href="${contextPath}/goods/trainerList.do?cate=pila">필라테스</a></li>
				<li id="boxing"><a
					href="${contextPath}/goods/trainerList.do?cate=boxing">복싱</a></li>
				<li id="jiu"><a
					href="${contextPath}/goods/trainerList.do?cate=jiu">주짓수</a></li>
			</ul>
		</div>
		<c:choose>
		<c:when test="${!empty trainerList }">
		<div class="main_box">
			<c:forEach items="${trainerList }" var="trainer">
				<div class="main_item"
					onclick="location.href='${contextPath}/goods/trainerDetail.do'">
					<img class="main_img" src="${contextPath}/images/main/tr1.png" />
					<span class="title">${trainer.name }</span>
					<span class="trainer_work">${trainer.b_name }</span>
					<span class="location">${trainer.addrBasic } 
					</span>
					<span class="location">
					<fmt:formatNumber pattern="0.0" value="${trainer.distance/1000 }"/>km</span>
					<fmt:parseNumber var="price" integerOnly="true" type="number" value="${trainer.prod10retail}" />
					<fmt:parseNumber var="original_price" integerOnly="true" type="number" value="${tainer.prod10 }"/>
					<c:choose>
                <c:when test="${original_price ne price }">
                <span class="original_price">
				<fmt:formatNumber
                    value="${original_price /10}"
                    pattern="#,###,###"
                  />/회
                </span>
                <span class="price"
                  ><fmt:formatNumber
                    value="${price /10}"
                    pattern="#,###,###"
                  />/회</span
                >
                </c:when>
                <c:otherwise>
                                <span class="price"
                  ><fmt:formatNumber
                    value="${price /10}"
                    pattern="#,###,###"
                  />/회</span
                >
                </c:otherwise>
                </c:choose>
					
					<div class="cates">
					<div class="cate">${trainer.cate }</div>
					</div>
					<c:if test="${trainer.review_count ne 0 }">
					<div class="star">
						<img src="${contextPath}/images/main/star.png" /> 
						<span class="star">${trainer.review_star }(${trainer.review_count })</span>
					</div>
					</c:if> 
				</div>
			</c:forEach>
			</div>
			<div class="pageBar">
			<c:choose>
			<c:when test="${totalGoods > 100}">
			<c:forEach var="page" begin="1" end="10" step="1">
			<c:if test="${section > 1 && page == 1 }">
			<div class="pageButtonText">
			<a href="${contextPath }/goods/trainerList.do?cate=${cate }&section=${section-1 }&pageNum=${(section-1)*10 + 1 }">이전페이지</a>
			</div>
			</c:if>
			<c:choose>
			<c:when test="${page==pageNum }">
			<div class="pageButtonNow">
			<a href="${contextPath }/goods/trainerList.do?cate=${cate}&section=${section}&pageNum=${page}">${(section-1)*10+page }</a>
			</div>
			</c:when>
			<c:otherwise>
			<div class="pageButton">
			<a href="${contextPath }/goods/trainerList.do?cate=${cate}&section=${section}&pageNum=${page}">${(section-1)*10+page }</a>
			</div>
			</c:otherwise>
			</c:choose>
			<c:if test="${page==10 }">
			<div class="pageButtonText">
			<a href="${conteatPath }/goods/trainerList.do?cate=${cate }&section=${section+1 }&pageNum=${(section*10)+1 }">다음페이지</a>
			</div>
			</c:if>
			</c:forEach>
			</c:when>
			<c:when test="${totalGoods == 100 }">
			<c:forEach var="page" begin="1" end="10" step="1">
			<c:choose>
			<c:when test="${page==pageNum }">
			<div class="pageButtonNow">
			<a href="${contextPath }/goods/trainerList.do?cate=${cate}&section=${section}&pageNum=${page}">${page }</a>
			</div>
			</c:when>
			<c:otherwise>
			<div class="pageButton">
			<a href="${contextPath }/goods/trainerList.do?cate=${cate}&section=${section}&pageNum=${page}">${page }</a>
			</div>
			</c:otherwise>
			</c:choose>
			</c:forEach>
			</c:when>
			<c:when test="${totalGoods <100 }">
			<c:forEach var="page" begin="1" end="${(totalGoods-1)/12+1 }" step="1">
			<c:choose>
			<c:when test="${page==pageNum }">
			<div class="pageButtonNow">
			<a href="${contextPath }/goods/trainerList.do?cate=${cate}&section=${section}&pageNum=${page}">${page }</a>
			</div>
			</c:when>
			<c:otherwise>
			<div class="pageButton">
			<a href="${contextPath }/goods/trainerList.do?cate=${cate }&section=${section }&pageNum=${page }">${page }</a>
			</div>
			</c:otherwise>
			</c:choose>
			</c:forEach>
			</c:when>
			</c:choose>
			</div>
			</c:when>
			<c:otherwise>
			<div class="list_null">
            <img src="${contextPath}/images/goods/exclamation.png">
            <p>현재 위치 주변에 등록된 트레이너가 없습니다.<br>
            위치를 바꾸고 다시 시도해 주세요.</p>
          </div>
			</c:otherwise>
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
		    location.href="${contextPath}/goods/trainerList.do?lat="+lat+"&lng="+lng+"&memLocation="+memberLocation;
	      });
	      });
    </script>
</body>
</html>
