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
      
      .file_input{
        margin-left: 50px;
      
      }
        .button {
    padding: 15px 15px;
    background-color: #007BFF;
    color: #fff;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
    width :100px;
    height:51px;
    margin-top:12px;
    
  }



.btn_right {
float:right; 
margin-right:0px;


}
.btn_margin{

  /* margin-right:150px; */
}
#file {
  display: none;
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
.file_list{
float:right;
}
  </style>
  

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
function readURL(input){
	if (input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload = function (e){
			$('#preview').attr('src',e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}
$(function() {
    $('#btn').click(function() {
        if ($("#title").val() === '' || $("textarea[name='content']").val() === '') {
            alert("제목과 내용을 입력하세요.");
            return false; 
        }

        
        var fileInput = $("input[type='file'][name='files']");
        if (fileInput.get(0).files.length === 0) {
            alert("이미지를 첨부하세요.");
            return false; 
        }
    });
});





</script>
</head>
<body>
<div class ="board_inner"></div>
<h1>글쓰기</h1>
<form method="post" action="${contextPath}/board/addMillBoard.do" enctype="multipart/form-data">
     
      <p><span style="font-size: 20px;">태그</span> <input  type="text" name="hastag" placeholder="#오운완 #오늘식단" name="title" style="width: 80%; height: 30px; font-size: 17px;"></p>
      <p class="content"><span style="font-size: 20px;">내용</span> <textarea  style="margin-left: 5px;" placeholder="내용을 입력해 주세요." name="content" style="width: 80%; margin-bottom: 50px;"></textarea></p>
    <table>
    <tr>
        
        <td colspan="3">
            <div class="file_list">
                <div>
                    <span class="file_input">
                       <img id="preview" src="#" width=100 height =100 />
                        <label> 첨부파일
                            <input type="file" name="todaymill_img" onchange="readURL(this);" />
                        </label>
                    </span>
                    </td>
                    <td>
                    <span class= "btn_right">
                    <a href="${contextPath}/board/millBoardList.do" type="button" class="button" onclick="back()" class="btns del_btn" >돌아가기</a>
                    <button class= "button" id="btn" type="submit" ><span>등록하기</span></button>
                  </span>
                  </div>
            </div>
        </td>
    </tr>
    </table>
<div id="root">
</div>
</form>
</body>
</html>