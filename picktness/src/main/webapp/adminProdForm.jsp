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
	width: 860px;
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

.td_first {
	width: 20%;
	align: right;
}

.td_second {
	width: 5%;
}

.td_third {
	width: 40%;
	align: left;
	size: 40px;
}

.bodybody select, input, textarea {
	width: 100%;
	padding: .4em .1em;
	margin: 5px 0;
	border: 1px solid #999;
	font-family: inherit;
	border-radius: 2px;
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
	border: 3px solid #a0a0a0;
	border-radius: 5px;
	width: 100px;
	height: 120px;
}

.imgbox img {
	width: 100px;
	height: 120px;
}

.real-upload {
	display: none;
}

.upload {
	position: relative;
	width: 100px;
	height: 120px;
	background-color: rgba(22, 255, 255, 0.2);
	z-index: 5;
}

.image-preview {
	position: relative;
	width: 600px;
	min-height: 200px;
	background-color: rgba(25, 255, 255, 0.2);
	display: flex;
	gap: 20px;
	z-index: 1;
}
</style>
<script>
      function getImageFiles(e) {
        const uploadFiles = [];
        const files = e.currentTarget.files;
        const imagePreview = document.querySelector('.image-preview');
        const docFrag = new DocumentFragment();
  
        if ([...files].length >= 7) {
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
          if ([...files].length < 7) {
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
				<td width="20%" align="right">카테고리<em>* </em></td>
				<td width="3%"></td>
				<td class="td_third"><select>
						<option value="전체" selected>전체</option>
						<option value="프로틴쉐이크">프로틴쉐이크</option>
						<option value="닭가슴살">닭가슴살</option>
						<option value="스트레칭/마사지">스트레칭/마사지</option>
						<option value="테이프/아대">테이프/아대</option>
						<option value="근력/유산소용품">근력/유산소용품</option>
				</select>
			</tr>
			<tr>
				<td width="20%" align="right">상품명<em>* </em></td>
				<td width="3%"></td>
				<td width="40%"><input type="text" value="" name=""></td>
			</tr>
			<tr>
				<td width="20%" align="right">정가<em>* </em></td>
				<td width="3%"></td>
				<td width="40%"><input type="number" placeholder="숫자만입력"
					name=""></td>
			</tr>
			<tr>
				<td width="35%" align="right">할인가</td>
				<td width="3%"></td>
				<td width="62%"><input type="number" placeholder="숫자만입력"
					name=""></td>
			</tr>

			<!-- 특정기간 할인 -->
			<!--
<tr>
<td width="20% "align="right"></td>
<td width="3%"></td>
<td width="40%"><input type="checkbox" name="">특정기간에만 할인 
<span class="inline_box" style="display:inline;">
<ul>
<li><a href="#"><span class="blind">3일</span></a></li> 
<li><a href="#"><span class="blind">1주</span></a></li> 
<li><a href="#"><span class="blind">1개월</span></a></li> 
<li><a href="#"><span class="blind">3개월</span></a></li> 
</ul>
</span> 
</td>
</tr>
-------- 달력 ---------vvvvvvvv
<tr>
<td></td>
<td width="3%"></td>
<td><input name="search_date" type="date" size="40">~<input name="search_date" type="date" size="40"></td>
</tr>
-->
			<tr>
				<td width="20%" align="right">재고수량<em>* </em></td>
				<td width="3%"></td>
				<td width="40%"><input type="number" placeholder="숫자만입력"
					name=""></td>
			</tr>
			<tr>
				<td width="20%" align="right">상품이미지(#/20)<em>* </em></td>
				<td width="3%"></td>
				<td width="40%">
    
					</td>
			<tr>
			<tr>
				<td width="20%" align="right">상세설명<em>* </em></td>
				<td width="3%"></td>
				<td width="40%"><textarea name="coment" rows="10" cols="60"
						maxlength="4000"></textarea></td>
			</tr>
		</table>
		<div class="imgbox"><input type="file" class="real-upload" accept="image/*" required multiple>
    <div class="upload">
<ul class="image-preview"></ul></div></div>
	</div>
</body>
</html>