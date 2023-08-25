<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    .free_inner {
        margin: 30px 0 0 30px;
    }
    .btn_right{
    float:right;
    }
    .p_right{
    float:right;
    /* margin-top:20px; */
    }

      .divider {
    border-top: 1px solid #ccc;
     margin-top: 10px; 
    margin-bottom: 20px;
  }
  

</style>
<title>자유게시판</title>
</head>
<body>
<div class=free_inner>
<h2>자유게시판</h2>
<span class="btn_right"><input  type="button" value="목록으로"><input  type="button" value="새글쓰기"></span>


<span>2023-08-21 ${board.freeDate}</span><span class="p_right"><b>dltk***** ${board.member_id }</b></span>
<span class=title>

<label>제목:</label><p>ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</p>
</span>
<hr>
<span class="content">
<label>내용</label><p>ㅏㅎ하하하하ㅏ</p>
</span>


</div>
</body>
</html>