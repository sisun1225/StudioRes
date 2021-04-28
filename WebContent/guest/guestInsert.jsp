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

<form action="insert" method="post">
아이디 : <input type="text" name="guest_id"><br>
비밀번호 : <input type="password" name="guest_pw"><br>
이름 : <input type="text" name="guest_name"><br>
Phone : <input type="text" name="guest_phone"><br>
Email : <input type="text" name="guest_email"><br>
<input type="submit" value="입력하기">
</form>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>