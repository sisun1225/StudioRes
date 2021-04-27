<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>로그인페이지</h1>
  <form action="hostLogin" method="post">
    <input type="text" name="host_id">
    <input type="password" name="host_pw">
    <input type="submit" value="로그인">
    <input type="reset" value="취소">
  </form>
  
  <p><a href="hostInsert">회원가입</a></p>
</body>
</html>