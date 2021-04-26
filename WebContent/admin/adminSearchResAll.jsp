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
		<td>예약번호</td>
		<td>게스트번호</td>
		<td>방번호</td>
		<td>예약일</td>
		<td>예약시간</td>
		<td>현재상태</td>
		<td></td>
	</tr>
		<c:forEach var="reservation" items="${reservationlist}">
		<tr>
		 <td><a href="reservationDetail?reservation_id=${reservation.resv_no}">${reservation.resv_no}</a></td>
		 <td>${reservation.guest_no}</td>
		 <td>${reservation.room_no}</td>
		 <td>${reservation.resv_date}</td>
		 <td>${reservation.resv_time}</td>
		 <td>${reservation.resv_check}</td>
		 <td><button onclick="location.href='deptDelete?deptid=${dept.department_id}'">삭제</button></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>