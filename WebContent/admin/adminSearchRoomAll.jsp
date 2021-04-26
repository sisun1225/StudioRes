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
	$("table,td").css({
		"border":"2px solid black", 
		"border-collapse":"collapse"
	})
})
</script>
</head>
<body>
<table>
	<tr>
		<td>방번호</td>
		<td>방이름</td>
		<td>연습실번호</td>
		<td>수용가능인원</td>
		<td>가격</td>
		<td></td>
	</tr>
		<c:forEach var="room" items="${roomlist}">
		<tr>
		 <td><a href="roomDetail?room_id=${room.room_no}">${room.room_no}</a></td>
		 <td>${room.room_name}</td>
		 <td>${room.studio_no}</td>
		 <td>${room.room_capacity}</td>
		 <td>${room.room_price}</td>
		 <td><button onclick="location.href='deptDelete?deptid=${dept.department_id}'">삭제</button></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>