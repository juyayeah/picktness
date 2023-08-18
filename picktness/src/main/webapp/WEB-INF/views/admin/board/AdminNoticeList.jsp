<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <style>
              .notice_inner {
        position: relative;
        width: 1100px;
        margin: 0 auto;
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
    /* margin-top: 10px; */
    margin-bottom: 20px;
  }
  .searchBox{
  margin-top:10px;
  margin-bottom:20px;
  }
  
  table th,table td {
	border-left: none;
	border-right: none;
	}
	.notic_name{
	font-size: 8px;
  color:darkgrey
	}
  .notice_btn{
float: right;

  }
  notice_margin{
    margin-top:20px;
  }
  
    </style>
</head>
<body>
    <div class="notice_inner">
    <h1>공지사항</h1>
    
<div class="divider"></div>
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
      </s_sidebar_element>
    <table>
        <thead>
            <tr>
                <th>순번</th>
                <th>제목</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td>서비스 업데이트 예정입니다.<div class="notic_name">픽트니스|2023-08-18</div> </td>
            </tr>
            <tr>
                <td>2</td>
                <td>새로운 기능이 추가되었습니다.<div class="notic_name">픽트니스|2023-08-18</div></td>
            </tr>
            <tr>
                <td>3</td>
                <td>주요 이벤트가 시작됩니다.<div class="notic_name">픽트니스|2023-08-18</div></td>
            </tr>
            <tr>
              <td>4</td>
              <td>서비스 업데이트 예정입니다.<div class="notic_name">픽트니스|2023-08-18</div> </td>
          </tr>
          <tr>
              <td>5</td>
              <td>새로운 기능이 추가되었습니다.<div class="notic_name">픽트니스|2023-08-18</div></td>
          </tr>
          <tr>
              <td>6</td>
              <td>주요 이벤트가 시작됩니다.<div class="notic_name">픽트니스|2023-08-18</div></td>
          </tr>
        </tbody>
    </table>
  
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
    <span class="notice_btn"><input type="submit" value="등록하기">
    </span>
  </div>
</div>

</body>
</html>