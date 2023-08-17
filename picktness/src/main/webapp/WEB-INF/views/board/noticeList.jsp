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
        table {
            width: 100%;
           border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h1>공지사항</h1>
    <table>
        <thead>
            <tr>
                <th>날짜</th>
                <th>제목</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>2023-08-16</td>
                <td>서비스 업데이트 예정입니다.</td>
            </tr>
            <tr>
                <td>2023-08-14</td>
                <td>새로운 기능이 추가되었습니다.</td>
            </tr>
            <tr>
                <td>2023-08-12</td>
                <td>주요 이벤트가 시작됩니다.</td>
            </tr>
        </tbody>
    </table>
</body>
</html>