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

<h3>회원정보</h3>
<br>
<form id="myfrm" action="update" method="post">
ID : <input type="text" value="${guest.guest_id}" name="guest_id" readonly><br>
PW : <input type="text" value="${guest.guest_pw}" name="guest_pw" ><br>
이름 : <input type="text" value="${guest.guest_name}" name="guest_name" ><br>
이메일 : <input type="text" value="${guest.guest_email}" name="guest_email"><br>
연락처 : <input type="text" value="${guest.guest_phone}" name="guest_phone"><br>
<input type="button" id="update" value="수정하기">
<input type="button" id="delete" value="탈퇴하기" mydata="${guest.guest_id}">
</form>
</body>
</html>