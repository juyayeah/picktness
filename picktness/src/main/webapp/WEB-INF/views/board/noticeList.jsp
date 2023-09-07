<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
    <script type="text/javascript">
    $(function(){
        $("#allCheck").click(function(){
            if($("#allCheck").is(":checked")){
              $("input[name=RowCheck]").prop("checked", true);
            
            }else {
              $("input[name=RowCheck]").prop("checked", false);
            }
          });
        
        $("input[name=RowCheck]").click(function(){
            var totalArr = $("input[name=RowCheck]").length;
            var checked = $("input[name=RowCheck]:checked").length;
            
            if(totalArr != checked){
              $("#allCheck").prop("checked", false);
            }else{
              $("#allCheck").prop("checked", true);
            }
          });
        
    })
    

         
        function fn_delBtn() {
            if ($("input:checkbox[name='RowCheck']:checked").length === 0) {
                alert("삭제할 항목을 선택해 주세요.");
                return;
            }
			var info2 = new Array();
            $("input:checkbox[name='RowCheck']:checked").each(function(index) {

                var info = $(this).val();
				info2.push(info);
            });
         	 console.log(info2);
             $.ajax({
             	type : "POST",
             	url : "${contextPaht}/board/delNotice.do",
             	data:{
             		bnoList : info2
             	},
             	traditional: true,
             	success: function(data){
             		location.href=data;
             	},
             	error: function(xhr,status,error){
             		
             		alert("실패");
             	}
             });
        }
    
 
        
        
    </script>
    <style>
    .mill_inner{
    margin:30px 0 0 30px;
    }
        table {
            width: 100%;
           border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        .divider {
    border-top: 1px solid #ccc;
    
    margin-bottom: 20px;
  }
  .searchBox{
  margin-top:10px;
  
  }
  
  table th,table td {
	border-left: none;
	border-right: none;
	}
	.notic_name{
	font-size: 8px;
  color:darkgrey
	}

.right_a {
  float: right;
  background-color: #007BFF;
  color: #fff;
  padding: 10px 20px;
  text-decoration: none;
  border-radius: 5px;
  margin-right: 10px;
}

.right_a:hover {
  background-color: #0056b3;
}
  .td_size{
  width:100px;
  }
  
    </style>
</head>
<body>
<form name="userForm">
    <div class="mill_inner">
    <h1>공지사항</h1>
    
<c:if test="${member.id == 'admin' }"> 
<a type="button"class="right_a" href="${contextPath}/board/noticeForm.do">글쓰기</a>
 <a class="right_a" href="javascript:fn_delBtn()">선택 삭제</a>

  </c:if>
    <table>
        <thead>
            <tr>
             <c:if test="${member.id == 'admin' }"> 
            <td class="td_size"><input  type="checkbox" id="allCheck"/></td>
            </c:if> 
                <th class="td_size">순번</th>
                <th>제목</th>

                
            </tr>
        </thead>
        <tbody>
            <c:forEach var ="notice" items="${noticeList}" varStatus="num">
            <tr>
            <c:if test="${member.id == 'admin' }"> 
            <td><input type="checkbox" name="RowCheck" value="${notice.bno}"></td>
            </c:if> 
                <td>${fn:length(noticeList) - num.index }</td>
                <td><a  href="${contextPath}/board/noticeDetail.do?bno=${notice.bno}">${notice.title}</a><div class="notic_name">픽트니스|${notice.noticeDate }</div> </td>
            </tr>
             </c:forEach>

        </tbody>
    </table>

 <div class="searchBox">
  <s_search>
    <input type="text" name="searchQuery" 
      value=""
      class="text"
      placeholder="SEARCH"
    />
    <input type="button" value="검색" onclick="performSearch()" class="submit" /> <!-- 검색 버튼 추가 -->
  </s_search>
</div>
        </div>
    <div class="notice_margin">
      <select> 
      <option>일주일</option>
      <option>한달</option>
      <option>세달</option>
      <option>전체</option>
      </select>
      <select>
        <option>제목</option>
        <option>내용</option>
    </select>
  
  </div>
</div>
</form>
</body>
</html>