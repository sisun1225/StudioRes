<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1>관리자 로그인</h1>
<div id="container">
	<form id="myfrm" action="adminLoginChk" method="post">
	<fieldset>
	<legend>로그인</legend>
	<label>아이디</label>
	<input type="text" name="adminid"><br>
	<label>비밀번호</label>
	<input type="password" name="adminpw"><br>
	<input type="submit" value="로그인">
	</fieldset>
	</form>
</div>
</body>
</html>