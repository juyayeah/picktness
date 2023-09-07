<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <style>
	.cart_content{
	  position: relative;
      max-width: 1100px;
      min-height: 400px;
      margin: 50px auto 100px auto;
	}
	.cart_title{
	width:100%;
	font-size:18px;
	font-weight:bold;
	text-align:center;
	margin:20px 0px;
	}
	.empty_cart{
	text-align:center;
	}
	table, th, tr, td{
	border-spacing:0px;
	padding:0px;
	}
	.table_basic tr{
	border:1px solid #ddd;
	}
	.table_basic tr.cart-group{
	border-bottom:0px;
	height:110px;
	}
	.table_basic tr .table_basic tr:first-child {
	border-top:0px;
	}
	.table_basic tr .table_basic tr{
	border-left:0px;
	border-right:0px;
	}
	.table_basic th{
	padding:10px 0;
	font-size:13px;
	font-weight:normal;
	}
	.cart_table{
	border-collapse:collapse;
	position: relative;
	width:100%;
	margin-bottom:20px;
	}
	.cart_table th{
	width:auto;
	}
	.cart_inner {
	border-collapse:collapse;
	position: relative;
	width:100%;
	}
	.cart_inner tr{
	width:auto;
	}
	.cart_inner img{
	width:62px;
	}
	.content_img{
	float:left;
	}
	.content_info{
	padding-left:75px;
	}
	.list_title{
	margin:0px;
	}
	.list_option{
	margin:0px;
	}
	.td_center{
	text-align:center;
	}
	.goods_button{
	border:1px solid #ddd;
	padding:15px;
	font-size:13px;
	}
	.original_price{
	text-decoration: line-through;
	}
	.click_disabled{
	color:#ddd;
	cursor:default;
	point-event:none;
	}
	.empty_cart{
	margin:50px 0px;
	}
	.change_option{
        z-index: 100;
        background-color: white;
        position: absolute;
        top: 50%;
        left: 50%;
        text-align: center;
        width:300px;
        height:160px;
        margin-left: -150px;
        margin-top: -90px;
        display:none;
	}
	.change_option_title{
	margin:10px;
	}
	.change_option select{
	outline:none;
	}
	.change_button_parent{
	margin-top:40px;
	}
	.change_button{
	border:1px solid #ddd;
	margin:5px;
	padding:15px;
	font-size:13px;
	}
	.order_price{
	text-align:center;
	}
	.order_price p {
	display:inline-block;
	}
	.order_now{
	text-align:center;
	margin-top:30px;
	}
	.main_button{
	background-color:white;
	padding:16px;
	font-size:14px;
	font-weight:bold;
	border:1px solid #ddd;
	margin:10px;
	}
	.order_button{
	background-color:#2890f1;
	padding:16px 30px;
	font-size:14px;
	color:white;
	font-weight:bold;
	border:1px solid #2890f1;
	}
    </style>
    <meta charset="UTF-8" />
    <title>장바구니</title>
  </head>
  <script type="text/javascript">
  $(function(){

  		function calc(){
  			var original_price = 0;
  	  		var sale_price = 0;
  	  		var retail_price = 0;
  			$("input[name='chk']:checked").each(function(index) { 
  		  		var now_origin = $(this).parent().nextAll('#price_values').children('#original_price').val();
  		  		var now_sale = $(this).parent().nextAll('#price_values').children('#sale_price').val();
  		  		var now_retail = $(this).parent().nextAll('#price_values').children('#retail_price').val()
  			  	original_price = original_price + parseInt(now_origin);
  			  	sale_price = sale_price + parseInt(now_sale);
  			  	retail_price = retail_price + parseInt(now_retail);
  			  	
  			});
  			$("#order_origin").attr("value", original_price);
  			$("#order_sale").attr("value", sale_price);
  			$("#order_total").attr("value", retail_price);
  			$("#order_original_price").text(original_price.toLocaleString());
  			$("#order_sale_price").text(sale_price.toLocaleString());
  			$("#order_total_price").text(retail_price.toLocaleString());
  		}
  		function calc_remove(){
  			$("#order_original_price").text('0원');
  			$("#order_sale_price").text('0원');
  			$("#order_total_price").text('0원');
  		}
	  
	  if(${cartMap.myCartList == null}){
		  $(".checkAll").attr("disabled", true);
		  $("#select_button").addClass("click_disabled");
	  } else{
		  $(".checkAll").attr("checked", true);
		  $(".checked_cart").attr("checked", true);
		  $("#select_button").removeClass("click_disabled");
		  calc();
	  }
	  
		$(".checkAll").click(function() {
			if($(".checkAll").is(":checked")){
				$("input[name=chk]").prop("checked", true);
				$("#select_button").removeClass("click_disabled");
				calc();
				
			}
			else {
				$("input[name=chk]").prop("checked", false);
				$("#select_button").addClass("click_disabled");
				calc_remove();
			}
		});

		$("input[name=chk]").click(function() {
			var total = $("input[name=chk]").length;
			var checked = $("input[name=chk]:checked").length;
			if(total != checked) $(".checkAll").prop("checked", false);
			else $(".checkAll").prop("checked", true); 
			
			if(checked == 0){
				$("#select_button").addClass("click_disabled");
			} else{
				$("#select_button").removeClass("click_disabled");
			}
			calc();
		});
		
  })
  function delete_cart_goods(cart_id){
	    if (confirm("상품을 삭제하시겠습니까?")) {
	    	alert("장바구니에서 삭제되었습니다.");
		  	$.ajax({
		  		url : "${contextPath}/member/cart/removeCartGoods.do",
		  		type:"post",
			  	data : {cart_id : cart_id},
			  	traditional: true,
			  	success : function(data){
			  		location.href=data;
			  	}, errer:function(request, status, error){
			  		
			  	}
		  	});
	    } 
  }
  
  function delete_cart_select(){
	  	if(confirm("상품을 삭제하시겠습니까?")){
	  		alert("장바구니에서 삭제되었습니다.");
		  		var id_list = new Array();
			$("input[name='chk']:checked").each(function(index) { 
			  	var cart_id = $(this).nextAll(".cart_id").val();
			  	id_list.push(cart_id);
			});
		  	$.ajax({
		  		url : "${contextPath}/member/cart/removeCartGoodsSelect.do",
		  		type:"post",
			  	data : {id_list : id_list},
			  	traditional: true,
			  	success : function(data){
			  		location.href=data;
			  	}, errer:function(request, status, error){
			  		
			  	}
		  	});
	  	}		  
  }
  
  function change_option_show(cart_id){
	  $(".not_modal").css("visibility", "visible");
      $("#option"+cart_id).css("display", "block");
  }
  function change_option_hidden(cart_id){
	  $(".not_modal").css("visibility", "hidden");
      $("#option"+cart_id).css("display", "none");
  }
  function change_option(cart_id){
	  var option = $("#selectBox").val();
	  alert("옵션을 변경했습니다.");
	  $.ajax({
	  		url : "${contextPath}/member/cart/updateCartGoods.do",
	  		type:"post",
		  	data : {option : option,
		  		cart_id : cart_id},
		  	traditional: true,
		  	success : function(data){
		  		location.href=data;
		  	}, errer:function(request, status, error){
		  		
		  	}
	  	});
  }
  
  function order_cart(){
	  var checked = $("input[name=chk]:checked").length;
	  if(checked == 0){
		  alert("상품을 선택해 주세요.");
	  } else {
		  	var idList = new Array();
		  	var order_original = $("#order_origin").val();
			var order_sale = $("#order_sale").val();
			var order_total = $("#order_total").val();
			$("input[name='chk']:checked").each(function(index) { 
		  		
			var cart_id = $(this).nextAll(".cart_id").val();
			idList.push(cart_id);
			});
		  	$.ajax({
		  		url : "${contextPath}/member/order/order_cart.do",
		  		type:"post",
			  	data : {idList : idList,
			  		original_price : order_original,
			  		sale_price : order_sale,
			  		total_price : order_total},
			  	traditional: true,
			  	success : function(data){
			  		location.href=data;
			  	}, errer:function(request, status, error){
			  		
			  	}
		  	});
	  }
  }
  </script>
  <body>
  <div class="cart_content">
 <div class="cart_title">
 장바구니
 </div>
 <div class="section_content">
  <table class="cart_table table_basic">
  <colgroup>
