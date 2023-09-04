<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원가입</title>
<style>
    .main{
        text-align: center;
        padding: 30px;
    }
    
</style>
<body>
    <div class="main">
 <h1>회원가입</h1>
 
 <h2>픽트니스에 오신 것을 환영합니다!</h2>
 
 <h4>회원유형에 따라 서비스 이용에 차이가 있으니, 본인이 해당하는 회원유형을 선택해주세요.</h4>
<br>
 <div class="img">
    <a href='${contextPath}/member/join.do'><img src='https://ifh.cc/g/M0MyqS.png' border='0' style="padding-right: 25px;" width="250" height="250"></a>
    <a href='${contextPath}/member/bJoin.do'><img src='https://ifh.cc/g/CxjKyC.png' border='0'style="padding-left: 25px;" width="250" height="250"></a>
</div>

</div>
</body>
</html>
