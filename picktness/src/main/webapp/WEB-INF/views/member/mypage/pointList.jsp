<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib prefix="tiles"
uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <style>
      .point_inner {
        margin: 30px 0 0 30px;
      }
      .point_title {
        font-size: 20px;
        font-weight: bold;
      }
      .point_have {
        text-align: center;
      }
      .point_now {
        color: #2890f1;
        font-weight: bold;
        font-size: 27px;
      }
      .point_table {
        margin-top: 30px;
      }
      .point_option ul li {
        float: left;
        margin: 10px;
        font-size: 14px;
      }
      .point_list {
        text-align: center;
        width: 100%;
        border-collapse: collapse;
      }
      .point_list tr,
      .point_list td {
        padding: 10px;
      }
      .point_date,
      .point_content,
      .point_state,
      .point_change {
        border-top: 1px solid #555;
      }
      .point_date,
      .point_content,
      .point_state,
      .point_change {
        border-bottom: 1px solid #555;
      }
      .point_date {
        width: 15%;
      }
      .point_content {
        width: 55%;
      }
      .point_state {
        width: 15%;
      }
      .point_change {
        width: 15%;
      }
      #select_all,
      #select_add,
      #select_use {
        cursor: pointer;
      }
    </style>
    <script>
      $(function () {
        if (${option eq 'all'}) {
          $("#select_all").css("font-weight", "bold");
        } else if(${option eq 'add'}){
          $("#select_add").css("font-weight", "bold");
        } else if(${option eq 'use'}){
          $("#select_use").css("font-weight", "bold");
        }
      });
    </script>
    <title>회원 정보 수정창</title>
  </head>
  <body>
    <div class="point_inner">
      <div class="point_title">포인트</div>
      <div class="point_have">
        보유 포인트<br /><span class="point_now">${member.memberPoint}</span>
      </div>
      <div class="point_table">
        <div class="point_option">
          <ul>
            <li
              id="select_all"
              onclick="location.href='${contextPath}/member/mypage/pointList.do?option=all'"
            >
              전체내역
            </li>
            <li
              id="select_add"
              onclick="location.href='${contextPath}/member/mypage/pointList.do?option=add'"
            >
              적립내역
            </li>
            <li
              id="select_use"
              onclick="location.href='${contextPath}/member/mypage/pointList.do?option=use'"
            >
              사용내역
            </li>
          </ul>
        </div>
        <div class="point_line"></div>
        <table class="point_list">
          <tr>
            <td class="point_date">날짜</td>
            <td class="point_content">내용</td>
            <td class="point_state">적립/사용</td>
            <td class="point_change">변동 포인트</td>
          </tr>
          <c:choose>
            <c:when test="${empty pointList}">
              <td colspan="4">포인트 적립 사용 내역이 없습니다.</td>
            </c:when>
            <c:otherwise>
              <c:forEach var="point" items="${pointList}">
                <tr>
                  <td>${point.pointDate}</td>
                  <td>${point.content}</td>
                  <td>${point.state}</td>
                  <td>${point.member_point}</td>
                </tr>
              </c:forEach>
            </c:otherwise>
          </c:choose>
        </table>
      </div>
    </div>
  </body>
</html>
