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
<title>Insert title here</title>
<style>
div {
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
em {
font-size : 15px;
color: #2890f1;
font-weight: 800;
}
tr th:first-child { 
  border-top-left-radius: 10px; 
  border-bottom-left-radius: 10px; 
}
  
tr td:first-child { 
 }
tr td:last-child { 
  border-top-right-radius: 10px; 
  border-bottom-right-radius: 10px; 
}


  th {
  	width: 10%;
    background-color: #2890f1;
    color:#ffffff;
  }
td {
  padding: 10px;
  width: 10%;
  background-color: #fff;
  border: solid 1px #e7f3fd;
}

table {
	max-width: 800px;
	min-width: 600px;
  border-collapse: collapse;
}
  /*   table {
	max-width: 800px;
	min-width:600px;
    border-collapse: collapse;
  }
  tr {
    border: 0;
    
    display: block;
}
.solid {
    border: 1px #2890f1 solid;
    border-radius: 10px;
}

  
  td {
    width: 10%;
    padding: 5px;
  }
 */  b {
  color:#2089f1;
  font-size: 20px
  }
.td_first{
width: 20%;
align: right;
}
.td_second{
width: 5%;
}
.td_third{
width: 40%;
align: left;
size: 40px;
}
</style>
</head>
<body>
<div>
<h2 align="center"> 상품 주문/결제관리</h2>
<figure>
<figcaption>
<p>거래현황(당일)</p>
</figcaption>
<table>
<tr class="solid">
<th>신규주문</th>
<td align="right"><a href="#"><b>2</b></a>건</td>
<th>취소완료</th>
<td align="right"><a href="#"><b>{#}</b></a>건</td>
<th>환불요청</th>
<td align="right"><a href="#"><b>{#}</b></a>건</td>
<th>환불완료</th>
<td align="right"><a href="#"><b>{#}</b></a>건</td>
</tr>
</table>

<figcaption>
<p>주문/배송
<span>조회기간<input name="search_date" type="date" size="40">~<input name="search_date" type="date" size="40"><input type="button" value="검색"></span></p>
</figcaption>
<table>
<tr class="solid">
<th>배송준비</th>
<td align="right"><a href="#"><b>{#}</b></a>건</td>
<th>배송중</th>
<td align="right"><a href="#"><b>{#}</b></a>건</td>
<th>배송완료</th>
<td align="right"><a href="#"><b>{#}</b></a>건</td>
<th></th>
<td></td>
<!-- <th></th>
<td align="right"><a href="#"><b>2</b></a>건</td> -->
</tr>
</table>
<figcaption>
<p>거래현황
<span>조회기간<input name="search_date" type="date" size="40">~<input name="search_date" type="date" size="40"><input type="button" value="검색"></span></p>
</figcaption>
<table class="solid">
<tr>
<th>결제완료</th>
<td align="right"><a href="#"><b>2</b></a>건</td>
<th>환불요청</th>
<td align="right"><a href="#"><b>{#}</b></a>건</td>
<th>환불완료</th>
<td align="right"><a href="#"><b>{#}</b></a>건</td>
<th>취소완료</th>
<td align="right"><a href="#"><b>{#}</b></a>건</td>
</tr>
<tr>
<th>배송</th>
<td align="right"><a href="#"><b>2</b></a>건</td>
<th>사업장정산</th>
<td align="right"><a href="#"><b>{#}</b></a>건</td>
<th>계</th>
<td align="right"><a href="#"><b>{#}</b></a>건</td>
<th></th>
<td align="right"><a href="#"><b>{#}</b></a>건</td>
</tr>
</table>
</figure>

</div>

</body>
</html>