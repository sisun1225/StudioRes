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
		<td>예약번호</td>
		<td>게스트id</td>
		<td>방번호</td>
		<td>연습실이름</td>
		<td>방이름</td>
		<td>예약일</td>
		<td>예약시간</td>
		<td>예약현황</td>
		<td>호스트id</td>
	</tr>
		<c:forEach var="reservation" items="${reservationlist}">
		<tr>
		 <td>${reservation.resv_no}</td>
		 <td>${reservation.guest_id}</td>
		 <td>${reservation.room_no}</td>
		 <td>${reservation.studio_name}</td>
		 <td>${reservation.room_name}</td>
		 <td>${reservation.resv_date}</td>
		 <td>${reservation.resv_time}</td>
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