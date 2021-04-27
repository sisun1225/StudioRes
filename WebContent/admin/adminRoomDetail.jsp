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
		<td>호스트id</td>
		<td>연습실이름</td>
		<td>연습실번호</td>
		<td>방번호</td>
		<td>방이름</td>
		<td>수용인원</td>
		<td>가격</td>
	</tr>
		<c:forEach var="room" items="${roomlist}">
		<tr>
		 <td>${room.host_id}</td>
		 <td>${room.studio_name}</td>
		 <td>${room.studio_no}</td>
		 <td>${room.room_no}</td>
		 <td>${room.room_name}</td>
		 <td>${room.room_capacity}</td>
		 <td>${room.room_price}</td>
		 <c:choose>
			<c:when test="${reservation.resv_check==0}">
			 <td>예약</td>
			</c:when>
			<c:when test="${reservation.resv_check==1}">
			 <td>결제완료</td>
			</c:when>
			<c:when test="${reservation.resv_check==2}">
			 <td>사용완료</td>
			</c:when>
			<c:when test="${reservation.resv_check==3}">
			 <td>예약취소</td>
			</c:when>
		 </c:choose>
		 <td>${reservation.host_id}</td>
		 <c:choose>
			<c:when test="${studio.studio_check==0}">
			 <td>신청중</td>
			</c:when>
			<c:when test="${studio.studio_check==1}">
			 <td>승인완료</td>
			</c:when>
		 </c:choose>
		</tr>
		</c:forEach>
	</table>
</body>
</html>