<col width="5%" />
<col width="4%"/>
<col width="20%"/>
<col width="8%"/>
<col width="9%"/>
</colgroup>
 <thead>
 <tr>
 <c:choose>
 <c:when test="${cartMap.myCartList != null}">
 <th>전체 ${cartMap.myCartList.size() }개</th>
 </c:when>
 <c:otherwise>
 <th>전체 0개</th>
 </c:otherwise>
 </c:choose>
 <th><input type="checkbox" class="checkAll"></th>
 <th>상품명(옵션)</th>
 <th>판매가</th>
 <th>주문관리</th>
 </tr>
 </thead>
 <c:choose>
 <c:when test="${empty cartMap }">
 <tr>
 <td colspan="5">
<div class="empty_cart">
장바구니에 담긴 상품이 없습니다.
</div>
</tr> 
</c:when>
<c:otherwise>
<tr>
<td colspan="5">
<table class="cart_inner table_basic">
  <colgroup>
<col width="5%" />
<col width="4%"/>
<col width="20%"/>
<col width="8%"/>
<col width="9%"/>
</colgroup>
<c:forEach var="cart" items="${cartMap.myCartList }" varStatus="num">
 <c:set var="option" value="${cart.goods_option }"/>
 <c:set var="goods_id" value="${cart.goods_id }"/>
 <c:forEach var="place" items="${cartMap.businessList }">
 <c:if test="${place.goods_id eq goods_id}">
 <tr class="cart-group" id="${goods_id }">
 <td class="td_center">${num.count }</td>
 <td class="td_center">
 <input type="checkbox" class="checked_cart" name="chk">
 <input type="hidden" class="cart_id" name="cart_id" value="${cart.cart_id }">
 </td>
 <c:choose>
 <c:when test="${option eq 'prod1retail'}">
 <c:set var="option_pc" value="1개월"/>
 <c:set var="original" value="prod1"/>
 </c:when>
 <c:when test="${option eq 'prod3retail'}">
 <c:set var="option_pc" value="3개월"/>
  <c:set var="original" value="prod3"/>
 </c:when>
 <c:when test="${option eq 'prod6retail' }">
 <c:set var="option_pc" value="6개월"/>
 <c:set var="original" value="prod6"/>
 </c:when>
 <c:otherwise>
 <c:set var="option_pc" value="12개월"/>
 <c:set var="original" value="prod12"/>
 </c:otherwise>
 </c:choose>
  <td>
 <div class="content_img">
 <img src="${contextPath}/download.do?cate=place&imageFileName=${place.fileName}&bno=${place.goods_id}" alt="운동시설 메인이미지">
 </div>
 <div class="content_info">
 <p class="list_title">${place.b_name }</p>
 <p class="list_option">${option_pc }</p>
 </div>
 </td>
 <c:set var="price" value="${place[option]}"/>
 <c:set var="original_Price" value="${place[original] }"/>
 <td class="td_center" id="price_values">
 <c:choose>
 <c:when test="${price ne original_Price }">
  <input type="hidden" id="original_price" value="${original_Price }"/>
 <input type="hidden" id="sale_price" value="${original_Price - price }"/>
 <input type="hidden" id="retail_price" value="${price }"/>
 <div class="original_price">
 <fmt:formatNumber type="number" maxFractionDigits="3" value="${original_Price}" />원
 </div>
