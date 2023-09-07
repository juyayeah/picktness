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
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품등록페이지</title>
	<script>

	function fn_modify_goods(goods_id, attribute){
		var frm_mod_goods=document.frm_mod_goods;
		var value1="";
		var value2="";
		var value3="";
		if(attribute=='goods_cate'){
			value1 = frm_mod_goods.cate_fir.value;
			value2 = frm_mod_goods.cate_sec.value;
		}else if(attribute=='goods_title'){
			value1 = frm_mod_goods.goods_title.value;
		}else if(attribute=='goods_priceOrigin'){
			value1 = frm_mod_goods.priceOrigin.value;
			value2 = frm_mod_goods.priceSale.value;
			value3 = frm_mod_goods.priceRetail.value;
		}else if(attribute=='goods_priceRetail'){
			value1 = frm_mod_goods.priceOrigin.value;
			value2 = frm_mod_goods.priceSale.value;
			value3 = frm_mod_goods.priceRetail.value;
		}else if(attribute=='goods_qty'){
			value1=frm_mod_goods.goods_qty.value;
		}else if(attribute=='detail'){
			value1 = frm_mod_goods.detail.value;
		}
		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/admin/goods/modifyGoodsInfo.do",
			data : {
				goods_id:goods_id,
				attribute:attribute,
				value1:value1,
				value2:value2,
				value3:value3
			},
			success : function(data, textStatus) {
				if(data.trim()=='mod_success'){
					alert("상품 정보를 수정했습니다.");
				}else if(data.trim()=='failed'){
					alert("다시 시도해 주세요.");	
				}
				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax	  */
	}
	

		var cnt = ${imageFileList.size() };
		function fn_addFile() {
			if (cnt < 3) {
				cnt++;
				$(".newFile")
						.append("<div class='upload'><labe>상세이미지</label><input type='file' name='detail_image'"
										+ cnt + " onchange='readURL(this,"
										+ cnt + ");'/><button type='button' class='button_blue' onClick='modifyImageFile('${goods.goods_id }','goods_sort')'>추가</button></div>");
				$('.newFile').append(
						"<img id='preview" + cnt + "'width=150 height=150/>");
			} else {
				alert("사진은 최대 3장만 첨부 가능합니다.");
			}
		}

		function readURL(input, num) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					var preview = "preview" + num;
					$('#' + preview).attr("src", e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		/* 유민 사진 추가 코드
		function getImageFiles(e) {
		const uploadFiles = [];
		const files = e.currentTarget.files;
		const imagePreview = document.querySelector('.image-preview');
		const docFrag = new DocumentFragment();
		
		if ([...files].length >= 4) {
		alert('이미지는 최대 6개 까지 업로드가 가능합니다.');
		return;
		}
		
		// 파일 타입 검사
		[...files].forEach(file => {
		if (!file.type.match("image/.*")) {
		  alert('이미지 파일만 업로드가 가능합니다.');
		  return
		}
		
		// 파일 갯수 검사
		if ([...files].length < 4) {
		  uploadFiles.push(file);
		  const reader = new FileReader();
		  reader.onload = (e) => {
		    const preview = createElement(e, file);
		    imagePreview.appendChild(preview);
		  };
		  reader.readAsDataURL(file);
		}
		});
		}
		
		function createElement(e, file) {
		const li = document.createElement('li');
		const img = document.createElement('img');
		img.setAttribute('src', e.target.result);
		img.setAttribute('data-file', file.name);
		li.appendChild(img);
		
		return li;
		}
		
		const realUpload = document.querySelector('.real-upload');
		const upload = document.querySelector('.upload');
		
		upload.addEventListener('click', () => realUpload.click());
		
		realUpload.addEventListener('change', getImageFiles);
		 */

		$(function() {
			$("#cate").change(function(){
				if($("#cate option:selected").val() == "tender" || $("#cate option:selected").val() == "protain"){
					$("#cate_fir").attr("value", "food");
					$("#cate_sec").attr("value", $("#cate option:selected").val());
				} else{
					$("#cate_fir").attr("value", "goods");
					$("#cate_sec").attr("value", $("#cate option:selected").val());
				}
			});
			
			switch("${goods.cate_sec}"){
			case "tender" : $("#cate").val("tender");
			break;
			case "protain" : $("#cate").val("protain");
			break;
			case "masage" : $("#cate").val("masage");
			break;
			case "tape" : $("#cate").val("tape");
			break;
			case "aerobic" : $("#cate").val("aerobic");
			break;
			};
			
		});
	</script>
<style>
.bodybody {
	position: relative;
	width: 700px;
	margin: 0 auto;
}

.bodybody a {
	background: transparent;
	text-decoration: none;
	color: inherit;
}

.bodybody ul {
	list-style: none;
}

.bodybody em {
	font-size: 15px;
	color: #2890f1;
	font-weight: 800;
}

/* .tdfirst {
	width: 20%;
	align: right;
}

.td_second {
	width: 10%;
}

.td_third {
	width:fit-content;
	align: left;
} */
.bodybody select, .bodybody input, .bodybody textarea {
	width: 380px;
	padding: .4em .1em;
	margin: 5px 0;
	border: 1px solid #999;
	font-family: inherit;
	border-radius: 2px;
	resize: none;
	outline: none;
}

.bodybody input[type='file'] {
	width: 250px;
	padding: .4em .1em;
	margin: 5px 0;
	border: 1px solid #999;
	font-family: inherit;
	border-radius: 2px;
	resize: none;
	outline: none;
}

.tdfirsttop {
	width: 15%;
	text-align: right;
	display: table-cell;
	vertical-align: top;
	padding-top: 5px;
}

.starblue {
	width: 5%;
	color: #2890f1;
}

.starbluetop {
	width: 5%;
	color: #2890f1;
	display: table-cell;
	vertical-align: top;
	padding-top: 5px;
}
/* 버튼 */
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
	padding: 10px 35px;
}

.button_white:hover {
	cursor: pointer;
	border-color: #2890f1;
}

.button_blue {
	border-radius: 5px;
	margin-right: -4px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: 5px;
	border: 2px solid #2890f1;
	background-color: #2890f1;
	color: #fff;
	font-size: 12px;
	padding: 6px 5px;
}

.button_blue:hover {
	cursor: pointer;
	border: 2px solid #0b5ca8;
	background-color: #0b5ca8;
}

form input::file-selector-button {
	display: none;
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

/* 이미지추가 */
.imgbox li {
	list-style: none;
	border: 2px solid #a0a0a0;
	border-radius: 5px;
	width: 70px;
	height: 90px;
	margin-left: 10px;
}

.imgbox img {
	width: 90px;
	height: 90px;
}

/* .real-upload {
	display: none;
} */

/* .upload {
	position: relative;
	border: 2px solid #a0a0a0;
	border-radius: 5px;
	width: 70px;
	height: 90px;
	background-color: rgba(255, 255, 255, 0.2);
	z-index: 5;
} */
.image-preview {
	position: relative;
	width: 400px;
	height: 90px;
	background-color: rgba(255, 255, 255, 0.2);
	display: flex;
	margin-top: -4px;
	margin-left: 70px;
	z-index: 1;
}

select option[value=""][disabled] {
	display: none;
}

.addButton {
	width: 30%;
}
</style>

</head>
<body>
	<div class="bodybody">
		<h2 align="center">상품 수정</h2>
		<form action="${contextPath }/admin/goods/updateGoods.do"
			method="post" id="addForm" enctype="multipart/form-data" name="frm_mod_goods">
			<table>
				<tr>
					<td colspan="4" align="right"><em>*필수항목</em></td>
				</tr>
				<tr>
					<td class="tdfirsttop" align="right">카테고리</td>
					<td class="starblue">*</td>
					<td class="td_third" width="50%"><select id="cate">
							<optgroup label="식품">
								<option value="" disabled>전체</option>
								<option value="protain">프로틴쉐이크</option>
								<option value="tender">닭가슴살</option>
							</optgroup>
							<optgroup label="기구/용품/장비">
								<option value="masage">스트레칭/마사지</option>
								<option value="tape">테이프/아대</option>
								<option value="aerobic">근력/유산소용품</option>
							</optgroup>
					</select>
					<input type="hidden" id="cate_fir" name="cate_fir">
					<input type="hidden" id="cate_sec" name="cate_sec">
					</td>
					<td class="modfy_btn">
						<button type="button" class="button_blue"
							onClick="fn_modify_goods('${goods.goods_id }','goods_cate')">수정
							반영</button>
					</td>
				</tr>
				<tr>
					<td class="tdfirst" align="right">상품명</td>
					<td class="starblue"></td>
					<td><input type="text" name="goods_title"
						value="${goods.goods_title }"></td>
					<td class="modfy_btn">
						<button type="button" class="button_blue"
							onClick="fn_modify_goods('${goods.goods_id }','goods_title')">수정
							반영</button>
					</td>
				</tr>
				<tr>
					<td class="tdfirst" align="right">정가</td>
					<td class="starblue">*</td>
					<td><input type="number" placeholder="숫자만입력"
						name="priceOrigin" id="priceOrigin" min="0"
						value="${goods.priceOrigin }"></td>
					<td class="modfy_btn">
						<button type="button" class="button_blue"
							onClick="fn_modify_goods('${goods.goods_id }','goods_priceOrigin')">수정
							반영</button>
					</td>
				</tr>
				<tr>
					<td class="tdfirst" align="right">판매가</td>
					<td class="starblue"></td>
					<td><input type="number" placeholder="숫자만입력"
						name="priceRetail" id="priceRetail" min="0"
						value="${goods.priceRetail }"></td>
					<td class="modfy_btn">
						<button type="button" class="button_blue"
							onClick="fn_modify_goods('${goods.goods_id }','goods_priceRetail')">수정
							반영</button>
					</td>
				</tr>

				<!-- 특정기간 할인 -->
				<!--
<tr>
<td width="20% "align="right"></td>
<td class="starblue"></td>
<td width="70%"><input type="checkbox" name="">특정기간에만 할인 
<span class="inline_box" style="display:inline;">
<ul>
<li><a href="#"><span class="blind">3일</span></a></li> 
<li><a href="#"><span class="blind">1주</span></a></li> 
<li><a href="#"><span class="blind">1개월</span></a></li> 
<li><a href="#"><span class="blind">3개월</span></a></li> 
</ul>
</span> 
</td>
</tr>-->
				<tr>
					<td class="tdfirst" align="right">재고수량</td>
					<td class="starblue">*</td>
					<td><input type="number" placeholder="숫자만입력" name="goods_qty"
						min="0" value="${goods.goods_qty }"></td>
					<td class="modfy_btn">
						<button type="button" class="button_blue"
							onClick="fn_modify_goods('${goods.goods_id }','goods_qty')">수정
							반영</button>
					</td>
				</tr>
				<tr>
					<td class="tdfirsttop" align="right">상품이미지</td>
					<td class="starbluetop">*</td>
					<td colspan="2"><div class="imgbox">
							<input type="button" class="addButton" value="파일 추가"
								onClick="fn_addFile()" />
							<div class="newFile">
								<c:forEach var="image" items="${imageFileList }"
									varStatus="itemNum">
									<c:choose>
										<c:when test="${image.fileType == 'main_image' }">
											<label>메인이미지</label>
											<input type='file' id="main_image" name="main_image"
												onchange="readURL(this,'${itemNum.count }');" />
																								<button type="button" class="button_blue"
													onClick="modifyImageFile('${goods.goods_id }','goods_sort')">수정
													반영</button>
											<div class="upload">
												<img id="preview${itemNum.count }" width="150" height="150"
													src="${contextPath }/download.do?cate=shop&bno=${image.goods_id}&imageFileName=${image.fileName}" />
											</div>
										</c:when>
										<c:otherwise>
											<label>상세 이미지</label>
											<input type='file' id="detail_image" name="detail_image"
												onchange="readURL(this,'${itemNum.count }');" />
																								<button type="button" class="button_blue"
													onClick="modifyImageFile('${goods.goods_id }','goods_sort')">수정
													반영</button>
											<div class="upload">
												<img id="preview${itemNum.count }" width="150" height="150"
													src="${contextPath }/download.do?cate=shop&bno=${image.goods_id}&imageFileName=${image.fileName}" />
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div></td>
				<tr>
					<td class="tdfirsttop" align="right">상세설명</td>
					<td class="starbluetop"></td>
					<td><textarea name="detail" rows="10" cols="60"
							maxlength="4000">${goods.detail }</textarea></td>
					<td class="modfy_btn">
						<button type="button" class="button_blue"
							onClick="fn_modify_goods('${goods.goods_id }','detail')">수정
							반영</button>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="right"><br>
						<button class="button_white" type="button"
							onclick="location.href='${contextPath}/admin/mypage/adminProdList.do'">목록으로</button>&nbsp;&nbsp;
					
				</tr>
			</table>
			<br> <br>
		</form>
	</div>
</body>
</html>