<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>SPACESTORE-admin-guest</title>
<style>
#admintitle{
	text-align: center;
	font-size: 30px;
}
</style>
</head>
<div id="admintitle" style>게스트 전체</div>
<body>
	<table id="tables">
	<tr>
		<td>번호</td>
		<td>아이디</td>
		<td>패스워드</td>
		<td>이름</td>
		<td>전화번호</td>
		<td>이메일</td>
	</tr>
		<c:forEach var="guest" items="${guestlist}">
		<tr>
		 <td>${guest.guest_no}</td>
		 <td><a href="javascript:guestDetail(${guest.guest_no})">${guest.guest_id}</a></td>
		 <td>${guest.guest_pw}</td>
		 <td>${guest.guest_name}</td>
		 <td>${guest.guest_phone}</td>
		 <td>${guest.guest_email}</td>
		</tr>
		</c:forEach>
	</table>
	<script>
	function guestDetail(guest_no){
		$.ajax({
			url:"adminGuestDetail",
			data:{"guest_no":guest_no},
			success:function(responsedata){
				$("#content").html(responsedata);
			}
		});
	}
	 
	</script>
</body>
</html>