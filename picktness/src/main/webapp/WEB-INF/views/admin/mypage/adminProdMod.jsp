<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib prefix="tiles"
uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script>
let result ={};
const cate = document.getElementById('cate');

result.cate = cate.options[cate.selectedIndex].value;
</script>
<style>
.bodybody body {
position: relative;
max-width: 1100px;
min-height: 120px;
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
font-size : 15px;
color: #2890f1;
font-weight: 800;
}
.td_first{
width: 20%;
align: right;
}
.td_second{
width: 5%;
}
.td_third{
width: 40%;
align: left;
size: 40px;
}
</style>
</head>
<body>
<div class="bodybody">
<h2 align="center"> 상품 등록</h2>
<table >
<tr>
<td colspan="2"></td>
<td align="right"><em>*필수항목</em></td>
</tr>
<tr>
<td width="20%" align="right">카테고리<em>* </em></td>
<td width="5%"></td>
<td class="td_third">
<select id="cate" onclick="changeFn()">
<optgroup name="cate_fir" label="식품">						<option value="" disabled selected>전체</option>
						<option name="cate_sec" value="프로틴쉐이크">프로틴쉐이크</option>
						<option name="cate_sec" value="닭가슴살">닭가슴살</option>
						</optgroup>
						<optgroup name="cate_fir" label="기구/용품/장비">
						<option name="cate_sec" value="스트레칭/마사지">스트레칭/마사지</option>
						<option name="cate_sec" value="테이프/아대">테이프/아대</option>
						<option name="cate_sec" value="근력/유산소용품">근력/유산소용품</option>
						</optgroup></select>
</tr>
<tr>
<td width="20%" align="right">상품명<em>* </em></td>
<td width="5%"></td>
<td width="40%"><input type="text" value="" name=""></td>
</tr>
<tr>
<td width="20%" align="right">정가<em>* </em></td>
<td width="5%"></td>
<td width="40%"><input type="number" placeholder="숫자만입력" name=""></td>
</tr>
<tr>
<td width="20%"align="right">할인가</td>
<td width="5%"></td>
<td width="40%"><input type="number" placeholder="숫자만입력" name=""></td>
</tr>

<!-- 특정기간 할인 -->
<!--
<tr>
<td width="20% "align="right"></td>
<td width="5%"></td>
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
<td width="5%"></td>
<td><input name="search_date" type="date" size="40">~<input name="search_date" type="date" size="40"></td>
</tr>
-->
<tr>
<td width="20%" align="right">재고수량<em>* </em></td>
<td width="5%"></td>
<td width="40%"><input type="number" placeholder="숫자만입력" name=""></td>
</tr>
<tr>
<td width="20%" align="right">상품이미지(#/20)<em>* </em></td>
<td width="5%"></td>
<td width="40%"><img src="#" id="preview" width="150px" /><br> <input type="file" name="imageFileName" id="imageFileName"	onchange="readURL(this);" /></td>
<tr>
<tr>
<td width="20%" align="right">상세설명<em>* </em></td>
<td width="5%"></td>
<td width="40%"><textarea name = "coment" rows ="10" cols ="60" maxlength = "4000"></textarea></td>
</tr>
</table>
</div>
</body>
</html>