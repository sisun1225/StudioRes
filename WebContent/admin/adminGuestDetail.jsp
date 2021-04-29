<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<td>예약번호</td><td>게스트번호</td><td>방번호</td><td>예약날짜</td>
		<td>예약시간</td><td>상태</td><td>게스트아이디</td><td>호스트아이디</td>
		<td>연습실이름</td><td>방이름</td><td>연습실번호</td>
	</tr>
	<c:forEach var="resv" items="${reservationlist}">
	<tr>
		<td>${resv.resv_no}</td>
		<td>${resv.guest_no}</td>
		<td>${resv.room_no}</td>
		<td>${resv.resv_date}</td>
		<td>${resv.resv_time}</td>
		<td>${resv.resv_check}</td>
		<td>${resv.guest_id}</td>
		<td>${resv.host_id}</td>
		<td>${resv.studio_name}</td>
		<td>${resv.room_name}</td>
		<td>${resv.studio_no}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>