<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib prefix="tiles"
uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <script src="//code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=abeab8cce28d6c80ad107bfe4e602d58&libraries=services,clusterer,drawing"
    ></script>
    <style>
      body {
        width: 100%;
        margin: 0px auto;
        border: 0px solid #bcbcbc;
      }
      #header {
        position: relative;
        width: 100%;
        z-index: 20;
        background-color: #fff;
      }
      #content {
        width: 100%;
        border: 0px solid #bcbcbc;
      }
      #footer {
        clear: both;
      }
      #talk {
        position: fixed;
        right: 15px;
        bottom: 15px;
      }
      .not_modal {
        position: fixed;
        z-index: 99;
        left: 0;
        top: 0;
        background: rgba(0, 0, 0, 0.52);
        width: 100%;
        height: 100vh;
        visibility: hidden;
      }
      .modal_location {
        z-index: 100;
        background-color: white;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-left: -250px;
        margin-top: -250px;
        text-align: center;
        visibility: hidden;
      }
      .modal_map {
        z-index: 100;
        background-color: white;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-left: -250px;
        margin-top: -250px;
        text-align: center;
        visibility: hidden;
      }
      .modal_head {
        border-bottom: 1px solid #555;
      }
      .map-arrow {
        width: 23px;
        float: left;
        margin: 10px 50px 10px 10px;
      }
      .modal_title {
        display: inline-block;
        width: fit-content;
        padding: 10px;
        font-size: 20px;
        font-weight: bold;
      }
      .modal_title2 {
        display: inline-block;
        width: fit-content;
        padding: 10px;
        font-size: 20px;
        font-weight: bold;
      }
      .modal_fix {
        float: right;
        margin: 10px 10px 10px 0px;
      }
      #location_map {
        width: 500px;
        height: 500px;
      }
      #map_map {
        width: 500px;
        height: 500px;
      }
      .modal_search {
        background-color: white;
        padding: 10px;
      }
      #input_location {
        width: 100%;
        height: 100%;
        border: 0;
        padding: 0;
        background: transparent;
        outline: none;
      }
      input:focus {
        outline: none;
      }
    </style>
    <title><tiles:insertAttribute name="title"/></title>
  </head>
  <body>
    <div id="header">
      <tiles:insertAttribute name="header" />
    </div>
    <div id="content">
      <tiles:insertAttribute name="body" />
    </div>
    <div id="footer">
      <tiles:insertAttribute name="footer" />
    </div>
    <div id="talk">
      <tiles:insertAttribute name="talk" />
    </div>
    <div class="not_modal"></div>
  </body>
</html>
