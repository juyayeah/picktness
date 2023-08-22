<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib prefix="tiles"
uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>


<head>
<script type="text/javascript">
$(document).ready(function () {
	 
	   // 1. 특정 위치에서 부터 버튼 나타고, 사라지게..효과는 fade로
	    $(window).scroll(function () {
			if ($(this).scrollTop() > 500) {
				$('.go-top').fadeIn(200);
			} else {
				$('.go-top').fadeOut(200);
			}
		});

		// 2. 버튼 클릭하면 원하는 위치로 이동
		$('.go-top').click(function (event) {
			event.preventDefault();
			$('html, body').animate({ scrollTop: 0 }, 300);
		});

	});</script>
<style>

a:link { text-decoration:none; color: black;}
a:visited { text-decoration:none; color: black;}
a:active { text-decoration:none; color:black;}
a:hover {color: black; text-decoration:none;}
li{
list-style: none;
}
ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
	padding-inline-start: 0px;
}
.side-quick-area {
	position: absolute;
	top: 0;
	right: 20%;
	z-index: 11;
	width:20%;
	transform: translateX(50%);
	-webkit-transform: translateX(50%);
	margin-top:330px;
}
 .side-quick-area .side-quick {
	position: absolute;
	top: 10px;
	right: 0;
	width: 90px;
} 
/*     .sticky_box{
            position:sticky;
            top:0px;
            right:20%;
            z-index:1;
        } */

/*  .side-quick-area.fixed {
	position: fixed;
} 

.side-quick-area.fixed>.side-quick {
	top: 78px;
}

.side-quick-area.fixed.type2>.side-quick {
	top: 120px;
}

.side-quick-area.fixed.static {
	position: relative;
	top: 0;
	bottom: -30px;
	margin: 0 auto;
	transform: none;
	-webkit-transform: none;
	right: 0;
	transition: none;
	-webkit-transition: none
} */

.side-quick .recent-list {
	margin-bottom: 10px;
	padding: 12px 10px;
	background: #fff;
	border-radius: 6px;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.15);
}

.recent-list .recent-info {
	padding: 0 13px;
}

.recent-list .recent-info .txt {
	margin-top: 10px;
	padding-bottom: 3px;
	font-size: 13px;
	border-bottom: 1px solid #666;
	overflow: hidden;
}

.recent-list .recent-info .num {
	float: right;
	color: #fd5f01
}

.recent-list .recent-info .num .ico-arr-right {
	width: 10px;
	height: 10px;
	margin-left: 2px;
}

.recent-list .btn-move-group {
	display: flex;
	padding: 14px 0 12px;
	justify-content: space-between;
	align-items: center;
}

.recent-list .btn-move-group:last-child {
	padding-bottom: 0;
}

.recent-list .btn-move-group [class^="btn-"] {
	display: flex;
	width: 12px;
	text-align: center;
	border: 0;
	align-items: center;
	height: 12px;
	justify-content: center;
	background-color: transparent;
}

.recent-list .btn-move-group [class^="btn-"] [class*="ico-arr-"] {
	color: #999;
}

.recent-list .btn-move-group [class^="btn-"] [class*="ico-arr-"]::before,
	.recent-list .btn-move-group [class^="btn-"] [class*="ico-arr-"]::after
	{
	box-shadow: 0;
	background: transparent;
	color: #999;
}
.recent-list .btn-move-group [class^="btn-"].disabled {
	pointer-events: none;
}

.recent-list .btn-move-group [class^="btn-"].disabled [class*="ico-arr-"]
	{
	opacity: 1;
	color: #999;
}

.recent-list .btn-move-group [class^="btn-"]:last-child {
	order: 3;
}

.recent-list .btn-move-group .btn-move-cnt {
	order: 1;
	width: auto;
	font-size: 11px;
	line-height: 1.2;
	color: #999;
	height: auto;
}

