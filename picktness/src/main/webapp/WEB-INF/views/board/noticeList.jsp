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
    

         
        function fn_delBtn() {
            if ($("input:checkbox[name='Chk_list']:checked").length === 0) {
                alert("삭제할 항목을 선택해 주세요.");
                return;
            }
	var info2 = [];
            $("input:checkbox[name='Chk_list']:checked").each(function(k, kVal) {

                var info = $(this).val();
                
                info2.push(info);
               
           
            });
            console.log(info2);
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
  color: #fff; /* 텍스트 색상을 흰색으로 설정 */
  padding: 10px 20px; /* 버튼 패딩 설정 */
  text-decoration: none; /* 링크 텍스트 밑줄 제거 */
  border-radius: 5px; /* 버튼 모서리 둥글게 만들기 */
  margin-right:10px;
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

  </c:if>
    <table>
        <thead>
            <tr>
<%--             <c:if test="${member.id == 'admin' }"> 
            <td class="td_size"><input id="allCheck" type="checkbox" name="allCheck"/></td>
            </c:if>  --%>
                <th class="td_size">순번</th>
                <th>제목</th>

                
            </tr>
        </thead>
        <tbody>
            <c:forEach var ="notice" items="${noticeList}" varStatus="num">
            <tr>
<%--             <c:if test="${member.id == 'admin' }"> 
            <td><input type="checkbox" name="RowCheck" value="${notice.bno}"></td>
            </c:if> --%>
                <td>${fn:length(noticeList) - num.index }</td>
                <td><a  href="${contextPath}/board/noticeDetail.do?bno=${notice.bno}">${notice.title}</a><div class="notic_name">픽트니스|${notice.noticeDate }</div> </td>
            </tr>
             </c:forEach>

        </tbody>
    </table>
       <s_sidebar_element>
        <div class="searchBox">
          <s_search>
            <input
              type="text"
              name=""
              value=""
              onkeypress="if (event.keyCode == 13) { }"
              class="text"
              placeholder="SEARCH"
            />
            

            <input value="검색" type="button" onclick="" class="submit" />
          </s_search>
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