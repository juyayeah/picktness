<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%

String uri =pageContext.getAttribute("contextPath").toString()+request.getRequestURI();
session.setAttribute("uri",uri);
System.out.println(request.getRequestURI());
System.out.println(uri);

%>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript">
/* function fn_millBoardForm(isLogOn, millDetail, loginForm) {
    if (isLogOn !== '' && isLogOn !== 'false') {
        location.href = millDetail;
    } else {
        alert("로그인 후 글 쓰기가 가능합니다.");
        
        var encodedBno = encodeURIComponent('${millDetail.bno}');
        var loginForm = '/member/loginForm.do'; 
        
      
        location.href = loginForm + "?action=/board/millDetail.do&bno=" + encodedBno;
    }
} */ 

 $(function(){
	var uri = window.location.href;
	
    $.ajax({
    	url : "${contextPath}/redirectUri.do",
    	type : "POST",
		data : {str : uri},
		success : function(data, status, xhr){
			
		},
		error : function(data,status, error){
			
		}
		
    });
}); 


</script>
<style>
    .mill_inner{
    margin:30px 0 0 30px;
    }
  body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 20px;
  }
  .header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    /* margin-bottom: 20px; */
  }
  .button {
    padding: 10px 20px;
    background-color: #007BFF;
    color: #fff;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }
  .button:hover {
    background-color: #0056b3;
  }
  .divider {
    border-top: 1px solid #ccc;
    /* margin-top: 10px; */
    margin-bottom: 20px;
  }
  .content {
    display: flex;
    align-items: flex-start;
  }
  .image {
    max-width: 150px;
    margin-right: 20px;
  }
  .info {
    flex: 1;
    width:300px;
 
  }
  .id {
    font-weight: bold;
    margin-top: 0;
  }
  .subtitle {
    margin-top: 5px;
    color: #777;
  }
  .content-text {
    margin-top: 10px;
  }
  .comments-section {
    margin-top: 20px;
  }
  .comment {
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
    padding: 10px;
    border: 1px solid #ccc;
  }
  .comment-text {
    width: 70%;
  }
  .comment-input-container {
    display: flex;
    align-items: flex-start;
    margin-top: 20px;
  }
  .comment-input {
    flex: 1;
    padding: 10px;
    border: 1px solid #ccc;
  }
  .comment-button {
    padding: 10px 20px;
    background-color: #ccc;
    color: #333;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }
  .comment-button:hover {
    background-color: #999;
  }
  .image_pic{
  width:300px;
  height:300px;
  }
  textarea{
    width:90%;
    margin-bottom: 20px;
    resize: none;
  }
  .content-date{
  margin-top:0px;
  }
</style>
<title>오늘 식단</title>
</head>
<body>
<div class="mill_inner">

  <div class="header">

    <h3>오늘 식단</h3>
    <c:if test="${member.id == millDetail.member_id }">
    <a href="/board/removeMillBoard.do?bno=${millDetail.bno }" class="button" >삭제하기</a>

    </c:if>
    <a class="button" href="${contextPath}/board/millBoardList.do">목록으로</a>
  </div>
  
  
  <div class="divider" style="margin-bottom:5px;"></div>
  <div class="content">
    <div class="image">
    <p class="content-date"> 작성일: <fmt:parseDate value="${millDetail.boardDate}" var="millDate" pattern="yyyy-MM-dd" />
    <fmt:formatDate value="${millDate}" pattern="yyyy-MM-dd" /></p>
      
      <img  class="image_pic" src="${contextPath}/download.do?cate=mill&imageFileName=${millDetail.todaymill_img}&bno=${millDetail.bno}" alt="이미지 설명">
      
    </div>
    <div class="info" style ="margin-left: 200px;">
   <b> ${fn:substring(millDetail.member_id,0,4) }
     <c:forEach begin="5" end="${fn:length(millDetail.member_id)}" step="1">
        *
      </c:forEach></b>
      
      <p class="subtitle">${millDetail.hastag}</p>
      <div class="subtitle-divider"></div>
      <p class="content-text">${millDetail.content}</p>
    </div>
  </div>
   <c:if test ="${!empty commentList}">
  
  <div class="divider"></div>
  <h3>전체 댓글</h3>
  <div class="divider"></div>
   <c:forEach var="item" items="${commentList}" >
  <div class="comments-section">
    <div class="comment">
      <p>
        <b> ${fn:substring(item.member_id,0,4) }
     <c:forEach begin="5" end="${fn:length(item.member_id)}" step="1">
        *
      </c:forEach></b>
       
       </p>
      <p class="comment-text">${item.content}</p>
      <p> 
      <fmt:parseDate value="${item.millrDate} " var="millrDate" pattern="yyyy-MM-dd" />
    <fmt:formatDate value="${millDate}" pattern="yyyy-MM-dd" /></p>
    </div>
    </div>
    </c:forEach>
    </c:if> 
  <div class="divider"></div>
 <h3>댓글 등록</h3> 
 <c:choose>
 <c:when test="${! empty member}">
  <form method="post" action="${contextPath}/board/addReply.do">
  <input type="hidden" name="p_bno" value="${millDetail.bno}">
  <input type="hidden" name="member_id" value="${member.id}">
  
 
  <div class="comment-input-container">
    <textarea id="content"  class="comment-input" rows="4"  name="content"placeholder="댓글을 작성해주세요!"></textarea>
 <button  type="submit"  class="comment-button" >댓글 등록</button>
  </div>
  </form>
  </c:when>
  <c:otherwise>
    <div class="comment-input-container">
    <textarea class="comment-input" rows="4"   name="content" placeholder="로그인 후 댓글 작성이 가능합니다" disabled></textarea>
<button type="button" class="comment-button" onClick="location.href='${contextPath}/member/loginForm.do'">댓글 등록</button>

  </div>
  </c:otherwise>
 </c:choose>
</div>
</body>
</html>

