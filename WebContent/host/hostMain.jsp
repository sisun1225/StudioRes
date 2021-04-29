<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>${host_name }님 환영합니다.</h1>
  <p>${host_id }</p>
  <p>${host_name }</p>
  <div>
    <a href="hostLogout">로그아웃</a>
  </div>
  <div>
    <a href="hostLogin">로그인</a>
    <a href="hostDetail">마이페이지</a>
    <a href="studioInsert">연습실등록</a>
    <a href="hostSearchStudio">연습실조회</a>
  </div>
   <hr>
   <div id="here">여기</div>
</body>
</html>