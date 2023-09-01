<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<meta charset="UTF-8">
<title>운동시설 상세페이지</title>
<style>
/* #tr_btn_modify{
display: none;
} */
.bodybody li {
	display: inline-block;
}

.addressgym {
	text-align: left;
	vertical-align: middle;
}

.detail_gym_img {
	padding: 40px;
}

.bodybody {
	width: 1100px;
	margin: 0 auto;
	padding: 0;
	box-sizing: border-box;
}
/*  .bodybody td{
vertical-align: top;
} */
.bodybody p {
	margin: 0 auto;
	margin-top: 20px;
}

.img-size {
	width: 300px;
	height: 300px;
}
/* Slideshow container */
.slideshow-container {
	max-width: 300px;
	max-height: 300px;
	position: relative;
	margin: auto;
}

.slideshow-container .mySlides img {
	height: 300px;
}

/* Hide the images by default */
.mySlides {
	display: none;
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	margin-top: -22px;
	padding: 16px;
	color: white;
	font-weight: bold;
	font-size: 18px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
	user-select: none;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

/* Caption text */
.text {
	color: #;
	font-size: 10px;
	padding: 8px 12px;
	border-radius: 10px;
	margin-left: 35%;
	position: absolute;
	bottom: 8px;
	width: 60px;
	background-color: rgba(255, 255, 255, 0.8);
	text-align: center;
	cursor: pointer;
}

/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

/* The dots/bullets/indicators */
.dot {
	cursor: pointer;
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active, .dot:hover {
	background-color: #717171;
}

/* Fading animation */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@
keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
a:link {
	text-decoration: none;
	color: black;
}

a:visited {
	text-decoration: none;
	color: black;
}

a:active {
	text-decoration: none;
	color: black;
}

a:hover {
	color: black;
	text-decoration: none;
}

.button_white {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	margin-right: -4px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: -3px;
	border: 2px solid #000;
	background-color: #fff;
	color: #000;
	font-size: 12px;
	padding: 20px 70px;
}

.button_white:hover {
	cursor: pointer;
	border-color: #2890f1;
}

.button_blue:hover {
	cursor: pointer;
	border-color: #fff;
}

.button_blue {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	margin-right: -4px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: -3px;
	border: 2px solid #2890f1;
	background-color: #2890f1;
	color: #fff;
	font-size: 12px;
	padding: 20px 70px;
}

.info-nav {
	background: #fff;
	padding: 0;
	text-align: center;
}

.hover-underline {
	position: relative;
	padding: 0 150px 10px 0;
	color: #000;
	text-decoration: none;
}

.hover-underline:hover::after {
	content: '';
	position: absolute;
	width: 40%;
	height: 4px;
	bottom: 0;
	right: 67%;
	background-color: #000;
	transform-origin: bottom center;
	transition: transform 0.25s ease-out;
}

.hover-underline:hover {
	font-weight: bold;
}

.gymdetail_content {
	margin: 0 50px;
}

.gymdetail_content>p {
	text-align: left;
	padding: 5px;
}

.gymdetail_review {
	margin: 0 50px;
}

.gymdetail_review>p {
	text-align: left;
	padding: 5px;
}

.gymdetail_inquiry {
	margin: 0 50px;
}

.gymdetail_inquiry>p {
	text-align: left;
	padding: 5px;
}

.bodybody textarea {
	width: 1000px;
	border: 2px solid #c0c0c0;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	padding: 10px;
	resize: none;
}

.intro_etc {
	width: 100%;
	border: 2px solid #c0c0c0;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	padding: 10px;
}
/*post slider*/
.bobyboby * {
	padding: 0 auto;
	vertical-align: top;
}

.post-slider {
	width: 80%;
	margin: 0px auto;
	position: relative;
}

.post-slider {
	text-align: center;
	margin: 30px auto;
}

.psliderost- .next {
	position: absolute;
	top: 50%;
	right: 30px;
	font-size: 2em;
	color: gray;
	cursor: pointer;
}

.post-slider .prev {
	position: absolute;
	top: 50%;
	left: 30px;
	font-size: 2em;
	color: gray;
	cursor: pointer;
	z-index: 9999;
}

.post-slider .post-wrapper {
	width: 90%;
	height: 220px;
	margin: 0px auto;
	overflow: hidden;
	padding: 10px 0px 10px 0px;
	vertical-align: top;
}

.post-slider .post-wrapper .post {
	width: 120px;
	height: 80px;
	margin: 10px;
	display: inline-block;
	background: white;
	border-radius: 5px;
}

.post-slider .post-wrapper .post .post-info {
	font-size: 13px;
	height: 10%;
	padding-left: 10px;
}

.post-slider .post-wrapper .post .slider-image {
	width: 120px;
	height: 150px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
}

.review_button {
	font-size: 13px;
	float: right;
	text-align: center;
	width: 90px;
	padding: 10px 0px;
	border: 1px solid #555;
	border-radius: 5px;
	cursor: pointer;
}

.review_null {
	clear: both;
	margin: 30px 0px;
	text-align: center;
}
#option_prod1{
display:block;
}
#option_prod3{
display:none;
}
#option_prod6{
display:none;
}
#option_prod12{
display:none;
}
.alreadyCart{
	display: none;
	position: relative;
    top: -120px;
    left:-3px;
    background-color: #383838;
    color: #fff;
}
.alreadyCart_p{
    border-radius: 4px;
	width: 355px;
	height: 17px;
    padding: 20px 20px;
	background-color: #383838;
    position: absolute;
    line-height: normal;
    font-size: 13px;
}
.alreadyCart_p a{
	margin-left:50px;
    line-height: normal;
    font-size: 13px;
    color:#2890f1;
}
/*post slider-end*/
</style>

