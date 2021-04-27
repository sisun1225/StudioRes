<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인 페이지</h1>
<hr>
<form action=login method="post">
아이디 : <input type="text" name="guest_id"><br>
비밀번호 : <input type="password" name="guest_pw"><br>
<input type="submit" value="로그인">
<br>
<button type="button" onclick="location.href='insert'">회원가입</button>
</form>
</body>
</html>