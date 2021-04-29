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
  <jsp:include page="../common/hostHeader.jsp"></jsp:include>
<div id="container">
<form action="hostLogin" method="post">
<fieldset>
<legend>로그인</legend>
<label>아이디</label>
<input type="text" name="host_id"><br>
<label>비밀번호</label>
<input type="password" name="host_pw"><br>
<input type="submit" value="로그인">
<button type="button" onclick="location.href='hostInsert'">회원가입</button>
</fieldset>
</form>
</div>
</body>
</html>