<script type="text/javascript">
	var slideIndex = 0; //slide index

	// HTML 로드가 끝난 후 동작
	window.onload = function() {
		showSlides(slideIndex);

		// Auto Move Slide
		var sec = 3000;
		setInterval(function() {
			slideIndex++;
			showSlides(slideIndex);

		}, sec);
	}

	// Next/previous controls
	function moveSlides(n) {
		slideIndex = slideIndex + n
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

		if ((n + 1) > size) {
			slideIndex = 0;
			n = 0;
		} else if (n < 0) {
			slideIndex = (size - 1);
			n = (size - 1);
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

	//상품정보, 이용후기, 상품문의 마우스 이벤트
	function content() {
		document.getElementById("gymdetail_content").style.display = "block";
		document.getElementById("gymdetail_review").style.display = "none";
		document.getElementById("gymdetail_inquiry").style.display = "none";
	};
	function review() {
		document.getElementById("gymdetail_content").style.display = "none";
		document.getElementById("gymdetail_review").style.display = "block";
		document.getElementById("gymdetail_inquiry").style.display = "none";
	};
	function inquiry() {
		document.getElementById("gymdetail_content").style.display = "none";
		document.getElementById("gymdetail_review").style.display = "none";
		document.getElementById("gymdetail_inquiry").style.display = "block";
	};

	/*post slider start*/
	$('.post-wrapper').slick({
		slidesToShow : 3,
		slidesToScroll : 1,
		autoplay : true,
		autoplaySpeed : 2000,
		nextArrow : $('.next'),
		prevArrow : $('.prev'),
	});
	/*post slider-end*/
	
	function fn_select(){
		var option = $("#selectBox").val();
		  switch (option){
		    case "prod1retail": 
		    	$("#option_prod1").css("display", "block");
		    	$("#option_prod3").css("display", "none");
		    	$("#option_prod6").css("display", "none");
		    	$("#option_prod12").css("display", "none");
		      break; 
		    case "prod3retail": 
		    	$("#option_prod1").css("display", "none");
		    	$("#option_prod3").css("display", "block");
		    	$("#option_prod6").css("display", "none");
		    	$("#option_prod12").css("display", "none");
		      break;
		    case "prod6retail":
		    	$("#option_prod1").css("display", "none");
		    	$("#option_prod3").css("display", "none");
		    	$("#option_prod6").css("display", "block");
		    	$("#option_prod12").css("display", "none");
		      break;
		    case "prod12retail":
		    	$("#option_prod1").css("display", "none");
		    	$("#option_prod3").css("display", "none");
		    	$("#option_prod6").css("display", "none");
		    	$("#option_prod12").css("display", "block");
		      break;
		  }
}

function fn_cartLogin(){
	alert("로그인 후 이용해 주세요");
	var uri = "${contextPath }/goods/placeDetail.do?goods_id=${place.goods_id}";
	$.ajax({
		url : "${contextPath}/redirectUri.do",
		method : "post",
		data : {
			str : uri
		},
		success : function(data, status, xhr) {
			window.location.href = "${contextPath}/member/loginForm.do";
		}
	});
}

function fn_buyLogin(){
	alert("로그인 후 이용해 주세요");
	var uri = "${contextPath }/goods/placeDetail.do?goods_id=${place.goods_id}";
	$.ajax({
		url : "${contextPath}/redirectUri.do",
		method : "post",
		data : {
			str : uri
		},
		success : function(data, status, xhr) {
			window.location.href = "${contextPath}/member/loginForm.do";
		}
	});
}
function fn_addCart(){
	var goods_option = $("#selectBox").val();
	
	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/member/cart/addCart.do",
		data : {
			goods_id:"${place.goods_id}",
			member_id:"${member.id}",
			goods_option:goods_option
			
		},
		success : function(data) {
			if(data == 'add'){
				alert("등록에 성공했습니다.");
			} else{
				$(".alreadyCart").css('display','block');
				$(".alreadyCart_p").css('display', 'block');
				setTimeout(function(){ $( '.alreadyCart_p' ).fadeOut();}, 2500);
				setTimeout(function(){ $(".alreadyCart").css('display','none');}, 3000);
			}
		},
        error: function (request, error) {
            alert("장바구니에 상품을 추가하는 중 문제가 생겼습니다.");
          }
	}); //end ajax	
}

