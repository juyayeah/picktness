<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<c:set var="contextPath" value = "${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<script>
function fn_boardForm(isLogOn,freeBoardInsert,loginForm){
	if(isLogOn != '' && isLogOn){
		location.href=freeBoardInsert;
	}else{
		alert("로그인 후 글쓰기가 가능합니다.")
		location.href=loginForm+"?action=/board/freeBoardInsert.do"
	}
}
</script>
<meta charset="UTF-8">
<title>자유게시판</title>
<style>
table {
text-align:center;
            width: 80%;
           border-collapse: collapse;
        }
              .free_inner {
        position: relative;
        width: 1100px;
        margin: 0 auto;
        margin-bottom:20px;
      }
              
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        .jb-th-1{
        width:300px;
        }
</style>
</head>
<body>
<div class="free_inner">
<h2>자유게시판</h2>


   <table class="table">
        <thead>
          <tr>
            <th >순번</th>
            <th >제목</th>
            <th >글쓴이</th>
            <th>작성날짜</th>
          </tr>
        </thead>
        <c:choose>
        <c:when test="${freeBoardList == null }">
<tr height="10">
<td colspan="4">
    <p align="center">
    <b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
    </p>
</td>
</tr>
</c:when>
<c:when test="${freeBoardList != null}">
<c:forEach var="freeBoard" items="${freeBoardList}">
<tr align="center">
<td >${freeBoard.bno}</td>
<td class="jb-th-1" >${freeBoard.title}</td>
<td >${freeBoard.member_id}</td>
<td >${freeBoard.freeDate}</td>
</tr>
</c:forEach>
</c:when>
</c:choose>
</table> 
<div>
<input type="button" onclick="javascript:fn_boardForm('${isLogOn }','${contextPath}/board/freeBoardForm.do','${contextPath}/member/loginForm.do')" value="글쓰기">
</div>
</div> 
</body>
</html>