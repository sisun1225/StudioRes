<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>SPACESTORE-admin-guestDetail</title>
<style>
#admintitle{
	text-align: center;
	font-size: 30px;
}
</style>
</head>
<body>
<table id="tables">
	<c:choose>
			<c:when test="${reservationlist[0]==null}">
				<div id="admintitle"><span style="color:red; font-size:35px">해당 guest는 예약이 존재하지 않습니다.</span></div>
			</c:when>
			<c:otherwise>
				<div id="admintitle"><span style="color:blue; font-size:35px">${reservationlist[0].guest_id}</span> 님의 예약</div>
			</c:otherwise>
	 </c:choose>
	<tr>
		<td>예약번호</td><td>연습실이름</td><td>방이름</td>
		<td>예약날짜</td><td>예약시간</td><td>상태</td><td>호스트아이디</td>
		
	</tr>
	<c:forEach var="resv" items="${reservationlist}">
	<tr>
		<td>${resv.resv_no}</td>
		<td>${resv.studio_name}</td>
		<td>${resv.room_name}</td>
		<td>${resv.resv_date}</td>
		<td>${resv.resv_time}</td>
		<c:choose>
			<c:when test="${resv.resv_check==0}">
			 <td>예약중</td>
			</c:when>
			<c:when test="${resv.resv_check==1}">
			 <td>결제완료</td>
			</c:when>
			<c:when test="${resv.resv_check==2}">
			 <td>사용완료</td>
			</c:when>
		 </c:choose>
		<td>${resv.host_id}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>