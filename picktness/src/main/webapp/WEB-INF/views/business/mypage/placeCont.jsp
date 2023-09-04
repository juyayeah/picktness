<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동시설 등록</title>
<script src ="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
var cnt=1;
function fn_addFile(){
	if(cnt < 6) {
		$(".newFile").append("<br>"+"<label>상세이미지</label><input type='file' class='fileBtn'name='detail_image'" + cnt + " onchange='readURL(this,"+cnt+");'/>");
		$('.newFile').append("<div class='upload'><img id='preview" + cnt + "'/></div>");
	} else {
		alert("사진은 최대 6장만 첨부 가능합니다.");
	}
	cnt++;
}

function readURL(input, num){
	if(input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
			var preview = "preview" + num;
			$('#'+preview).attr("src", e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

$(function(){
	$("input").attr("disabled", "true");
	$("textarea").attr("disabled", "true");
	
	$("input:radio[name='cate']:radio[value='${businessPlace.businessDetail.cate}']").prop('checked', true);
	var allTime = "${businessPlace.businessDetail.allTime}";
	if(allTime == 'Y'){
	$("input:checkbox[name='alltime']").prop('checked', true); 
	};
	if(${businessPlace.businessDetail.prod1 != null && businessPlace.businessDetail.prod1 != ''}){
		$("#prod1").attr("value", "${businessPlace.businessDetail.prod1}");
		$("#prod1retail").attr("value", "${businessPlace.businessDetail.prod1retail}");
	};
	if(${businessPlace.businessDetail.prod3 != null && businessPlace.businessDetail.prod3 != ''}){
		$("#prod3").attr("value", "${businessPlace.businessDetail.prod3}");
		$("#prod3retail").attr("value", "${businessPlace.businessDetail.prod3retail}");
	}
	if(${businessPlace.businessDetail.prod6 != null && businessPlace.businessDetail.prod6 != ''}){
		$("#prod6").attr("value", "${businessPlace.businessDetail.prod6}");
		$("#prod6retail").attr("value", "${businessPlace.businessDetail.prod6retail}");
	}
	if(${businessPlace.businessDetail.prod12 != null && businessPlace.businessDetail.prod12 != ''}){
		$("#prod12").attr("value", "${businessPlace.businessDetail.prod12}");
		$("#prod12retail").attr("value", "${businessPlace.businessDetail.prod12retail}");
	}
	
	
	  $(".button_blue").click(function(){
			if ($("#prod1").val() == 0 || $("#prod1").val() == null){
				alert("가격을 반드시 입력해 주세요!");
				$("#prod1").focus();
			} else{
				var prod1sale = $("#prod1").val() - $("#prod1retail").val();
				$("#prod1sale").attr("value", prod1sale);
				if($("#prod3").val() != 0 && $("#prod3").val() != null){
					var prod3sale = $("#prod3").val() - $("#prod3retail").val();
					$("#prod3sale").attr("value", prod3sale);
				}
				if($("#prod6").val() != 0 && $("#prod6").val() != null){
					var prod6sale = $("#prod6").val() - $("#prod6retail").val();
					$("#prod6sale").attr("value", prod6sale);
				}
				if($("#prod12").val() != 0 && $("#prod12").val() != null){
					var prod12sale = $("#prod12").val() - $("#prod12retail").val();
					$("#prod12sale").attr("value", prod6sale);
				}
				

			}
			$("#addForm").submit();
	  });
});
</script>

<style>
.starblue {
	color: #2890f1;
}


table {
	border-spacing: 0 20px;
}

.tdfirst {
	width: 20%;
	text-align: right;
}

.tdfirsttop {
	width: 20%;
	text-align: right;
	display: table-cell;
	vertical-align: top;
	padding-top: 5px;
}

.starbluetop {
	color: #2890f1;
	display: table-cell;
	vertical-align: top;
	padding-top: 5px;
}

.td:secondchild {
	width: 10%;
	align: left;
}

.tdlast {
	align: left;
}

label {
	display: inline-block;
}

textarea {
	width: 95%;
	border: 2px solid #c0c0c0;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	padding: 10px;
	resize: none;
}

.inputtext {
	width: 95%;
	border: 2px solid #c0c0c0;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	padding: 10px;
	resize: none;
}

.inputtextnum {
	width: 95%;
	border: 2px solid #c0c0c0;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	padding: 10px;
}
.buttonClick{
	background-color:#2890f1;
	border: 1px solid #2890f1;
	border-top-left-radius: 3px;
	border-bottom-left-radius: 3px;
	border-top-right-radius: 3px;
	border-bottom-right-radius: 3px;
	width: 50px;
	height: 30px;
	align-items: center;
	justify-content: center;
	font-size: 11px;
}

/* 버튼 클릭 */
.div2 {
	background-color:#c0c0c0;
	border: 1px solid #c0c0c0;
	border-top-left-radius: 3px;
	border-bottom-left-radius: 3px;
	border-top-right-radius: 3px;
	border-bottom-right-radius: 3px;
	width: 50px;
	height: 30px;
	align-items: center;
	justify-content: center;
	font-size: 11px;
}

.div2:hover, .buttonClick:hover {
	cursor: pointer;
	border-color: #fff;
}

.clicked {
	background-color: #2890f1;
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
	padding: 10px 50px;
}

.button_white:hover {
	cursor: pointer;
	border-color: #2890f1;
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
	padding: 10px 50px;
	display:none;
}

.button_blue:hover {
	cursor: pointer;
	border-color: #fff;
}

/* 사진추가창 */
.imgadd {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	border: 4px dashed #d0d0d0;
	background-color: #f0f0f0;
	color: #000;
	font-size: 12px;
	padding: auto;
	margin-right:10px;
	width: 100px;
	height: 100px;
	text-align: center;
	line-height: 100px;
	position:relative; 
	display:inline-block;
}

.imgadd:hover {
	cursor: pointer;
	border-color: #fff;
}
/* 가격창 */
.pricebox {
	border: 2px solid #c0c0c0;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	padding: 10px;
}
.pricebox {
	border: 2px solid #c0c0c0;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	padding: 10px;
}

/* 원버튼 */
.circlebtn {
	border: 2px solid #c0c0c0;
	height: 25px;
	width: 25px;
	border-radius: 50%;
	cursor: pointer;
}

      form input::file-selector-button {
        display: none;
      }
      .addButton{
      width:100px;
      height:40px;
      background-color:#c0c0c0;
      border:none;
      }
      .fileBtn{
      margin-left:30px;
      }
      .imgbox img {
	width: 90px;
	height: 90px;
}
      
</style>


</head>
<body>
<form action="${contextPath }/business/mypage/modPlaceDetail.do" method="post" name ="frmBusiness" id="addForm" enctype="multipart/form-data">
	<input type="hidden" name="id" value="${business.id }">
	<div>
		<h2 align="center">내 운동시설</h2>
		<table>
			<tr>
				<td colspan="3" align="right"><span class="starblue" style="font-size: small;">*필수항목</span>
			</tr>
			<tr>
				<td class="tdfirst">카테고리</td>
				<td class="starblue">*&nbsp;&nbsp;</td>
				<td><label>&nbsp;
				<input type="radio" name="cate" value="헬스">헬스&nbsp;&nbsp;&nbsp;
				<input type="radio" name="cate" value="크로스핏">크로스핏&nbsp;&nbsp;&nbsp;
				<input type="radio" name="cate" value="요가">요가&nbsp;&nbsp;&nbsp;
				<input type="radio" name="cate" value="필라테스">필라테스&nbsp;&nbsp;&nbsp;
				<input type="radio" name="cate" value="복싱">복싱&nbsp;&nbsp;&nbsp;
				<input type="radio" name="cate" value="주짓수">주짓수&nbsp;&nbsp;
				</label><label><input type="checkbox" name="alltime"
						value="Y">24시</label>
				</td>
			</tr>
			<tr>
				<td class="tdfirsttop">시설소개</td>
				<td class="starbluetop">*&nbsp;&nbsp;</td>
				<td class="tdlast"><textarea rows="4" cols="60" name="detail">${businessPlace.businessDetail.detail }</textarea></td>
			</tr>
			<tr>
				<td class="tdfirsttop">공지사항</td>
				<td class="starbluetop">&nbsp;&nbsp;</td>
				<td class="tdlast"><textarea rows="4" cols="60" name="notice">${businessPlace.businessDetail.notice }</textarea></td>
			</tr>
			<tr>
				<td class="tdfirsttop">운영시간</td>
				<td class="starbluetop">*&nbsp;&nbsp;</td>
				<td class="tdlast"><textarea rows="4" cols="60" name="b_time">${businessPlace.businessDetail.b_time }</textarea></td>
			</tr>
			<tr>
				<td class="tdfirsttop">운영프로그램</td>
				<td class="starbluetop">*&nbsp;&nbsp;</td>
				<td class="tdlast"><textarea rows="4" cols="60" name="program">${businessPlace.businessDetail.program }</textarea></td>
			</tr>

			<tr>
				<td class="tdfirsttop">부가서비스</td>
				<td></td>
				<td class="tdlast"><textarea rows="4" cols="60" name="service">${businessPlace.businessDetail.service }</textarea></td>
			</tr>
			<tr>
				<td class="tdfirsttop">가격</td>
				<td class="starbluetop">*&nbsp;&nbsp;</td>
				<td class="blue">
				<table>
				<tr>
				<td width="100px">1개월<span class="starblue">*</span></td>
				<td width="260px">정가 <input class="pricebox" id = "prod1" type="number" name="prod1" placeholder="숫자만 작성해 주세요" min="0"> </td>
				<td width="260px">판매가 <input class="pricebox" id = "prod1retail" type="number" name="prod1retail" placeholder="숫자만 작성해 주세요"  min="0">
				<input type="hidden" id="prod1sale" name="prod1sale">
				</td>
				</tr>
				<tr>
				<td>3개월</td>
				<td>정가 <input class="pricebox" id = "prod3" type="number" name="prod3" placeholder="숫자만 작성해 주세요" min="0"> </td>
				<td>판매가 <input class="pricebox" id = "prod3retail" type="number" name="prod3retail" placeholder="숫자만 작성해 주세요"  min="0">
				<input type="hidden" id="prod3sale" name="prod3sale">
				</td>
				</tr>
				<tr>
				<td>6개월</td>
				<td>정가 <input class="pricebox" id = "prod6" type="number" name="prod6" placeholder="숫자만 작성해 주세요" min="0"> </td>
				<td>판매가 <input class="pricebox" id = "prod6retail" type="number" name="prod6retail" placeholder="숫자만 작성해 주세요"  min="0">
				<input type="hidden" id="prod6sale" name="prod6sale">
				</td>
				</tr>
				<tr>
				<td>12개월</td>
				<td>정가 <input class="pricebox" id="prod12" type="number" name="prod12" placeholder="숫자만 작성해 주세요" min="0"> </td>
				<td>판매가 <input class="pricebox" id = "prod12retail" type="number" name="prod12retail" placeholder="숫자만 작성해 주세요"  min="0">
				<input type="hidden" id="prod12sale" name="prod12sale">
				</td>
				</tr>
				</table>
					<br><span class="starblue" style="font-size: 11px;">* 픽트니스을 통한
						주문일 경우 매출연동수수료 2%가 결제수수료와 별도로 과금됩니다. <br>
						* 판매가, 할인가를 활용한 비정상 거래는 자동 탐지되어 판매지수에 포함되지 않으니 유의해주세요. </a>
				</span></td>
				<!-- <td class="blue">판매가 <input
					class="pricebox" type="number" placeholder="숫자만 작성해 주세요" name="prod10retail">
					<button class="circlebtn" value="-">-</button></td> -->
			</tr>
			<tr>
				<td class="tdfirsttop">시설이미지</td>
				<td class="starbluetop">*&nbsp;&nbsp;</td>
				<td class="tdlast">
					<div class="imgbox">
					<input type="button" class="addButton" value="파일 추가" onClick="fn_addFile()"/>
					<div class="newFile">
					<label>메인이미지</label><input class="fileBtn" type='file' name='main_image' onchange='readURL(this,0)'>
					<div class='upload'><img id='preview0'/></div>
					</div>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="right">
				<button type="button" class="button_white">수정하기</button>&nbsp;&nbsp;
				<button class="button_blue" type="button">수정 반영하기</button>
			</tr>
		</table>
	</div>
	</form>
</body>
</html>