.recent-list .btn-bnr-sm {
	display: block;
	width: 100%;
	text-align: center;
	font-size: 12px;
}

.recent-info .num .ico-arr-right:after, .recent-info .num .ico-arr-right:before
	{
	box-shadow: none
}

.side-quick .aside-scroll-control {
	margin-top: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 9px;
	background-color: #f8f8f8;
	gap: 2px;
	border-radius: 6px;
	font-size: 12px;
}
/* 배너 위치 */
.wrap.main .side-quick-area .side-quick {
	top: 643px
}
.wrap.main .side-quick-area.fixed>.side-quick {
	top: 78px;
}
.content-wrap.benefit-content ~ .side-quick-area .side-quick {
	top: 630px
}

.content-wrap.benefit-content ~ .side-quick-area.fixed>.side-quick {
	top: 78px;
}

.recent-prd-item {
	position: relative;
	padding: 0;
}

.recent-prd-item ul li {
	width: 70px;
	height: 70px;
}

.recent-prd-item ul li.on {
	display: block;
}

.recent-prd-item ul li:nth-child(3n)+li {
	margin-top: 0;
}

.recent-prd-item ul li:nth-child(3n) ~ li {
	display: none;
}

.recent-prd-item ul li+li {
	margin-top: 10px;
}

.recent-prd-item ul li>a {
	display: block;
	width: 100%;
	height: 100%;
	position: relative;
}

.recent-prd-item ul li .img {
	display: block;
	position: relative;
	width: 70px;
	height: 70px;
	overflow: hidden;
	z-index: 2;
	border-radius: 4px;
}

.recent-prd-item ul li .detail {
	display: none;
	position: absolute;
	top: -5px;
	right: -10px;
	z-index: 3;
	width: 150px;
	height: calc(65% + 5px * 2); 
	border: 1px solid #e6e6e6;
	font-size: 12px;
	padding: 12px 85px 12px 15px;
	border-radius: 10px;
	overflow: hidden;
}

.recent-prd-item ul li .detail:before {
	display: block;
	width: calc(100% - 84px);
	height: 100%;
	background: #fff;
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	z-index: -1;
}

.recent-prd-item ul li>a:hover .detail {
	display: block;
}

.recent-prd-item ul li .detail .tit {
	display: block;
	font-size: 12px;
	line-height: 1.2;
	margin-bottom: 12px;
	color: #333;
}

.recent-prd-item ul li .detail .recent-price-info {
	font-size: 10px;
	line-height: 1.2;
	font-weight: 700;
}

.recent-prd-item ul li .detail .recent-price-info i {
	font-weight: 400;
	font-style: normal
}

.recent-prd-item .btn-move-group {
	position: absolute;
	bottom: 10px;
	left: 25px;
}

.recent-prd-item .btn-move-group .disabled {
	pointer-events: none
}

.no-recent {
	text-align: center;
	font-size: 10px;
	margin-top: 12px;
}

.no-recent .no-recent-txt {
	font-size: 10px;
	line-height: 17px;
	color: #aaa;
	padding-top: 24px;
	background-image: url('/resources/pc/images/icon/ico-norecent.png');
	background-repeat: no-repeat;
	background-position: center 0;
}

.recent-list .sidebnr-link {
	display: block;
	width: 100%;
	font-size: 10px;
	text-align: center;
	color: #666;
	padding: 5px 0;
	border-top: 1px solid #ddd;
}

.recent-list .recent-heading .recent-title {
	font-size: 12px;
	line-height: 14px;
	font-weight: 500;
	text-align: center;
	margin: 0 -2px;
	white-space: nowrap;
	margin-bottom: 12px;
}

.recent-list .recent-heading:last-child .recent-title {
	margin-bottom: 0;
}
.side-quick .side-btns {
	margin-top: 10px;
	overflow: hidden;
	white-space: nowrap;
	font-size: 0;
}

