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
/* .bodybody td{
vertical-align: top;
} */

.bodybody p{
margin:0 auto;
margin-top:20px;
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
	color: #f2f2f2;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
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
	height: 200px;
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
/*post slider-end*/
</style>

<script language="javaScript">
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

	function nowbuy() {
		var dd = document.getElementById("selectlist");
	}

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
</script>

</head>
<body>
	<div class="bodybody">
		<form action="${contextPath }/member/modStudent.do" method="post"
			name="frmStudent" enctype="multipart/form-data">
			<div>
				<table border=0 align="center" width="1100px">
					<tr>
						<!-- 사진칸 -->
						<td class="detail_gym_img" width="40%" height="40%" rowspan="7"><input
							type="hidden" name="originalFileName"
							value="${user.imageFileName }" /> <!--    <img src="./img/trainer.png"> -->


							<div class="slideshow-container">

								<!-- Full-width images with number and caption text -->
								<div class="mySlides fade">
									<div class="numbertext">1 / 4</div>
									<img src="${contextPath}/images/member/park1.jpg"
										class="img-size" />
									<div class="text">Picktness</div>
								</div>

								<div class="mySlides fade">
									<div class="numbertext">2 / 4</div>
									<img src="${contextPath}/images/member/park2.jpg"
										class="img-size">
									<div class="text">Picktness</div>
								</div>

								<div class="mySlides fade">
									<div class="numbertext">3 / 4</div>
									<img src="${contextPath}/images/member/park3.jpg"
										class="img-size">
									<div class="text">Picktness</div>
								</div>

								<div class="mySlides fade">
									<div class="numbertext">4 / 4</div>
									<img src="${contextPath}/images/member/park4.jpg"
										class="img-size">
									<div class="text">Picktness</div>
								</div>


								<!-- Next and previous buttons -->
								<a class="prev" onclick="moveSlides(-1)">&#10094;</a> <a
									class="next" onclick="moveSlides(1)">&#10095;</a>
							</div> <br>

							<div style="text-align: center">
								<span class="dot" onclick="currentSlide(0)"></span> <span
									class="dot" onclick="currentSlide(1)"></span> <span class="dot"
									onclick="currentSlide(2)"></span> <span class="dot"
									onclick="currentSlide(3)"></span>
							</div> <!-- <img src="${contextPath }/download.do?imageFileName=${member.imageFileName }&num=${member.num}" id="preview" width="300px" height="300px" /><br> <input type="file"
                  name="imageFileName" id="imageFileName"
                  onchange="readURL(this);" disabled /></td> --> <!-- disabled 있으면 바꿀 수 없음 -->
							<!-- 트레이너 정보 --></td>
						<td align="left">
							<h2 style="padding: 0 0 0 30px; margin-bottom: 1px;">박지성 선생님</h2>
							<a style="padding: 0 0 0 30px; font-size: 13px;"
							href="https://map.naver.com/v5/entry/place/1213678018?c=15,0,0,0,dh">대전광역시
								서구 대덕대로 226 명동플라자 2층 헬스보이짐</a> <!-- 고객이 보는 창 --> <input
							type="hidden" value="${member.num}" name="num" /> <!-- 인터페이스 -->
						</td>
					</tr>
					<tr>
						<td align="left"><span
							style="padding: 0 0 0 30px; font-size: 20px;">P.T 이용권</span></td>
					</tr>
					<tr>
						<td align="left"><b
							style="padding: 0 0 0 30px; font-size: 23px;">10회당 700,000원</b><span
							style="font-size: 11px"> 부터~</span></td>
					</tr>
					<tr>
						<td align="left" style="padding: 0 0 0 30px;"><select>
								<option selected>[필수]옵션선택</option>
								<option>10회 700,000원</option>
								<option>20회 1,400,000원</option>
								<option>30회 2,100,000원</option>
						</select></td>
					</tr>
					<tr>
						<td align="center"><b style="font-size: 23px;">10회
								700,000원</b></td>
					</tr>
					<td align="left" style="padding: 0 0 10px 30px;">
						<button class=button_white value="장바구니">장바구니</button>&nbsp;&nbsp;
						<button class=button_blue id="nowbuy" onclick="nowbuy()">바로구매</button>
					</td>
				</table>
			</div>
			<hr>
			<div>
				<nav class="info-nav">
					<ul>
						<li><a href="#" class="hover-underline" onclick="content()">상품정보</a></li>
						<li><a href="#" class="hover-underline" onclick="review()">이용후기</a></li>
						<li><a href="#" class="hover-underline" onclick="inquiry()">상품문의</a></li>
					</ul>
				</nav>
			</div>
			<!-- 소개 및 정보 시작 -->
			<div class=gymdetail_content style="display: block;"
				id="gymdetail_content">
				<p>자기소개</p>
				<textarea rows="15" cols="60" name="" disabled ></textarea>
				<p>자격증</p>
				<textarea rows="8" cols="60" name="" disabled >
				트레이너 자격사항
				</textarea>

				<div>
					<p>소속</p>
					<table>
						<tr>
							<td><img src="${contextPath}/images/member/gym1.png"
								width="200px" align="right"></td>
							<td width="10%"></td>
							<td class="addressgym" width="50%"><b>헬스보이짐&필라걸 둔산점</b><br>
								대전 서구 대덕대로 226 명동프라자 2층 헬스보이짐<br> 연락처:0507-1441-8922</td>
						</tr>
						<tr><td colspan="2"><br><br><br></td>
						</tr>
					</table>
				</div>
			</div>

			<div class=gymdetail_review style="display: none"
				id="gymdetail_review">
				<p>이용후기</p>
				<textarea rows="15" cols="60" name="" disabled></textarea>
			</div>
			<!-- 상품문의 -->
			<div class=gymdetail_inquiry style="display: none"
				id="gymdetail_inquiry">
				<p>상품문의</p>
				<textarea rows="15" cols="60" name="" disabled></textarea>
			</div>
		</form>
	</div>
</body>
</html>