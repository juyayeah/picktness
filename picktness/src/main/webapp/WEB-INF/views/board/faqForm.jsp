<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
.text1{
width :80%;
height: 30px; 
}
    .free_inner{
    margin:30px 0 0 30px;
    }
      .divider {
    border-top: 1px solid #ccc;
    margin-top: 20px;
    margin-bottom: 20px;
  }
  textarea{
    width: 80%;
      resize:none;
      height: 350px;
      font-size: 17px;
    }
  .center {
      text-align: center;
  }
.content{
display: flex;


}
.btn{
  background-color: skyblue;
  color: white;
  border: none;
  float:right;
  padding:10px 10px 10px 10px;
  
}
p span {
margin-right:10px;

}
.content span{
  margin-right:10px;
}
  </style>
  <script>

    function back() {
    
         history.go(-1); 
    
    }
    function fn_articleForm(isLogOn,article)
    
    </script>
<head>
    <title>글쓰기</title>
</head>
<body>

  <div class="free_inner">
  <h1 style="margin-bottom: 5px;">자주묻는 FAQ </h1>
  <div class="divider"></div>
  <h2 class="center" style="margin-right: 120px;">자주묻는 FAQ 수정</h2>
  <form name="freeBoardForm" method="post" action="${contextPath}/board/addFaq.do" enctype="multipart/form-data" >
  
      <p><span style="font-size: 20px;">질문</span> 
      <input type="text" placeholder="질문을 입력해 주세요." name="title" style="width: 80%; height: 30px; font-size: 17px;" spellcheck="false"></p>
      <p class="content"><span style="font-size: 20px;">답변</span> 
      <textarea style="margin-left: 5px;" placeholder="답변을 입력해 주세요." name="content" style="width: 80%; margin-bottom: 50px;" spellcheck="false"></textarea></p>
      <p class="center"> 
      <input class="btn"type="submit" value="등록하기" style="margin-right:160px;">
      <a class="btn" type="button" href="${contextPath }/board/faqList.do" style="margin-right: 10px;">돌아가기</a></p>
    
    </form>
    </div>

</div>
</body>
</html>