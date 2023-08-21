<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib prefix="tiles"
uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <style>
      .search_inner {
        width: 1100px;
        position: relative;
        margin: 0 auto;
        padding-top: 50px;
      }
      .search_title {
        font-weight: bold;
        font-size: 24px;
        color: #333;
      }
      .search_line {
        width: 1100px;
        height: 1px;
        background-color: #333;
        margin: 10px 0px;
      }
      .search_null{
        padding:50px;
        text-align: center;
      }
      .search_null_title{
        font-weight: bold;
        color: #2890F1;
        margin-left:10px;
      }
    </style>
    <script>
      $(".input-search").attr("value", "${search_content}");
    </script>
    <title>검색창</title>
  </head>
  <body>
    <div class="search_inner">
      <span class="search_title">${search_content} 검색결과</span>

      <div class="search_line"></div>
      <c:choose>
        <c:when test="${not empty result.buniness }">
        </c:when>
        <c:when test="${not empty result.trainer}">
        </c:when>
        <c:when test="${not empty result.shopping }">
		<c:forEach var="item" items="${result.shopping }">
		${item.goods_title }
		<c:if test="${item.review_count != 0}">
		${item.review_star }
		${item.review_count }
		</c:if>
		${itme.priceRetail }
		<br>
		</c:forEach>
        </c:when>
        <c:otherwise>
          <div class="search_null">
            <img src="${contextPath}/images/goods/exclamation.png">
            <p><span class="search_null_title">${search_content}</span>에 대한 검색 결과가 없습니다.<br>
            검색어가 올바른지 확인 후 다시 검색해 주세요.</p>
          </div>
		</c:otherwise>
      </c:choose>
    </div>
  </body>
</html>
