<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <button class="button">목록으로</button>
  </div>
  <!-- 여기에 식단 내용을 추가하세요 -->
  <div class="divider" style="margin-bottom:5px;"></div>
  <div class="content">
    <div class="image">
    <p class="content-date">작성일:<fmt:parseDate value="${millDetail.millDate}" var="millDate" pattern="yyyy-MM-dd HH:ss:mm"/>
    <fmt:formatDate value="${millDate }" pattern="yyyy-MM-dd"/></p>
      
      <img  class="image_pic" src="${contextPath}/images/board/food.png" alt="이미지 설명">
      
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
  <div class="divider"></div>
  <h3>전체 댓글</h3>
  <div class="divider"></div>
  <div class="comments-section">
    <div class="comment">
      <p> dbal****</p>
      <p class="comment-text">정말 믓찌당 !!</p>
      <p> 2023-08-16 11:12</p>
    </div>
    <div class="comment">
      <p>dnwn****</p>
      <p class="comment-text">구매처 알려주세요 !</p>
      <p>2023-08-17 23:12</p>
    </div>
    <!-- 댓글 내용을 추가하려면 위와 같은 형식으로 추가하시면 됩니다. -->
  </div>
  
  <div class="divider"></div>
 <h3>댓글 등록</h3> 
  <form method="post" action="${contextPath}/board/addReply">
  <div class="comment-input-container">
    <textarea class="comment-input" rows="4" name="content"placeholder="댓글을 작성해주세요!"></textarea>
    <button type="submit" class="comment-button">댓글 등록</button>
  </div>
  </form>
  </div>

</body>
</html>

