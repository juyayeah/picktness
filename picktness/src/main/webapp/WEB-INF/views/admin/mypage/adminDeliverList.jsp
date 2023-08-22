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
<title>배송관리</title>
<style>
.bodybody div {
	position: relative;
	max-width: 800px;
	margin: 0 auto;
	display: inline;
}

.bodybody a {
	background: transparent;
	text-decoration: none;
	color: inherit;
}

.bodybody ul {
	list-style: none;
}
.bodybody table {
	max-width: 900px;
	min-width: 600px;
  border-collapse: collapse;
}

 .bodybody th {
    background-color: #2890f1;
    color:#ffffff;
  }
.bodybody td {
	border: solid 1px #e7f3fd;
  }

.bodybody table th:first-child { 
  border-top-left-radius: 8px; 
}
.bodybody table th:last-child { 
  border-top-right-radius: 8px; 
}
.bodybody table td:first-child { 
  border-bottom-left-radius: 8px; 
}
.bodybody table td:last-child { 
  border-bottom-right-radius: 8px; 
}
        #btn1{
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            margin-right:-4px;
}            
        #btn2{
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;    
            margin-left:-3px;
        }
        #btn_group button{
            border: 1px solid #2890f1;
            background-color: rgba(0,0,0,0);
            color: #2890f1;
            padding: 0px;
        }
        #btn_group button:hover{
            color:white;
            background-color: #2890f1;
        }
    </style>
</head>
<body>
	<div class="bodybody">
<h2 align="center"> 상품 주문/결제 리스트</h2>
	<div>
	주문상태
				<select>
						<option value="전체" selected>전체</option>
						<option value="결제완료">결제완료</option>
						<option value="배송중">배송중</option>
						<option value="배송완료">배송완료</option>
						<option value="이용중">이용중</option>
						<option value="이용전">이용전</option>
						<option value="이용완료">이용완료</option>
						<option value="주문취소">주문취소</option>
						<option value="환불요청">환불요청</option>
						<option value="환불완료">환불완료</option>
				</select>
				조회기간<input name="search_date" type="date" size="40">~<input
					name="search_date" type="date" size="40">
				상세검색
				<select>
						<option value="전체" selected>전체</option>
						<option value="주문자번호">주문자번호</option>
						<option value="주문자">주문자</option>
						<option value="상품명">상품명</option>
						<option value="결제일">결제일</option>
						<option value="상태변경">상태변경</option>
				</select>
				<input type="text" placeholder="상세검색">
				    <div id="btn_group">
        <button id="btn2">검색</button></div>
</div>
<br>		
<div>총 #건</div>
<div><input type="button" value="상품등록"></div>
		<table>
			<tr>
				<th width="4%">주문번호</th>
				<th width="6%">주문자</th>
				<th width="2%"></th>
				<th width="10%">상품명</th>
				<th width="4%">결제금액</th>
				<th width="7%">취소/환불 금액</th>
				<th width="5%">결제일</th>
				<th width="7%">주문상태</th>
				<th width="7%">상태변경</th>
			</tr>
			<tr align="center">
				<td>#</td>
				<td>#</td>
				<td>#</td>
				<td>#</td>
				<td>#</td>
				<td>#</td>
				<td>#</td>
				<td><select>
						<option value="배송준비중">배송준비중</option>
						<option value="배송중">배송중</option>
						<option value="배송완료">배송완료</option>
						<option value="환불완료">환불완료</option>
				</select></td>
				<td><!--  $ (document).ready (function () { $ ("button").click (function () { $ ("환불승인").text ("수정불가!"); }); }); --></td>
			</tr>
		</table>
	</div>
</body>
</html>