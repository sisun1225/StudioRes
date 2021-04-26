<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <form action="hostLogin" method="post">
    <input type="text" name="host_id">
    <input type="text" name="host_pw">
    <input type="submit" value="로그인">
    <input type="button" value="뒤로가기" onclick="history.back(-1);">
  </form>
</body>
</html>