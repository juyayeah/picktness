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
    padding: 10px 15px;
    background-color: #007BFF;
    color: #fff;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
    margin:0 100px 5px 0;
    border-radius: 9px;
  float:right;
  
}
p span {
margin-right:10px;

}
.content span{
  margin-right:10px;
}
  </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script type="text/javascript">
        
         $(document).ready(function(){
        $("#edit").on("click", function(){
            var frm = $("#frm")[0];
            frm.action = "${contextPath}/board/modFaq.do";
            frm.submit();
        });
        }) 
        
        
        </script> 
<head>
    <title>글쓰기</title>
</head>
<body>


 
<form method="post"  id="frm">
  <div class="free_inner">
  <h1 style="margin-bottom: 5px;">자주묻는 FAQ</h1>
  <div class="divider"></div>
  <h2 class="center" style="margin-right: 120px;">FAQ 수정</h2>
  
  
      <p><span style="font-size: 20px;">제목</span> 
      <input type="text" spellcheck="false" value="${faqList.title }" name="title" style="width: 80%; height: 30px; font-size: 17px;"></p>
      <p class="content"><span style="font-size: 20px;">내용</span> 
      <textarea spellcheck="false" style="margin-left: 5px;" name="content" style="width: 80%; margin-bottom: 50px;">${faqList.content}</textarea></p>
      <p > 
      <a class="btn" type="button" id="edit" >수정하기</a>
      <a class="btn" type="button" href="${contextPath }/board/faqList.do" style="margin-right: 10px;">돌아가기</a>
      </p>
    
       <input type="hidden" name="bno" value="${faqList.bno }">
    <input type="hidden" name="noticedate" value="${faqList.faqDate }"> 
    </div>

</div>
</form>
</body>
</html>