<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	$("#hostAll").on("click",function(){
		$("#content").load(".jsp");
	});
})
</script>
</head>
<body>
<h1>관리자 페이지</h1>
<ul>
  <li id="hostAll">전체호스트조회</li>
  <li id="guestAll">전체게스트조회</li>
  <li id="roomAll">전체방조회</li>
  <li id="studioAll">전체연습실조회</li>
  <li id="resvAll">전체예약조회</li>
</ul>
<div id="content"></div>
</body>
</html>