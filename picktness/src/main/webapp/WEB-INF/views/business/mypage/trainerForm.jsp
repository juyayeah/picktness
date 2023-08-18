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
<style>
.starblue {
	color: #2890f1;
}

.tdfirst {
	width: 20%;
	align: right;
}

.tdsecond {
	width: 80%;
	align: left;
	resize: none;
}

textarea, input {
	width: 100%;
	border: 2px solid #c0c0c0;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	padding: 10px;
	resize: none;
}
</style>
</head>
<body>
	<div>
		<h2 align="center">트레이너 등록</h2>
		<table>
			<tr>
				<td colspan="2"><span class="starblue">*필수항목</span>
				<td>
			</tr>
			<tr>
				<td class="tdfirst">카테고리<span class="starblue">*</span></td>
				<td class="tdsecond"><label><input type="radio"
						name="cate" value="헬스">헬스</label> <label><input
						type="radio" name="cate" value="크로스핏">크로스핏</label> <label><input
						type="radio" name="cate" value="요가">요가</label> <label><input
						type="radio" name="cate" value="필라테스">필라테스</label> <label><input
						type="radio" name="cate" value="복싱">복싱</label> <label><input
						type="radio" name="cate" value="주짓수">주짓수</label></td>
			</tr>
			<tr>
				<td class="tdfirst">이름<span class="starblue">*</span></td>
				<td class="tdsecond"><input type="text" width="100%" name=""></td>
			</tr>
			<tr>
				<td class="tdfirst">연락처<span class="starblue">*</span></td>
				<td class="tdsecond"><input type="text" width="100%" name=""></td>
			</tr>
			<tr>
				<td class="tdfirst">자격증<span class="starblue">*</span></td>
				<td class="tdsecond"><input type="text" width="100%" name=""></td>
			</tr>
			<tr>
				<td class="tdfirst">자기소개<span class="starblue">*</span></td>
				<td class="tdsecond"><textarea rows="4" cols="60"></textarea> width="100%" name=""></td>
			</tr>
			<tr>
				<td class="tdfirst">상품등록<span class="starblue">*</span></td>
				<td class="tdsecond"></td>
			</tr>
			<tr>
				<td class="tdfirst"><span class="starblue">*</span></td>
				<td class="tdsecond"></td>
			</tr>
			<tr>
				<td class="tdfirst">판매가<span class="starblue">*</span></td>
				<td class="tdsecond"></td>
			</tr>
			<tr>
				<td class="tdfirst">트레이너사진(#/5)<span class="starblue">*</span></td>
				<td class="tdsecond">
				대표이미지 권장 크기:1000*1000(윈도대상 750*1000)입니다.<p></td>
			</tr>


		</table>
	</div>
</body>
</html>