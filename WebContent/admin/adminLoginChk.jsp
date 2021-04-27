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
 <h1>관리자 로그인 페이지</h1>
 <form action = "adminLoginChk" method="post">
  ID : <input type="text" name="adminid"><br>
  PW : <input type="text" name="adminpw"><br>
  <input type="submit" value="로그인하기">
 </form>
</body>
</html>