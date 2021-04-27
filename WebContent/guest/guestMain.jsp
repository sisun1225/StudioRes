<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	$("#mypage").on("click", function(){
		$("#here").load("info");
	});
	$("#resvlist").on("click", function(){
		$("#here").load("resvlist");
	});
});
</script>
</head>
<body>
<h1>로그인 성공 + 헤더</h1>
<button id="mypage">개인정보</button>
<button id="resvlist">예약리스트</button>
<button type="button" onclick="location.href='logout'">로그아웃</button>
<hr>
<%
String id = (String) session.getAttribute("guest_id"); 
%>
<div id="here">
<%=id %>님 안녕하세요.
</div>
</body>
</html>