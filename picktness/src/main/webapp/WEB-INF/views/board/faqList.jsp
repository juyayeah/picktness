<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% 
request.setCharacterEncoding("utf-8"); 
%>
<!DOCTYPE html>
<html lang="en">
  <head>
  
    <style>
      .faq_inner {
    
    margin:30px 0 0 30px;
    }
    
      
      .layout {
        max-width: 600px;
        margin: 0 auto;
      }

      .qna {
        list-style: none;
        margin: 0;
        padding: 0;
      }
      .qna > li {
        padding: 10px 0;
        box-sizing: border-box;
      }
      .qna > li:nth-child(n + 2) {
        
        border-top: 1px dashed #aaa;
      }
      .qna input {
        display: none;
      }

      .qna label {
       
        font-weight: bold;
        color: #000;
        margin: 20px 0 0;
        cursor: pointer;
      }
      .qna label::before {
        /* 제목 앞 화살표 */
        display: block;
        content: "";
        width: 0;
        height: 0;
        border: 8px solid transparent;
        border-left: 8px solid #a00;
        margin: 2px 0 0 8px;
        float: left;
      }
      .qna input:checked + label::before {
        /* 내용 펼침 상태 제목 앞 화살표 */
        border: 8px solid transparent;
        border-top: 8px solid #a00;
        border-bottom: 0;
        margin: 8px 4px 0;
      }

      .qna div {
        /* 내용 영역 - 기본 감춤 상태 */
        display: none;
        color: #666;
        font-size: 0.9375em;
        overflow: hidden;
        padding: 10px 0 10px 30px;
        box-sizing: border-box;
        transition: max-height 0.4s;
      }
      .qna input:checked + label + div {
        /* 내용 영역 펼침 */
        display: block;
        
      }
      .divider {
        border-top: 1px solid #ccc;
        margin-top: 20px;
        margin-bottom: 20px;
      }
      .faq_bgc pre {
        background-color: aliceblue;
        word-break
      }
      .button2 {
        float: right;
        background-color: #50aae6;
        color: white;
        border-radius: 10px;
        padding: 15px;
        min-height: 30px;
        min-width: 120px;
      }
      .right_a {
  float: right; 
  background-color: #007BFF;
  color: #fff; /* 텍스트 색상을 흰색으로 설정 */
  text-decoration: none; /* 링크 텍스트 밑줄 제거 */
  border-radius: 5px; /* 버튼 모서리 둥글게 만들기 */
  
  margin-right:10px;
     padding: 5px 10px;
    border: 1px solid black;
    color:black;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
    margin:0 10px 5px 0;
    border-radius: 5px; /* 버튼 모서리 둥글게 만들기 *
  }
        .faq_btn{

        float:right;
    padding: 5px 10px;
    /* background-color: #007BFF; */
    /* color: #fff; */
     

    border: 1px solid black;
    color:black;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
    margin:0 10px 5px 0;
    border-radius: 5px; /* 버튼 모서리 둥글게 만들기 */
      }
        .faq_btn:hover {
    background-color: #0056b3;
  }
  
    </style>
    
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
      integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="style.css" />
    <title>FAQ</title>
  </head>
  <body>
  
    <div class="faq_inner">
      <h2>자주묻는 FAQ</h2>
      <s_sidebar_element>
        <div id="searchBox">
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
            <c:if test="${member.id == 'admin' }"> 
<a type="button"class="right_a" href="${contextPath}/board/faqForm.do">글쓰기</a>
</c:if>
          </s_search>
        </div>
      </s_sidebar_element>
      <div class="divider"></div>
<c:forEach var="faq" items="${faqList}" varStatus="loop">
  <ul class="qna">
    <li>
      <input type="checkbox" id="qna-${loop.index}" />
      <label for="qna-${loop.index}">${faq.title}  <c:if test="${member.id == 'admin' }"> 
        <a type="button" class="faq_btn" href="${contextPath}/board/deleteFaq.do?bno=${faq.bno}">삭제하기</a>
        <a type="button" class="faq_btn" href="${contextPath}/board/modFaqForm.do?bno=${faq.bno}">수정하기</a>
      </c:if></label> 
      <div class="faq_bgc">
        <pre>${faq.content}</pre>
      </div>
    
    </li>
  </ul>
  <hr />
</c:forEach>


      <div class="divider"></div>
     
    </div>
  </body>
</html>
