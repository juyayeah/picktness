<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value = "${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘식단 글쓰기</title>

  <style>
   .board_inner {
        position: relative;
        width: 1100px;
        margin: 0 auto;
      }
      .file-label {
  margin-top: 30px;
  background-color: #5b975b;
  color: #fff;
  text-align: center;
  padding: 10px 0;
  width: 65%;
  border-radius: 6px;
  cursor: pointer;
}
.file {
  display: none;
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
.span1{
float:right;
}
  </style>
  

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
var cnt=1;
function fn_addFile(){
	$("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
	cnt++;
}
function back() {
    
    history.go(-1); 

}


</script>
</head>
<body>
<div class ="board_inner">
<h1>글쓰기</h1>
<form method="post" action="${contextPath}/upload" enctype="multipart/form-data">
      <p><span style="font-size: 20px;">제목</span> <input type="text" placeholder="제목을 입력해 주세요." name="title" style="width: 80%; height: 30px; font-size: 17px;"></p>
      <p class="content"><span style="font-size: 20px;">내용</span> <textarea style="margin-left: 5px;" placeholder="내용을 입력해 주세요." name="content" style="width: 80%; margin-bottom: 50px;"></textarea></p>
      <p class="center"> <button class="btn" type="button" onclick="back()" style="margin-right: 10px;">돌아가기</button></p>
<div id="root">
  <h2 class="title">File Upload</h2>
  <hr>
  <div class="contents">
    <div class="upload-box">
      <div id="drop-file" class="drag-file">
        <img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image" >
        <p class="message">Drag files to upload</p>
        <img src="" alt="미리보기 이미지" class="preview">
      </div>
      <label class="file-label" for="chooseFile">Choose File</label>
      <input class="file" id="chooseFile" type="file" onchange="dropFile.handleFiles(this.files)" accept="image/png, image/jpeg, image/gif">
    </div>
  </div>
</div>
</form>
</div>
</body>
</html>