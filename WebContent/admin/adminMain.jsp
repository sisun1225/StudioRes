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
		$("#content").load("adminSearchHostAll");
	});
	$("#guestAll").on("click",function(){
		$("#content").load("adminSearchGuestAll");
	});
	$("#roomAll").on("click",function(){
		$("#content").load("adminSearchRoomAll");
	});
	$("#studioAll").on("click",function(){
		$("#content").load("adminSearchStudioAll");
	});
	$("#resvAll").on("click",function(){
		$("#content").load("adminSearchResAll");
	});
	$("ul").css({
		"list-style":"none"
	})
	$("li").css({
		"float":"left",
		"border":"1px solid red",
		"margin":"0 20px",
		"padding":"5px"
	})
	var work = "${work}";
	if(work=="approve"){
		$("#studioAll").trigger("click");
		work="";
	}
	
});
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
<br>
<br>
<hr>
<div id="content"></div>
</body>
</html>