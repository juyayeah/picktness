<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>kevinet</title>
<meta http-equiv=”Content-Type” content=”text/html; charset=utf-8”>
</head>

<body>
<p>라디오박스 동적 제어</p>
<input type="button" id="btn1" name="btn1" value="추가">
<input type="button" id="btn2" name="btn2" value="마지막 라디오박스 삭제">
<input type="button" id="btn3" name="btn3" value="전체삭제">
<input type="button" id="btn4" name="btn4" value="박스선택입력체크">
<input type="button" id="btn5" name="btn5" value="전체체크선택">
<input type="button" id="btn6" name="btn6" value="전체체크해제">
<input type="button" id="btn7" name="btn7" value="체크여부확인후전체바꾸기">
<div id="div_chk">
 
<!--     <span>0</span><input type="checkbox" id="id_chk" class="class_chk" name="chk0" value="0"> -->
<!--     <span>1</span><input type="checkbox" id="id_chk" class="class_chk" name="chk1" value="1"> -->
 
 
</div>
<script type="text/javascript">
    $(document).ready(function(){
        
        // 추가
        var i = 0;
        $("#btn1").on("click", function() {
            i = $("#div_chk > #id_chk").length;
            console.log(i);
            $("#div_chk").append("<span id='span_chk'>"+i+"</span><input type='radio' id='id_chk' class='class_chk' name='chk"+i+"' value='"+i+"'>");
        });
        
        // 마지막 순번 삭제
        $("#btn2").on("click", function() {
            i = $("#div_chk > #id_chk").length - 1;
            console.log(i);
            $("#div_chk > #id_chk").eq(i).remove();
            $("#div_chk > #span_chk").eq(i).remove();
        });
        
        // 전체삭제
        $("#btn3").on("click", function() {
            $("#div_chk").empty();
        });
        
        // 박스선택입력체크
        $("#btn4").on("click", function() {
            i = $("#div_chk > #id_chk").length-1;
            console.log(i);
            if(i < 0){
                alert("라디오박스가 존재 하지 않습니다.");
                return;
            }
            
            let num = prompt("체크하고 싶은 라디오박스 숫자 입력!", "숫자만 입력해주세요!");
            
            var regexp = /^[0-9]*$/
            var temp = num;
            
            if(num > i){
                alert("라디오박스가 존재 하지 않습니다.");
                return;
            }
            if(!regexp.test(temp)){
                alert("숫자만 입력하세요");
                return;
            }
            
            $("input:radio[name='chk"+num+"']").prop("checked",true);
            
        });
        
        // 전체선택
        $("#btn5").on("click", function() {
            i = $("#div_chk > #id_chk").length-1;
            console.log(i);
            if(i < 0){
                alert("라디오박스가 존재 하지 않습니다.");
                return;
            }
            
            $("#div_chk > #id_chk").prop("checked",true);
        });
        
        // 전체해제
        $("#btn6").on("click", function() {
            i = $("#div_chk > #id_chk").length-1;
            console.log(i);
            if(i < 0){
                alert("라디오박스가 존재 하지 않습니다.");
                return;
            }
            
            $("#div_chk > #id_chk").prop("checked",false);
        });
        
        // 체크여부확인후전체바꾸기
        $("#btn7").on("click", function() {
            i = $("#div_chk > #id_chk").length-1;
            console.log(i);
            if(i < 0){
                alert("라디오박스가 존재 하지 않습니다.");
                return;
            }
            
            if($("#div_chk > #id_chk").is(":checked")){
                $("#div_chk > #id_chk").prop("checked",false);
                $("#div_chk > #id_chk").removeClass("readonly");
            }else{
                $("#div_chk > #id_chk").prop("checked",true);
                $("#div_chk > #id_chk").addClass("readonly");
            }
            
        });
        
        
        
    });
</script>
</body>
</html>