<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>호스트 수정</h1>
  <form action="hostUpdate" method="post">
    아이디<input type="text" name="host_id" value="${host.host_id }" readonly="readonly">${host.host_id }<br>
    비밀번호<input type="password" name="host_pw" value="${host.host_pw }"><br>
    이름<input type="text" name="host_name" value="${host.host_name }"><br>
    핸드폰<input type="text" name="host_phone" value="${host.host_phone}"><br>
    이메일<input type="text" name="host_email" value="${host.host_email }"><br>
    <input type="submit" value="수정완료">
    <input type="reset" value="취소">
  </form>
</body>
</html>