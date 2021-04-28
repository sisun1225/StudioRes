<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<jsp:include page="../common/header.jsp"></jsp:include>
<button id="mypage">개인정보</button>
<button id="resvlist">예약리스트</button>
<hr>

<div id="here">
${guest_id}님 안녕하세요.
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>