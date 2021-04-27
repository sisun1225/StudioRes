<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입</h1>
<hr>
<form action="insert" method="post">
아이디 : <input type="text" name="guest_id"><br>
비밀번호 : <input type="password" name="guest_pw"><br>
이름 : <input type="text" name="guest_name"><br>
Phone : <input type="text" name="guest_phone"><br>
Email : <input type="text" name="guest_email"><br>
<input type="submit" value="입력하기">
</form>

</body>
</html>