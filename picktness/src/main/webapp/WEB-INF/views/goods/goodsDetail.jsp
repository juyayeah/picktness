<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%
request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">
		window.addEventListener('DOMContentLoaded', function () {
				// goods.detail이 null 또는 빈 문자열인 경우 textarea를 숨깁니다.
				var goodsDetail = "${goods.detail}";
				if (!goodsDetail || goodsDetail.trim() === "") {
					var textareaElement = document.querySelector('textarea[name=""]');
					if (textareaElement) {
						textareaElement.style.display = 'none';
					}
				}
			});
</script>				
<meta charset="UTF-8">
<title>상품 상세페이지</title>
<style>
/* #tr_btn_modify{
display: none;
} */
.detail_goods_img {
	padding: 40px;
}

.bodybody {
	width: 1100px;
	margin:0 auto;
}

.bodybody * {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

li {
	display: inline-block;
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

nav {
	background: #fff;
	padding: 15px;
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
	right: 66%;
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

textarea {
	width: 100%;
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


.minus-plus{
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	width: 65px;
	border: 2px solid #000;
	background-color: rgba(0, 0, 0, 0);
	color: #000;
	font-size:12px; 
	padding: 5px 0px;
}
.minusplus_cart{
border:0;
background-color:#fff;
}
.minusplus_cart:hover{
border:0;
cursor:pointer;
background-color:#fff;
}
.custom-image {
    max-width: 100%;
    height: auto; 
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
</style>

<script type="text/javascript">

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

	function more() {
		document.getElementById("gymdetail_goods").style.display = "block";
		document.getElementById("goods_none").style.display = "block";
		document.getElementById("goods_more").style.display = "none";
		window.scrollTo(200, 300);
	};
	function none() {
		document.getElementById("gymdetail_goods").style.display = "none";
		document.getElementById("goods_none").style.display = "none";
		document.getElementById("goods_more").style.display = "block";
		window.scrollTo(200, 300);
	};

	function nowbuy() {
		var dd = document.getElementById("selectlist");
	};

	function fn_articleForm(isLogOn,articleForm,loginForm){
		if(isLogOn !=''&&isLogOn!='false'){
			location.href=articleForm;
		}else{
			alert("구매할 상품을 하나 이상 선택해주세요.")
			location.href=loginForm+'?action=/board/recordForm.do';
		}
	}


	function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('orderlist');

	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}
	 function popupOpen() {
	        $('.layerpop').css("position", "absolute");
	        //영역 가운에데 레이어를 뛰우기 위해 위치 계산 
	        //$('.layerpop').css("top",(($(window).height() - $('.layerpop').outerHeight()) / 2) + $(window).scrollTop());
	        $('.layerpop').css("top","50px");
	        $('.layerpop').css("left",(($(window).width() - $('.layerpop').outerWidth()) / 2) + $(window).scrollLeft());
	        //$('.layerpop').draggable();
	        $('#layerbox').show();
	    }

	 function popupTOpen() {
	        $('.layerpop').css("position", "absolute");
	        //영역 가운에데 레이어를 뛰우기 위해 위치 계산 
	        //$('.layerpop').css("top",(($(window).height() - $('.layerpop').outerHeight()) / 2) + $(window).scrollTop());
	        $('.layerpop').css("top","250px");
	        $('.layerpop').css("left",(($(window).width() - $('.layerpop').outerWidth()) / 2) + $(window).scrollLeft());
	        //$('.layerpop').draggable();
	        $('#layerTbox').show();
	    }

	    function popupClose() {
	        $('#layerbox').hide();
	        $('#mask').hide();
	    }
	    
	    function popupTClose() {
	        $('#layerTbox').hide();
	        $('#mask').hide();
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
	    
	 var selectBoxChange = function(value){
	 	$("#changeInput").val(value);
	 	
	 	if(value == "1개월"){
	 	$("#changeMoney").val("5만원");
	 	}else if(value == "3개월"){
	 	$("#changeMoney").val("13만원");
	 	}else if(value == "6개월"){
	 	$("#changeMoney").val("20만원");
	 	}else if(value == "12개월"){
	 	$("#changeMoney").val("40만원");
	 	}else{
	 	$("#changeMoney").val("");
	 	}

	 }
	 var selectTBoxChange = function(value){
	 	$("#changeTInput").val(value);
	 	}
	 	
	var selectMBoxChange = function(value){
	 	$("#changeMInput").val(value);
	 	}
	 
	 $(".delBtn").live("click", function(){
	                var clickedRow = $(this).parent().parent();
	                var cls = clickedRow.attr("class");
	                 
	                // 각 항목의 첫번째 row를 삭제한 경우 다음 row에 td 하나를 추가해 준다.
	                if( clickedRow.find("td:eq(0)").attr("rowspan") ){
	                    if( clickedRow.next().hasClass(cls) ){
	                        clickedRow.next().prepend(clickedRow.find("td:eq(0)"));
	                    }
	                }
	 
	                clickedRow.remove();
	 
	                // rowspan 조정
	                resizeRowspan(cls);
	            });
	 
				document.addEventListener("DOMContentLoaded", function () {
        count("plus"); // 페이지 로드 시 + 버튼 클릭한 것과 같은 효과로 초기화
    });

    function count(type) {
    // 결과를 표시할 element
    const resultElement = document.getElementById("result");
    const totalElement = document.getElementById("total"); // 총 결재 금액 요소 추가

    // 현재 화면에 표시된 값
    let number = parseInt(resultElement.innerText); // 현재 값 가져오기

    // 더하기/빼기
    if (type === "plus") {
        number = number + 1;
        if (1 > number) {
            number = 0;
        }
    } else if (type === "minus") {
        number = number - 1;
        if (1 > number) {
            number = 0;
        }
    }

    // ${goods.priceRetail} 가져오기 (상품 가격)
    const goodsPrice = parseFloat("${goods.priceRetail}"); // 문자열을 부동 소수점 숫자로 변환

    // 총 결재 금액 계산
    const total = number * goodsPrice;

    // 콤마 포함한 숫자로 서식화
    const formattedTotal = total.toLocaleString("ko-KR"); // 한국어로 표시

    // 결과 출력
    resultElement.innerText = number;
    totalElement.innerText = formattedTotal;
}





</script>

</head>
<body>
	<div class="bodybody">
		<form action="${contextPath }/member/order/orderDetail.do" method="get" name=""
			enctype="multipart/form-data">
			<div>
				<table border=0 align="center" width="860px">
					<tr>
						<!-- 사진칸 -->
						<td class="detail_goods_img" rowspan="7">
							<input type="hidden" name="originalFileName" value="${goods.fileName}" />
								<img src="${contextPath}/download.do?cate=shop&imageFileName=${goods.fileName}&bno=${goods.goods_id}" width="300px" align="right">
						</td>
						<!-- <img src="${contextPath }/download.do?imageFileName=${member.imageFileName }&num=${member.num}" id="preview" width="300px" height="300px" /><br> <input type="file"
                  name="imageFileName" id="imageFileName"
                  onchange="readURL(this);" disabled /></td> -->
						<!-- disabled 있으면 바꿀 수 없음 -->
						<!-- 상품명 -->
						<td align="left">
							<h2 style="padding: 0 0 0 30px; margin-bottom: 1px;">${goods.goods_title }</h2>

							<span style="padding: 0 0 0 30px; font-size: 23px; color: #2890f1;">
								${Math.round(((goods.priceOrigin - goods.priceRetail) / goods.priceOrigin) * 100)}%
								</span>
							<b style="font-size: 23px;">${goods.priceRetail}원</b>
							<span style="text-decoration: line-through; font-size: 12px; color: #c0c0c0;">${goods.priceOrigin}원</span>
						</td>
					</tr>
					<tr>
						<td align="left">
							<span style="padding: 0 0 0 30px; font-size: 15px;">남은 수량</span>
							<span style="padding: 0 0 0 10px; font-size: 15px;">${goods.goods_qty}개</span><br>
							<span style="padding: 0 0 0 30px; font-size: 15px;">배송방법</span>
							<!--<span style="padding: 0 0 0 10px; font-size: 15px;">${food.deliveryMethod}</span><br>-->
							<span style="padding: 0 0 0 10px; font-size: 15px;">일반배송</span><br>
							<span style="padding: 0 0 0 30px; font-size: 15px;">적립금</span>
							<span style="padding: 0 0 0 10px; font-size: 15px;">${goods.priceRetail}원</span><br>
					</tr>
					<tr>
						<td align="left" style="padding: 0 0 0 30px;"><div class="minus-plus" align="center">
								<button type="button" class="minusplus_cart" onclick='count("minus")'>-</button>
								<span id='result'>0</span>
								<button type="button" class="minusplus_cart" onclick='count("plus")'>+</button>
							</div></td>
					</tr>
					<tr><td align="left">
						<span style="padding: 0 0 0 30px; font-size: 15px;">총 상품금액</span>
						<span id='total' style="font-size: 23px; margin-left: 10px;">0</span>
						<span>원</span>
					</td>
					</tr>
				<tr>
					<td align="left" style="padding: 0 0 10px 30px;">
						<button type="button" class="button_white" value="장바구니">장바구니</button>&nbsp;&nbsp;
						<button class=button_blue id="nowbuy" onclick="nowbuy()">바로구매</button>
					</td>
				</table>
			</div>
			<hr>
			<div>
				<nav>
					<ul>
						<li><a href="#" class="hover-underline" onclick="content()">상품정보</a></li>
						<li><a href="#" class="hover-underline" onclick="review()">이용후기  ${place.review_count }</a></li>
						<li><a href="#" class="hover-underline" onclick="inquiry()">상품문의</a></li>
					</ul>
				</nav>
			</div>
			<!-- 소개 및 정보 시작 -->
			<div class=gymdetail_content style="display: block;"
				id="gymdetail_content">
				<p>상품소개</p>
			<textarea rows="15" cols="60" name="" disabled />${goods.detail}</textarea>
			<br><br>
			<div style="text-align: center;">
				<c:forEach var="image" items="${imageList}">
					<img class="custom-image" src="${contextPath}/download.do?cate=shop&imageFileName=${image.fileName}&bno=${image.goods_id}" >
				</c:forEach>
			</div>
			<br>
				
				<button type="button" class=button_white onclick="more()"
					id="goods_more" style="display: block; width: 500px; margin:auto;">상품설명
					펼쳐보기 V</button>
				<button type="button" class=button_white onclick="none()"
					id="goods_none" style="display: none; width: 500px; margin:auto;">접기
					&Lambda;</button>

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
			<textarea rows="15" cols="60" name="" disabled /></textarea>
		</div>
		</div>
	</form>
</body>
</html>