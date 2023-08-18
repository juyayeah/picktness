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
    <title>오늘식단</title>
    <style>
          .mill_inner {
        position: relative;
        width: 1100px;
        margin: 0 auto;
      }
      .mill_content{

        width:860px;
      }
      .mill_img{

        width:280px;
        height:280px;
        overflow: auto; 
      }
      
.mill_pic{
  display: inline-block;
  
  }
  .divider {
    border-top: 1px solid #ccc;
    /* margin-top: 10px; */
    margin-bottom: 20px;
  }

    </style>
</head>
<body>
  
<div class="mill_inner">

<h1>오늘 식단</h1>
<div class="divider"></div>
  <div class="mill_content">
    <a href="https://google.com">
<div class="mill_pic"><img class="mill_img" src="${contextPath}/images/board/food.png"/>
</a>
</div>
<a href="https://google.com">
<div class="mill_pic"><img class="mill_img" src="${contextPath}/images/board/food.png"/>
</a>
</div>
<a href="https://google.com">
<div class="mill_pic"><img class="mill_img" src="${contextPath}/images/board/food.png"/>
</a></div>
<a href="https://google.com">
<div class="mill_pic"><img class="mill_img" src="${contextPath}/images/board/food.png"/>
</a></div>
<a href="https://google.com">
<div class="mill_pic"><img class="mill_img" src="${contextPath}/images/board/food.png"/>
</a></div>
<a href="https://google.com">
<div class="mill_pic"><img class="mill_img" src="${contextPath}/images/board/food.png"/>
</a></div>
<a href="https://google.com">
<div class="mill_pic"><img class="mill_img" src="${contextPath}/images/board/food.png"/>
</a></div>
<a href="https://google.com">
<div class="mill_pic"><img class="mill_img" src="${contextPath}/images/board/food.png"/>
</a></div>
<a href="https://google.com">
<div class="mill_pic"><img class="mill_img" src="${contextPath}/images/board/food.png"/>
</a></div>
</div>
<div class="divider"></div>




</div>
</body>
</html>