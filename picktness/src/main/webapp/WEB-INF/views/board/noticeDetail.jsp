<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% 
request.setCharacterEncoding("utf-8"); 
%>
<!DOCTYPE html>
<html>
<head>
    <title>공지사항</title>
    

    <style>
    .notice_inner{
    
    margin:30px 0 0 30px;
    }

      .notice_btn{

        float:right;
    padding: 10px 15px;
    background-color: #007BFF;
    color: #fff;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
    margin:0 10px 5px 0;
      }
        .notice_btn:hover {
    background-color: #0056b3;
  }

    </style>
</head>
<body>

<form id="frm" method="post" >
    <div class="notice_inner">
    

<h2>${noticeList.title}</h2>
<a  class="notice_btn" type="button" href="${contextPath}/board/noticeList.do">목록으로</a></span>

<p>${noticeList.noticeDate}</p>
<hr width="100%" color="#959ea6" style="padding=30px">

<pre>${noticeList.content}</pre>

</div>

   <c:if test="${member.id == 'admin' }"> 
    
    <a type="button" class="notice_btn" href="${contextPath}/board/deleteNotice.do?bno=${noticeList.bno}">삭제하기</a>
   <a type="button"  class="notice_btn" href="${contextPath }/board/modNoticeForm.do?bno=${noticeList.bno}" >수정하기</a>
    <input type="hidden" name="bno" value="${noticeList.bno}">
    </c:if> 
    </form>
</body>
</html>