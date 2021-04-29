<%@page import="model.StudioResDAO"%>
<%@page import="model.GuestVO"%>
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
	$("#update").on("click", function(){
		$("#myfrm").submit();
	});
	$("#delete").on("click", function(){
		location.href = "delete?guest_id="+$(this).attr("mydata");
	});
});
</script>
</head>
<body>

<div id="container">
<form id="myfrm" action="update" method="post">
<fieldset>
<legend>회원정보</legend>
<label>ID</label>
<input type="text" value="${guest.guest_id}" name="guest_id" readonly><br>
<label>PW</label>
<input type="text" value="${guest.guest_pw}" name="guest_pw" ><br>
<label>이름</label>
<input type="text" value="${guest.guest_name}" name="guest_name" ><br>
<label>이메일</label>
<input type="text" value="${guest.guest_email}" name="guest_email"><br>
<label>연락처</label>
<input type="text" value="${guest.guest_phone}" name="guest_phone"><br>
<input type="button" id="update" value="수정하기">
<input type="button" id="delete" value="탈퇴하기" mydata="${guest.guest_id}">
</fieldset>
</form>
</div>
</body>
</html>