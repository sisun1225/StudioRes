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
  <nav id="nav">
<button type="button" onclick="location.href='hostDetail'">마이페이지</button>
<button type="button" onclick="location.href='studioInsert'">연습실등록</button>
<button type="button" onclick="location.href='hostSearchStudio'">연습실조회</button>
</nav>
  <h1>방 등록</h1>
  <form action="roomInsert" method="post" enctype="multipart/form-data">
    <input type="hidden" name="studio_no" value="${studio_no}">인서트페이지${studio_no}
    <input type="hidden" name="host_no" value="${host_no }">
    방이름<input type="text" name="room_name"><br>
    수용인원<input type="number" name="room_capacity"><br>
    방소개<textarea cols="30" rows="10" name="room_intro" wrap="hard"></textarea><br>
    가격<input type="number" name="room_price"><br>
    방사진<input type="file" name="room_picture"><br>
    <input type="submit" value="방등록">
    <input type="reset" value="취소">
  </form>
</body>
</html>