<div class="sale_price">
<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원
</div>
 </c:when>
 <c:otherwise>
 <input type="hidden" id="original_price" value="${price }"/>
 <input type="hidden" id="sale_price" value="0"/>
 <input type="hidden" id="retail_price" value="${price }"/>
 <fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원
 </c:otherwise>
 </c:choose>
 </td>
 <td class="td_center">
 <a href="javascript:change_option_show('${cart.cart_id }')" class="goods_button">옵션/수량</a>
 <a href="javascript:delete_cart_goods('${cart.cart_id}')" class="goods_button">삭제하기</a>
 </td>
 </tr>
 <div class="change_option" id="option${cart.cart_id }">
 <div class="change_option_title">
 변경할 옵션을 선택해 주세요.
 </div>
 <div>
<select id="selectBox">
<option value="prod1retail">1개월 이용권 </option>
<c:if test="${place.prod3retail ne '' && place.prod3retail ne null}"> 
<option value="prod3retail">3개월 이용권 </option>
</c:if>
<c:if test="${place.prod6retail ne '' && place.prod6retail ne null }">
<option value="prod6retail">6개월 이용권 </option>
</c:if>
<c:if test="${place.prod12retail ne '' && place.prod12retail ne null}">
<option value="prod12retail">12개월 이용권 </option>
</c:if>
</select>
 </div>
 <div class="change_button_parent">
<a href="javascript:change_option_hidden('${cart.cart_id}')" class="change_button">취소</a>
<a href="javascript:change_option('${cart.cart_id }')" class="change_button">변경</a>
 </div>
</div>
 </c:if>
<c:set  var="originalPrice" value="${originalPrice+original_Price}"/>
<c:set  var="totalGoodsPrice" value="${totalGoodsPrice+price }" />
<c:set  var="totalDiscountedPrice" value="${totalDiscountedPrice + (originalPrice-totalGoodsPrice)}" />
 </c:forEach>
 </c:forEach>
</table>
</td>
</tr>
 </c:otherwise>
</c:choose>
 </table>
 </div>
 <c:if test="${!empty cartMap }">
 <a href="javascript:delete_cart_select()" class="goods_button" id="select_button">선택 삭제</a>
 <div class="order_price">
<p>상품 금액 <span  id="order_original_price"></span>원</p>
<p> - </p>
<p>할인 금액 <span  id="order_sale_price"> </span>원</p>
<p> = </p>
<p>최종 결제 금액 <span  id="order_total_price"> </span>원</p>
<input type="hidden" id="order_origin">
<input type="hidden" id="order_sale">
<input type="hidden" id="order_total">
 </div>
 <div class="order_now">
 <a href="${contextPath }/main.do" class="main_button">쇼핑계속하기</a>
 <a href="javascript:order_cart()" class="order_button">주문하기</a>
 </div>
 </c:if>
 </div>
 </body>
</html>
