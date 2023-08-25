<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>




<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% 
request.setCharacterEncoding("utf-8"); 
%>
<!DOCTYPE html>
<html>
<head>
    <script>
    function fn_boardForm(isLogOn, millBoardForm, loginForm) {
        if (isLogOn != '' && isLogOn) {
            location.href = millBoardForm;
        } else {
            alert("로그인 후 글쓰기가 가능합니다.");
            location.href = loginForm + "?action=/board/millBoardForm.do";
        }
    }

    </script>
    <title>오늘식단</title>
    <style>
    .mill_inner {
        margin: 30px 0 0 30px;
    }
    .mill_img {
        width: 280px;
        height: 280px;
        overflow: auto; 
    }
    .mill_pic {
        display: inline-block;
    }
    .divider {
        border-top: 1px solid #ccc;
        margin-bottom: 20px;
    }
    .img_size {
        width: 260px;
        height:260px;
    }
    .td-with-hover{
        width: 260px;
        height:260px;
    }
    .td-with-hover:hover .image-id {
    display: block;
    }

.image-id {
    position: absolute;
    background-color: rgba(0, 0, 0, 0.5);
    color: #fff;
    padding-top: 130px;
    border-radius: 5px;
    font-size: 15px;
    pointer-events:none;
    width: 260px; /* 전체 너비로 설정 */
    height: 130px;
    top:0;
    text-align: center;
    display: none;

}

    </style>
</head>
<body>
<div class="mill_inner">
    <h1>오늘 식단</h1>
    <input type="button" onclick="javascript:fn_boardForm('${isLogOn}', '${contextPath}/board/millBoardForm.do', '${contextPath}/member/loginForm.do')" value="글쓰기">
    <div class="divider"></div>
<div class="mill_content">
    <table>
        <tr>
            <c:forEach var="board" items="${millList}" varStatus="token">
                <td class="td-with-hover" style="position: relative;">
                    <a href="${contextPath}/board/millDetail.do?bno=${board.bno}">
                        <img class="img_size" src="${contextPath}/download.do?cate=mill&imageFileName=${board.todaymill_img}&bno=${board.bno}">
                    </a>
                    <div class="image-id"><b> ${fn:substring(board.member_id,0,4) }
     <c:forEach begin="5" end="${fn:length(board.member_id)}" step="1">
        *
      </c:forEach></b></div>
                </td>
                <c:if test="${token.count % 3 eq 0}">
                    </tr><tr>
                </c:if>
            </c:forEach>
        </tr>
    </table>
</div>

</div>
</body>
</html>