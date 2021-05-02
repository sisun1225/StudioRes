<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div id="container">
<form id="myfrm" action=login method="post">
<fieldset>
<legend>로그인</legend>
<label>아이디</label>
<input type="text" name="guest_id"><br>
<label>비밀번호</label>
<input type="password" name="guest_pw"><br>
<div id="inputBtn">
<input type="submit" value="로그인">
<button type="button" onclick="location.href='insert'">회원가입</button>
</div>
</fieldset>
</form>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>