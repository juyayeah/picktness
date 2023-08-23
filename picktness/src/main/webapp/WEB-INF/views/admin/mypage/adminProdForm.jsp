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

.tdfirst {
	width: 20%;
	align: right;
}

.td_second {
	width: 10%;
}

.td_third {
	width: 70%;
	align: left;
}

.bodybody select, .bodybody input, .bodybody textarea {
	width: 100%;
	padding: .4em .1em;
	margin: 5px 0;
	border: 1px solid #999;
	font-family: inherit;
	border-radius: 2px;
}
.tdfirsttop {
	width: 20%;
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
	padding: 10px 35px;
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

/* 이미지추가 */
.imgbox li {
	list-style: none;
	border: 2px solid #a0a0a0;
	border-radius: 5px;
	width: 70px;
	height: 90px;
	margin-left:10px;
}

.imgbox img {
	width: 70px;
	height: 90px;
}

.real-upload {
	display: none;
}

.upload {
	position: relative;
	border: 2px solid #a0a0a0;
	border-radius: 5px;
	width: 70px;
	height: 90px;
	background-color: rgba(255, 255, 255, 0.2);
	z-index: 5;
}

.image-preview {
	position: relative;
	width: 400px;
	height: 90px;
	background-color: rgba(255, 255, 255, 0.2);
	display: flex;
	margin-top: -4px;
	margin-left:70px;
	z-index: 1;
}

select option[value=""][disabled] {
	display: none;
}
</style>

</head>
<body>
	<div class="bodybody">
		<h2 align="center">상품 등록</h2>
		<table>
			<tr>
				<td colspan="2"></td>
				<td align="right"><em>*필수항목</em></td>
			</tr>
			<tr>
				<td class="tdfirsttop" align="right">카테고리</td>
				<td class="starblue">*</td>
				<td class="td_third"><select>
						<option value="" disabled selected>전체</option>
						<option value="프로틴쉐이크">프로틴쉐이크</option>
						<option value="닭가슴살">닭가슴살</option>
						<option value="스트레칭/마사지">스트레칭/마사지</option>
						<option value="테이프/아대">테이프/아대</option>
						<option value="근력/유산소용품">근력/유산소용품</option>
				</select>
			</tr>
			<tr>
				<td class="tdfirst" align="right">상품명</td>
				<td class="starblue"></td>
				<td width="70%"><input type="text" value="" name=""></td>
			</tr>
			<tr>
				<td class="tdfirst" align="right">정가</td>
				<td class="starblue">*</td>
				<td width="70%"><input type="number" placeholder="숫자만입력"
					name=""></td>
			</tr>
			<tr>
				<td class="tdfirst" align="right">할인가</td>
				<td class="starblue"></td>
				<td width="70%"><input type="number" placeholder="숫자만입력"
					name=""></td>
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
				<td width="70%"><input type="number" placeholder="숫자만입력"
					name=""></td>
			</tr>
			<tr>
				<td class="tdfirsttop" align="right">상품이미지(#/3)</td>
				<td class="starbluetop">*</td>
				<td width="70%"><div class="imgbox">
						<input type="file" class="real-upload" accept="image/*" required
							multiple>
						<div class="upload">
							<ul class="image-preview"></ul>
						</div>
					</div>
					<span style="font-size: 11px;">권장 크기 : 1000 x 1000 (윈도대상 750 x 1000)대표이미지 기준 1000x1000 이상 이미지를 등록하시면, 이미지 확대 기능이 제공됩니다.쇼핑검색에 노출되지 않는 경우 가이드를 확인해주세요.</span></td>
			<tr>
				<td class="tdfirsttop" align="right">상세설명</td>
				<td class="starbluetop">*</td>
				<td width="70%"><textarea name="coment" rows="10" cols="60"
						maxlength="4000"></textarea>
						<span style="font-size: 11px; color: #2089f1;">* 외부 링크를 통한 개인정보(휴대폰 번호, 이메일 주소) 수집은 금지되므로 등록시 노출이 제재될 수 있습니다.<br>
						* 상품명과 직접적 관련 없는 상세설명, 외부 링크 입력 시 관리자에 의해 판매 금지 될 수 있습니다. <br>
						* 안전거래정책에 위배될 경우 관리자에 의해 제재조치가 있을 수 있습니다.<br>
						* 픽트니스 이외의 외부링크, 일부 스크립트 및 태그는 자동 삭제될 수 있습니다.</span>
						</td>
			</tr>
			<tr>
				<td colspan="3" align="right">
				<br><a href="${contextPath }/admin/mypage/adminProdList.do"><button class="button_white">목록으로</button></a>&nbsp;&nbsp;
					<a href="${contextPath }/admin/mypage/addProd.do"><button class="button_blue">등록하기</button></a>
			</tr>
		</table><br><br>
	</div>
	<script>
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
    </script>
</body>
</html>