<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib prefix="tiles"
uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>상품관리</title>
<script>
    var curdate = new Date(); 
    var rangeDate = new Date(curdate.getFullYear(), curdate.getMonth(), curdate.getDate() + 30);
    $(function () {
        $("#datepicker").ejDatePicker({
            value: curdate, 
            minDate: curdate,
            maxDate: rangeDate
            });
    });
    
    const subs = document.getElementById("subscriberBtn")

    subs.addEventListener("click", function() {
        if(subs.innerText === '답변대기') {
            subs.innerText = '답변완료';
        } else subs.innerText ='답변중';
    });

    function change() {
        const subs = document.getElementById('subscriberBtn');
        subs.innerText = '답변완료'
    }
    </script>
    <style>
    
      .bodybody {
        position: relative;
        max-width: 1100px;
        min-height: 120px;
        margin: 0 auto;
      }
      a {
        background: transparent;
        text-decoration: none;
        color: inherit;
      }
      ul {
        list-style: none;
      }
    table {
    width: 100%;
    border-collapse: collapse;
  }

  th {
    border: 1px solid #2890f1;
    background-color: #2890f1;
  }
  
  th td {
    border: 1px solid #2890f1;
  }
  
  </style>
</head>
<body>
<div class=bodybody>
<h2 align="center"> 상품 문의</h2>
<div>
<table border="0">
<tr>
<td>처리상태</td>
<td>
<select>
<option value="전체">전체</option>
<option value="답변대기" selected>답변대기</option>
<option value="답변완료">답변완료</option>
</select>
</td>
<td>조회기간</td>
<td></td>
<td></td>
<td><input name="search_date" type="date" size="40">~<input name="search_date" type="date" size="40"></td>
<td><input type="text" placeholder="검색내용을 입력해주세요">
<td><input type="submit" value="검색"></td>
</tr>
</table>
<!-- 검색창 테이블 끝 -->

<!-- 총 건수 테이블 시작 -->
<table border="0">
<tr align="center">
<td align="left"> 총 #건</td>
<td  colspan="6"></td>
<td align="right"><input type="button" value="상품등록"></td>
</tr>
</table>
<!-- 총 건수 테이블 끝 -->
<!-- 리스트 테이블 시작 -->
<table border="1">
<tr>
<th width="4%">상품번호</th>
<th width="7%">상품명</th>
<th width="4%">작성자ID</th>
<th width="10%">문의내용</th>
<th width="7%">등록일</th>
<th width="5%">처리상태</th>
</tr>
<tr align="center"  >
<td>#</td>
<td>#</td>
<td>#</td>
<td>#</td>
<td>#</td>
<td><a href="#" id="subscriberBtn" type="text" onclick='change()' >답변대기</a></td>
</tr>
</table>
<!-- 리스트 테이블 끝 -->
<table>
<div width="100%">
	<div width="48%" >
<table>
<tr>
<td>k</td>
</tr>
</table>
	</div>
	<div width="48%" >
<table>
<tr>
<td>작성일</td>
<td></td>
<td>답변일</td>
<td></td>
</tr>
</table>
	</div>
</div>
</table>
</div>
</div>

</body>
</html>