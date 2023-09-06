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
            frm.action = "${contextPath}/board/modNotice.do";
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
  <h1 style="margin-bottom: 5px;">공지사항 수정</h1>
  <div class="divider"></div>
  <h2 class="center" style="margin-right: 120px;">공지사항 수정</h2>
  
  
      <p><span style="font-size: 20px;">제목</span> 
      <input type="text" value="${noticeList.title }" name="title" style="width: 80%; height: 30px; font-size: 17px;"></p>
      <p class="content"><span style="font-size: 20px;">내용</span> 
      <textarea style="margin-left: 5px;" name="content" style="width: 80%; margin-bottom: 50px;">${noticeList.content}</textarea></p>
      <p class="center"> 
      <input type="button" id="edit" value="수정하기">
      <a class="btn" type="button" href="${contextPath }/board/noticeList.do" style="margin-right: 10px;">돌아가기</a></p>
    
       <input type="hidden" name="bno" value="${noticeList.bno }">
    <input type="hidden" name="noticedate" value="${noticeList.noticeDate }"> 
    </div>

</div>
</form>
</body>
</html>