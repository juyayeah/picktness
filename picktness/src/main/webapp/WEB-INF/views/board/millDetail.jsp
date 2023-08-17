<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
  body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 20px;
  }
  .header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
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
    margin-top: 20px;
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
</style>
<title>오늘 식단</title>
</head>
<body>
  <div class="header">
    <h3>오늘 식단</h3>
    <button class="button">목록으로</button>
  </div>
  <!-- 여기에 식단 내용을 추가하세요 -->
  <div class="divider"></div>
  <div class="content">
    <div class="image">
    <p class="content-date">작성일: 2023-07-20</p>
      <img src="images/food.png" alt="이미지 설명">
      
    </div>
    <div class="info" style ="margin-left: 200px;">
      <h4 class="id">dltk*****</h4>
      <p class="subtitle">#저녁식단</p>
      <div class="subtitle-divider"></div>
      <p class="content-text">저녁 과카몰리,통밀식빵 두장, 삶은 계란 두알 간식 캐모마일티,(다죽어가던) 남작복숭아 두개 점심 오트밀김치토마토죽어제 배탈이 나서 점심엔 오트밀죽을 먹었는데 김치를 넣으니생각보다
      자극적이였던.. 하지만 내 튼튼위장은 끄떡없지 납복은 후숙한답시고 며칠 실온에 방치해뒀더니 금방 곰팡이가 펴서 두 개만 살아남았다... 그래서 냉큼 조져줌 
      건강식으로 과식하면 과연 살이 빠질까? 암튼 오늘 유산소운동 근려운동도 완료</p>
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
  <div class="comment-input-container">
    <textarea class="comment-input" rows="4" placeholder="로그인 후 코멘트를 작성하실 수 있습니다."></textarea>
    <button class="comment-button">댓글 등록</button>
  </div>
</body>
</html>