function fn_buyNow(){
	
}
	
</script>

</head>
<body>
	<div class="bodybody">
	<form>
	<input type="hidden" name="option">
	</form>
		<div>
			<table>
				<tr>
					<!-- 사진칸 -->
					<td class="detail_gym_img" width="40%" height="40%" rowspan="7"><input
						type="hidden" name="originalFileName"
						value="${user.imageFileName }" /> <!--    <img src="./img/trainer.png"> -->


						<div class="slideshow-container">

							<!-- Full-width images with number and caption text -->
							<c:forEach items="${imageList }" var="image" varStatus="status">
								<div class="mySlides fade">
									<div class="numbertext">${status.count }/
										${imageList.size() }</div>
									<img
										src="${contextPath}/download.do?cate=place&imageFileName=${image.fileName }&bno=${place.goods_id}"
										class="img-size" />
								</div>
							</c:forEach>


							<%-- 								<div class="mySlides fade">
									<div class="numbertext">2 / 6</div>
									<img src="${contextPath}/images/member/gym2.png"
										class="img-size">
								</div>

								<div class="mySlides fade">
									<div class="numbertext">3 / 6</div>
									<img src="${contextPath}/images/member/gym3.png"
										class="img-size">
								</div>

								<div class="mySlides fade">
									<div class="numbertext">4 / 6</div>
									<img src="${contextPath}/images/member/gym4.png"
										class="img-size">
								</div>

								<div class="mySlides fade">
									<div class="numbertext">5 / 6</div>
									<img src="${contextPath}/images/member/health1.jpg"
										class="img-size">
								</div>

								<div class="mySlides fade">
									<div class="numbertext">6 / 6</div>
									<img src="${contextPath}/images/member/health2.jpg"
										class="img-size">
								</div> --%>

							<!-- Next and previous buttons -->
							<c:choose>
								<c:when test="${imageList.size() ne 1 }">
									<a class="prev" onclick="moveSlides(-1)">&#10094;</a>
									<a class="next" onclick="moveSlides(1)">&#10095;</a>
								</c:when>
							</c:choose>
						</div> <br />

						<div style="text-align: center">
							<c:forEach var="i" begin="0" end="${imageList.size() -1 }">
								<span class="dot" onclick="currentSlide(${i})"></span>
							</c:forEach>
							<!-- 								<span class="dot" onclick="currentSlide(1)"></span>
								<span class="dot" onclick="currentSlide(2)"></span>
								<span class="dot" onclick="currentSlide(3)"></span>
								<span class="dot" onclick="currentSlide(4)"></span>
								<span class="dot" onclick="currentSlide(5)"></span> -->
						</div></td>
					<td align="left">
						<h2 style="padding: 0 0 0 30px; margin-bottom: 1px;">${place.b_name }</h2>
						<a style="padding: 0 0 0 30px; font-size: 13px;"
						href="https://map.naver.com/v5/entry/place/1213678018?c=15,0,0,0,dh">${place.addrBasic }
							${place.addrDetail }</a>
					</td>
				</tr>
				<tr>
					<td align="left"><span
						style="padding: 0 0 0 30px; font-size: 20px;">${place.cate }
							이용권</span></td>
				</tr>
				<tr>
					<td align="left"><b
						style="padding: 0 0 0 30px; font-size: 23px;"> <fmt:formatNumber
								type="number" maxFractionDigits="3" value="${place.prod1retail}" />/월
					</b><span style="font-size: 11px"> 부터</span></td>
				</tr>
				<tr>
					<td align="left" style="padding: 0 0 0 30px;"><select
						id="selectBox" onchange="fn_select()">
							<option value="prod1retail" selected>1개월 이용권
								<fmt:formatNumber type="number" maxFractionDigits="3"
									value="${place.prod1retail}" />원
							</option>
							<c:if
								test="${place.prod3retail ne '' && place.prod3retail ne null}">
								<option value="prod3retail">3개월 이용권
									<fmt:formatNumber type="number" maxFractionDigits="3"
										value="${place.prod3retail}" />원
								</option>
							</c:if>
							<c:if
								test="${place.prod6retail ne '' && place.prod6retail ne null }">
								<option value="prod6retail">6개월 이용권
									<fmt:formatNumber type="number" maxFractionDigits="3"
										value="${place.prod6retail}" />원
								</option>
							</c:if>
							<c:if
								test="${place.prod12retail ne '' && place.prod12retail ne null}">
								<option value="prod12retail">12개월 이용권
									<fmt:formatNumber type="number" maxFractionDigits="3"
										value="${place.prod12retail}" />원
								</option>
							</c:if>
					</select></td>
				</tr>
				<tr>
					<td align="center">
					<b style="font-size: 23px;" id="option_prod1">1개월 이용권 <fmt:formatNumber type="number" maxFractionDigits="3" value="${place.prod1retail}" />원</b>
					<b style="font-size: 23px;" id="option_prod3">3개월 이용권 <fmt:formatNumber type="number" maxFractionDigits="3" value="${place.prod3retail}" />원</b>
					<b style="font-size: 23px;" id="option_prod6">6개월 이용권 <fmt:formatNumber type="number" maxFractionDigits="3" value="${place.prod6retail}" />원</b>
					<b style="font-size: 23px;" id="option_prod12">12개월 이용권 <fmt:formatNumber type="number" maxFractionDigits="3" value="${place.prod12retail}" />원</b>
					
					</td>
				</tr>
				<tr>
					<td align="left" style="padding: 0 0 10px 30px;">
					<c:choose>
					<c:when test="${! empty member}">
						<button class=button_white onClick="fn_addCart()">장바구니</button>&nbsp;&nbsp;
						<button class=button_blue id="nowbuy" onclick="fn_buyNow()">바로구매</button>
					</c:when>
					<c:otherwise>
						<button class=button_white onClick="fn_cartLogin()">장바구니</button>&nbsp;&nbsp;
						<button class=button_blue id="nowbuy" onclick="fn_buyLogin()">바로구매</button>
					</c:otherwise>
					</c:choose>
						<div class="alreadyCart">
	<div class="alreadyCart_p">
		이미 장바구니에 있는 상품입니다.
		<a href="${contextPath }/member/cart/cartList.do">장바구니로 가기</a>
	</div>
	</div>
					</td>
				</tr>
			</table>
		</div>
		<hr>
		<div>
			<nav class="info-nav">
				<ul>
					<li><a href="#" class="hover-underline" onclick="content()">상품정보</a></li>
					<li><a href="#" class="hover-underline" onclick="review()">이용후기${place.review_count }</a></li>
					<li><a href="#" class="hover-underline" onclick="inquiry()">상품문의</a></li>
				</ul>
			</nav>
		</div>
		<!-- 소개 및 정보 시작 -->
		<div class=gymdetail_content style="display: block;"
			id="gymdetail_content">
			<p>시설소개</p>
			<textarea rows="15" cols="60" disabled>${place.detail }</textarea>
			<c:if test="${place.notice != '' && place.notice != null }">
				<p>공지사항</p>
				<textarea rows="8" cols="60" disabled>${place.notice }</textarea>
			</c:if>
			<p>운영시간</p>
			<textarea rows="8" cols="60" disabled>${place.b_time }</textarea>
			<p>운영프로그램</p>
			<textarea rows="3" cols="60" disabled>${place.program }</textarea>
			<c:if test="${place.service != '' && place.service != null }">
				<p>부가서비스</p>
				<textarea rows="2" cols="60" disabled>${place.service }</textarea>
			</c:if>
			<c:if test="${!empty trainerList}">
				<p>트레이너</p>
				<div class="intro_etc">
					<!-- post slider start-->
					<div class="page-wrapper" style="position: relative;">
						<!--page slider -->
						<div class="post-slider">
							<i class="fas fa-chevron-left prev"></i> <i
								class="fas fa-chevron-right next"></i>
							<div class="post-wrapper" style="vertical-align: top;">
								<div class="post">
									<a href="#"><img src="${contextPath}/images/member/tr1.png"
										class="slider-image">
										<div class="post-info">
											<p>홍길동 트레이너</p>
											<b>60,000/1회</b>
										</div> </a>
								</div>
								<div class="post">
									<a href="#"><img src="${contextPath}/images/member/tr2.png"
										class="slider-image">
										<div class="post-info">
											<p>고길동 트레이너</p>
											<b>120,000/1회</b>
										</div> </a>
								</div>
								<div class="post">
									<a href="#"><img src="${contextPath}/images/member/tr3.png"
										class="slider-image">
										<div class="post-info">
											<p>김길동 트레이너</p>
											<b>160,000/1회</b>
										</div> </a>
								</div>
								<div class="post">
									<a href="#"><img src="${contextPath}/images/member/tr4.png"
										class="slider-image">
										<div class="post-info">
											<p>박길동 트레이너</p>
											<b>80,000/1회</b>
										</div> </a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<!--post slider end-->

			<!-- 지도 API -->
			<div>
				<p>위치</p>
				<table>
					<tr>
						<td>
							<div class="intro_etc" id="map"
								style="width: 500px; height: 250px;">



								<script type="text/javascript"
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fd716f679541979de6d4799000a6523c"></script>
								<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
								center : new kakao.maps.LatLng(${place.lat},
										${place.lng}), // 지도의 중심좌표
								level : 3
							// 지도의 확대 레벨
							};

							var map = new kakao.maps.Map(mapContainer,
									mapOption); // 지도를 생성합니다

							// 마커가 표시될 위치입니다 
							var markerPosition = new kakao.maps.LatLng(
									${place.lat}, ${place.lng});

							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
								position : markerPosition
							});

							// 마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);

							// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
							// marker.setMap(null);
						</script>
							</div>
						</td>
						<td width="10%"></td>
						<td width="50%" class="addressgym"><b>${place.b_name }</b><br>
							${place.addrBasic } ${place.addrDetail }<br> 연락처 :
							${place.phone1 }-${place.phone2 }-${place.phone3 }</td>
					</tr>
				</table>
			</div>
		</div>
		<div class=gymdetail_review style="display: none"
			id="gymdetail_review">
			<p>이용후기</p>
			<c:choose>
				<c:when test="${reviewList ne null }">
					<textarea rows="15" cols="60" name="" disabled /></textarea>
				</c:when>
				<c:otherwise>
					<div class="review_button">리뷰 작성</div>
					<div class="review_null">등록된 후기가 없습니다.</div>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- 상품문의 -->
		<div class=gymdetail_inquiry style="display: none"
			id="gymdetail_inquiry">
			<p>상품문의</p>
			<button value="1:1문의하기">1:1문의하기</button>
			<button value="상품문의하기">상품문의하기</button>
			<textarea rows="15" cols="60" name="" disabled /></textarea>
		</div>
		<br>
		<br>
		<br>
		<br>
	</div>
</body>
</html>