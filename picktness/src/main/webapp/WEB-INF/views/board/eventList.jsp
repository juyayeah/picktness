<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<style>
      .event_inner {
        position: relative;
        width: 1100px;
        margin: 0 auto;
      }
      .divider {
        border-top: 1px solid #ccc;
        margin-top: 20px;
        margin-bottom: 1px; 
      }
      .event_btn{

        float:right;
      }
event_display{
   display:inline-block;
}
.event_color{
  background-color: #ccc;
  margin-top: 0%;
}
</style>
<meta charset="UTF-8">
<title>이벤트 조회</title>
</head>
<body>
<div class="event_inner">
<div class="event_display"><h2>이벤트</h2> <input class="event_btn" type="button" value="목록보기"></div>
<br>
<div class="divider"></div>
<p class="event_color">갓성비 브랜드  픽트니스! open 이벤트!!</p>


</div>



</body>
</html>