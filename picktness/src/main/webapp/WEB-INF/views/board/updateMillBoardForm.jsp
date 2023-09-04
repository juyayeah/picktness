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
width:70px;
height:70px;
margin-left:60px;
}
  </style>
  

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function backToList(obj){ 
obj.action = "${contextPath}/board/updateMillBoard.do";
obj.submit();
}

function fn_modify_article(obj){
obj.action = "${contextPath}/board/updateMillBoard.do";
obj.submit();
} 








form.appendChild(articleNOInput);
document.body.appendChild(form); 
form.submit();
}

var parentNOInput = document.createElement("input"); 
parentNOInput.setAttribute("type","hidden");
parentNOInput.setAttribute("name","parentNO");
parentNOInput.setAttribute("value",parentNO);

form.appendChild(parentNOInput);
document.body.appendChild(form); 
form.submit();
}
function readURL(input){
if (input.files && input.files[0]){
	var reader = new FileReader();
	reader.onload = function (e){
		$('#preview').attr('src',e.target.result);
	}
	reader.readAsDataURL(input.files[0]);
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


var cnt=1;

function back() {
    
    history.go(-1); 

}
var cnt=1;

function fn_addFile(){
	$("#dfile").append("<br>"+"<input type='file' name='file"+cnt+"' />");
	cnt++;
}

.btns del_btn{
	float:right;
}

document.addEventListener("DOMContentLoaded", function () {
    // "수정하기" 버튼 클릭 이벤트 핸들러
    document.getElementById("updateButton").addEventListener("click", function () {
        // 폼을 선택하고 제출
        var form = document.getElementById("myForm");
        form.submit();
    });
});
</script>
</head>
<body>
<div class ="mill_inner">
<h1>글 수정하기</h1>
<form name="frmboard" method="post" action="${contextPath}/board/updateMillBoard.do" enctype="multipart/form-data">
     
      <p><span style="font-size: 20px;">태그</span> <input  type="text" name="hastag" value="${board.hastag }" style="width: 80%; height: 30px; font-size: 17px;"></p>
      
      <p class="content"><span style="font-size: 20px;">내용</span> <textarea  style="margin-left: 5px" name="content" style="width: 80%; margin-bottom: 50px;">${board.content }</textarea></p>
    <table>
    
    <tr>
        <td>
        <input type ="hidden" name ="originalFileName" value="${board.todaymill_img }" />
        <img  class="image_pic" src="${contextPath}/download.do?cate=mill&imageFileName=${board.todaymill_img}&bno=${board.bno}" alt="이미지 설명">
        </td>
        <td colspan="3">
            <div class="file_list">
                <div>
                    <span class="file_input">
                        
                        <label> 첨부파일
                            <input type="file" name="todaymill_img" onchange="readURL(this);"/>
                        </label>
                     

                    </span>
                    </td>
                    <td>
                  <input type="hidden" name="bno" value="${board.bno}">
                    <span class= "btn_right">
                    <button type="button" onclick="back()" class="btns del_btn"><span>돌아가기</span></button>
                    <input class= "btn_margin" id="btn" type="submit"  class="btns fn_add_btn" value="수정하기">
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