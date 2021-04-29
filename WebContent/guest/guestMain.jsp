<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(function() {
		$("#mypage").on("click", function() {
			$("#container").load("info");
		});
		$("#resvlist").on("click", function() {
			$("#container").load("resvlist");
		});
	});
</script>
</head>
<body>

	<jsp:include page="../common/header.jsp"></jsp:include>
	<nav id="nav">
		<ul>
			<li id="mypage"><a>개인정보</a></li>
			<li id="resvlist"><a>예약리스트</a></li>
		</ul>
	</nav>

	<div id="container">
		<div id="hello">${guest_id}님안녕하세요.</div>
	</div>


	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>