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
  <jsp:include page="../common/hostHeader.jsp"></jsp:include>
<nav id="nav">
<button type="button" onclick="location.href='hostDetail'">마이페이지</button>
<button type="button" onclick="location.href='studioInsert'">연습실등록</button>
<button type="button" onclick="location.href='hostSearchStudio'">연습실조회</button>
</nav>
	<table>
	<tr>
		<td>예약번호</td>
		<td>연습실이름</td>
		<td>방이름</td>
		<td>게스트id</td>
		<td>예약일</td>
		<td>예약시간</td>
		<td>현재상태</td>
	</tr>
		<c:forEach var="reservation" items="${reservationlist}">
		<tr>
		 <td>${reservation.resv_no}</td>
		 <td>${reservation.studio_name}</td>
		 <td>${reservation.room_name}</td>
		 <td>${reservation.guest_id}</td>
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
		</tr>
		</c:forEach>
	</table>
</body>
</html>