.side-btns {
	width: 50px;
	margin: 0 auto;
	border-radius: 25px;
	overflow: hidden;
	border: 1px solid #e6e6e6;
}
/* btn */
.btn-side-func {
	border: 1px solid #ddd;
	min-width: 32px;
	height: 32px;
	background-color: #F8F8F8;
}

.side-btns .btn-side-func {
	width: 100%;
	display: block;
	height: 25px;
	width: 100%;
	background-image: none;
	border: 0;
	position: relative;
	overflow: hidden;
}

.side-btns .btn-side-func+.btn-side-func {
	border-top: 1px solid #e6e6e6;
}

.side-btns .btn-side-func::before {
	content: '';
	display: block;
	position: absolute;
	width: 32px;
	height: 32px;
	top: 50%;
	left: 50%;
	background-image: url('/resources/pc/images/icon/ico_sidebtn.png');
	background-repeat: no-repeat;
	background-size: auto 32px;
	transform: translate(-50%, -50%);
}

.side-btns .btn-side-func.up::before {
	background-position: -39px 0;
}

.side-btns .btn-side-func.down::before {
	background-position: -79px 0;
}

</style>
</head>

<body>
<div class="side-quick-area">
    <div class="side-quick">
        <div class="recent-list">
            <a href="#" class="recent-heading">
                <h5 class="recent-title">최근 본 상품</h5>
            </a>
            <!-- 상품 목록 영역 -->
                    <div class="recent">
			<ul>
				<!--   상품이 없습니다. -->
				<%-- <c:choose>
					<c:when test="${ empty quickGoodsList }">
						<strong>상품이 없습니다.</strong>
					</c:when>
					<c:otherwise>
						<form name="frm_quick">
							<c:forEach var="item" items="${quickGoodsList }"
								varStatus="itemNum">
								<c:choose>
									<c:when test="${itemNum.count==1 }">
										<a href="javascript:goodsDetail();"> <img width="75"
											height="75" id="img_sticky"
											src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
										</a>
										<input type="hidden" name="h_goods_id"
											value="${item.goods_id}" />
										<input type="hidden" name="h_goods_fileName"
											value="${item.goods_fileName}" />
										<br>
									</c:when>
									<c:otherwise>
										<input type="hidden" name="h_goods_id"
											value="${item.goods_id}" />
										<input type="hidden" name="h_goods_fileName"
											value="${item.goods_fileName}" />
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</c:otherwise>
				</c:choose>
			</ul>
			</form>
		</div>
                    
                     --%>
                    <div class="recent-prd-item">
                        <ul class="recent-prod-list">
                            <li>
                                    <a href="${contextPath }/goods/trainerDetail.do">
                                        <span class="img"><img src="${contextPath }/images/member/tr1.png" width="70px" height="70px" alt="최근 본 상품"></span>
                                        <div class="detail">
                                            <span class="tit text-elps2">[PT]박지성(10회)</span>
                                            <span class="recent-price-info">120,500원</span>
                                        </div>
                                    </a>
                                </li>
                         </ul>
                    </div>
                    <!--// 상품 목록 영역 -->
                    <div class="btn-move-group">
                        <div class="btn-move-cnt">
                            <span class="move-current">1</span>/<span class="move-total">2</span>
                        </div>
                        <a href="javascript:;" class="btn-left-xs disabled" onclick="moveList('prev', 'recent-prod-list', 3, 3);return false;"><i class="ico-arr-left"></i><span class="blind"><</span></a>
                        <a href="javascript:;" class="btn-right-xs" onclick="moveList('next', 'recent-prod-list', 3, 3);return false;"><i class="ico-arr-right"></i><span class="blind">></span></a>
                    </div>
                </div>
                <div>
        <a href="#" onclick="goTop()" class="go-top">
            <span class="aside-scroll-control">TOP &Lambda;</span> <img src="/resources/pc/images/icon/ico-go-up.png" alt="">
        </a>
</div><!--// side-quick -->
        </div>
        </div>
        </div>
        
</body>
</html>

