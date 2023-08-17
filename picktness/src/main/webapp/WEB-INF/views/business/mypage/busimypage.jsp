<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>관리자페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	// html dom 이 다 로딩된 후 실행된다.
	$(document).ready(function() {
		// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
		$(".menu>a").mouseover(function() {
			var submenu = $(this).next("ul");

			// submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
			if (submenu.is(":visible")) {
				submenu.slideUp();
			} else {
				submenu.slideDown();
			}
		});
	});

	/* 버튼 색 하나만 눌려있기 */
	var menu = document.getElementsByClassName("menu");

	function handleClick(event) {
		console.log(event.target);
		// console.log(this);
		// 콘솔창을 보면 둘다 동일한 값이 나온다

		console.log(event.target.classList);

		if (event.target.classList[1] === "clicked") {
			event.target.classList.remove("clicked");
		} else {
			for (var i = 0; i < menu.length; i++) {
				menu[i].classList.remove("clicked");
			}

			event.target.classList.add("clicked");
		}
	}

	function init() {
		for (var i = 0; i < menu.length; i++) {
			menu[i].addEventListener("click", handleClick);
		}
	}

	init();
</script>

<style>
.menu a {
	cursor: pointer;
}

.menu .hide {
	display: none;
}

a:link {
	text-decoration: none;
	color: black;
}

a:visited::after {
	text-decoration: none;
	color: #000;
}

a:visited {
	text-decoration: none;
	color: #000;
}

a:hover {
	text-decoration: none;
	color: #2890f1;
}

a:active {
	text-decoration: none;
	color: #2890f1;
}

.minimi:link {
	text-decoration: none;
	color: #a0a0a0;
}

.minimi:visited {
	text-decoration: none;
	color: #a0a0a0;
}

.minimi:hover {
	text-decoration: none;
	color: #2890f1;
}

.minimi:active {
	text-decoration: none;
	color: #2890f1;
}

ol, ul {
	list-style: none;
}

li {
	display: list-item;
	text-align: -webkit-match-parent;
}

.aside-menu-wrap {
	width: 200px;
	margin: 30px auto;
}

.aside-menu-nav {
	padding: 10px 24px;
	border: 3px solid #2890f1;
	border-radius: 4px;
	text-align: center;
}

.menu-list {
	margin: 0px;
	padding: 0px;
}

.menu-list>li {
	padding: 5px 0;
}

.mypage-name {
	font-size: 19px;
	padding: 0px;
}

.underline {
	width: 100%;
}

.aside-menu-nav .menu-list>li .menu {
	font-size: 16px;
	font-weight: 500;
}

.aside-menu-nav .menu-list>li .hide {
	margin-top: 5px;
	padding: 0px;
}

.hide li {
	font-size: 14px;
	padding: 3px 0 0 0;
}

.hide {
	display: none;
}

.hide li a:checked {
	color: #2890f1;
	display: block;
}

.clicked {
	color: #2890f1;
}
</style>

</head>
<body>
	<div class="frame-left">
		<div class="aside-menu-wrap">
			<nav class="aside-menu-nav">
				<ul class="menu-list">
					<li class="mypage-name"><b>사업자페이지</b></li>
					<img src="${contextPath}/images/underline.png" alt="밑줄"
						class="underline"/>
					<li class="menu"><a href="${contextPath }/business/mypage/gymCont.do">운동시설관리</a>
						<ul class="hide">
							<li class="current"><a
								href="${contextPath }/business/mypage/goodsAskCont.do" class="minimi">상품문의
									관리</a></li>
						</ul></li>
					<li class="menu"><a
						href="${contextPath }/business/mypage/trainerCont.do"> 트레이너 관리</a></li>
					<li class="menu"><a href="${contextPath }/business/mypage/orderPayCont.do">
							주문결제 관리</a>
						<ul class="hide">
							<li><a class="minimi"
								href="${contextPath }/business/mypage/orderPayList">주문/결제리스트</a></li>
						</ul></li>
					<li class="menu"><a href="${contextPath }/business/mypage/reviewCont.do"> 리뷰 관리</a></li>
					<li class="menu"><a
						href="${contextPath }/business/mypage/busiInfo.do"> 사업자 정보</a></li>
					<li class="menu"><a
						href="${contextPath }/business/mypage/settlementDetail.do"> 정산내역</a></li>
				</ul>
				</nav>
		</div>
		</div>
</body>
</html>