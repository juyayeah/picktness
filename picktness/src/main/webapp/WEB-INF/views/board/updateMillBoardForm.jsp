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
<title>글 수정하기</title>

  <style>
    .mill_inner{
    margin:30px 0 0 30px;
    }
      
      .file_input{
        margin-left: 50px;
      
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
.image_pic{
width:100px;
height:100px;
margin-left:60px;
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
    .button1{
    padding: 15px 15px;
    background-color: #007BFF;
    color: #fff;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
    width :100px;
    height:51px;
    margin-bottom:50px;
  }
  
  </style>
  

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
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
<div class ="mill_inner">
<h1>글 수정하기</h1>
<form name="frmboard" method="post" action="${contextPath}/board/updateMillBoard.do" enctype="multipart/form-data">
     
      <p><span style="font-size: 20px;">태그</span> 
      <input  type="text" name="hastag" value="${board.hastag }" style="width: 80%; height: 30px; font-size: 17px;"></p>
      
      <p class="content"><span style="font-size: 20px;">내용</span> <textarea  style="margin-left: 5px" name="content" style="width: 80%; margin-bottom: 50px;">${board.content }</textarea></p>
    <table>
    
    <tr>
        <td>
        <input type ="hidden" name ="originalFileName" value="${board.todaymill_img }" />
      
        <img class="image_pic" id="preview" src="${contextPath}/download.do?cate=mill&imageFileName=${board.todaymill_img}&bno=${board.bno}" width=100 height =100 />
        <input type="file" name="todaymill_img" onchange="readURL(this);">
        </td>
        <td colspan="3">
            <div class="file_list">
                <div>
                    <span class="file_input">

                       <!--  <label> 첨부파일
                            <input type="file" name="todaymill_img" onchange="readURL(this);"/>
                        </label> -->
                  

                    </span>
                    </td>
                    <td>
                  <input type="hidden" name="bno" value="${board.bno}">
                    <span class= "btn_right">
                    <a class="button" href="${contextPath}/board/millBoardList.do">목록으로</a>
                    <input class="button1" class= "btn_margin" id="btn" type="submit"  class="btns fn_add_btn" value="수정하기">
                  </span>
                  </div>
            </div>
        </td>
    </tr>
    </table>
<div id="root"></div>
</form>
</div>
</body>
</html>