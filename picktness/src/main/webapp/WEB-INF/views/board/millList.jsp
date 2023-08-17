<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% 
request.setCharacterEncoding("utf-8"); 
%>
<!DOCTYPE html>
<html>
<head>
    <title>오늘식단</title>
    <style>
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 20px;
            padding: 10px;
        }
        .sort-and-write {
            display: flex;
            align-items: center;
        }
        .sort-text {
            margin-right: 10px;
        }
        .write-button {
            background-color: #007bff;
            color: #fff;
            padding: 5px 10px;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }
        .separator {
            border-top: 1px solid #ccc;
            margin: 20px 0;
        }
        .image-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .image-item {
            width: 30%;
            margin-bottom: 20px;
        }
        .paging {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>오늘식단</h1>
        <div class="sort-and-write">
            <span class="sort-text">최신순 | 오래된순</span>
            <button class="write-button">글쓰기</button>
        </div>
    </div>
    <div class="separator"></div>
    <div class="image-list">
        <div class="image-item">
            <img src="images/food.png" alt="Image 1">
        </div>
        <div class="image-item">
            <img src="images/food.png" alt="Image 2">
        </div>
        <div class="image-item">
            <img src="images/food.png" alt="Image 3">
        </div>
        <div class="image-item">
            <img src="images/food.png" alt="Image 4">
        </div>
        <div class="image-item">
            <img src="images/food.png" alt="Image 5">
        </div>
        <div class="image-item">
            <img src="images/food.png" alt="Image 6">
        </div>
         <div class="image-item">
            <img src="images/food.png" alt="Image 4">
        </div>
        <div class="image-item">
            <img src="images/food.png" alt="Image 5">
        </div>
        <div class="image-item">
            <img src="images/food.png" alt="Image 6">
        </div>
    </div>
    <div class="paging">
        <button>1</button>
        <button>2</button>
        <button>3</button>
        <button>4</button>
        
    </div>
</body>
</html>