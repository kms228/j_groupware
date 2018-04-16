<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="<c:url value='/resources/css/login'/>">
 <style type="text/css">
 
 </style>
</head>
<body>
<H1>로그인</H1> 

<form action="<c:url value='/'/>login" method="post"><br>
<label>아이디<input type="text" name="ACNT_ID"></label><br>

<label>비밀번호<input type="password" name="ACNT_PWD"></label><br>

<label><input type="submit" value="로그인"></label><br>
</form>



아이디 비밀번호 찾기 기능<br> 
가입하기 기능 (아이디,비번,이름)(사원번호,가입일/직위번호/부서번호/팀번호 자동으로 제일낮은단계로 가입됨)(후에 관리자가 승인해야함??)<br>
<!--<a href="<c:url value='resources/login/join'/>">회원가입하기</a>-->
<a href="<c:url value='/join'/>">회원가입하기</a>

</body>

</html>

