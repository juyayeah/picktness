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
<meta charset="UTF-8" />
<title>트레이너 등록</title>
<script>
	function backToList(obj) {
		obj.action = "${contextPath}/admin/mypage/adminTrainerList.do";
		obj.submit();
	}

	var div2 = document.getElementsByClassName("div2");

	function handleClick(event) {
		console.log(event.target);
		// console.log(this);
		// 콘솔창을 보면 둘다 동일한 값이 나온다

		console.log(event.target.classList);

		if (event.target.classList[1] === "clicked") {
			event.target.classList.remove("clicked");
		} else {
			for (var i = 0; i < div2.length; i++) {
				div2[i].classList.remove("clicked");
			}

			event.target.classList.add("clicked");
		}
	}

	function init() {
		for (var i = 0; i < div2.length; i++) {
			div2[i].addEventListener("click", handleClick);
		}
	}

	init();

	/* 이미지 불러오기 */

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}

	}

	var cnt = 1;
	function fn_addFile() {
		$("#d_file").append("<br>" + "<input type='file' name='file"+cnt+"'/>");
		cnt++;
	}
</script>

<style>
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

.starblue {
	color: #2890f1;
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

/* 버튼 클릭 */
.div2 {
	border: 1px solid #c0c0c0;
	border-top-left-radius: 3px;
	border-bottom-left-radius: 3px;
	border-top-right-radius: 3px;
	border-bottom-right-radius: 3px;
	width: 50px;
	height: 30px;
	align-items: center;
	justify-content: center;
}

.div2:hover {
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
	font-size: 20px;
	padding: auto;
	width: 100px;
	height: 140px;
	text-align: center;
	line-height: 140px;
	position: relative;
	display: inline-block;
	margin-left: 10px;
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
/* 원버튼 */
.circlebtn {
	border: 2px solid #c0c0c0;
	height: 25px;
	width: 25px;
	border-radius: 50%;
}
</style>
</head>
<body>
	<div>
		<h2 align="center">트레이너 등록</h2>
		<table>
			<tr>
				<td colspan="3" align="right"><span class="starblue"
					style="font-size: small;">*필수항목</span>
			</tr>
			<tr>
				<td class="tdfirst">카테고리</td>
				<td class="starblue">*&nbsp;&nbsp;</td>
				<td>${trainer.cate}</td>
			</tr>
			<tr>
				<td class="tdfirst">이름</td>
				<td class="starblue">*&nbsp;&nbsp;</td>
				<td class="tdlast">${trainer.name}<input class="inputtext"
					type="text" width="100%" name="name"></td>
			</tr>
			<tr>
				<td class="tdfirst">연락처</td>
				<td class="starblue">*&nbsp;&nbsp;</td>
				<td class="tdlast">${trainer.phone1 }${trainer.phone2}
					${trainer.phone3}<input class="inputtextnum" type="text"
					width="25%" name="phone123">
				</td>
			</tr>
			<tr>
				<td class="tdfirsttop">자격증</td>
				<td></td>
				<td class="tdlast">${trainer.certi}<textarea rows="4" cols="60"
						name=""></textarea></td>
			</tr>
			<tr>
				<td class="tdfirsttop">자기소개</td>
				<td></td>
				<td class="tdlast">${trainer.detail}<textarea rows="4"
						cols="60" name=""></textarea></td>
			</tr>
			<tr>
				<td class="tdfirsttop">등록된 상품</td>
				<td class="starbluetop">*&nbsp;&nbsp;</td>
				<td class="tdlast">${trainer.prod10}:${trainer.prod10retail}</td>

			</tr>
			<tr>
				<td class="tdfirsttop">트레이너사진(#/5)</td>
				<td class="starbluetop">*&nbsp;&nbsp;</td>
				<td class="tdlast"><input type="hidden" name="originalFileName"
					value="${trainer_detail_image.fileName }" /> <img
					src="${contextPath }/download.do?imageFileName=${trainer_detail_image.fileNamee }&goods_id=${trainer.goods_id}"
					id="preview" width="100px" /><br> <input type="file"
					name="fileName" id="fileName" onchange="readURL(this);" disabled /></td>
			</tr>
			<tr>
				<td colspan="3" align="right">
					<button class="button_white" onclick="backToList(this.form)">목록으로</button>&nbsp;&nbsp;
					<button class="button_white">수정요청</button>&nbsp;&nbsp; <a
					href="${contextPath }/business/mypage/trainerCont.do"><button
							class="button_blue">승인</button></a>
			</tr>
		</table>
	</div>
</body>
</html>