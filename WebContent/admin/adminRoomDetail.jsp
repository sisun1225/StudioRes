<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>SPACESTORE-admin-roomDetail</title>
<style>
#admintitle{
	text-align: center;
	font-size: 30px;
}
</style>
</head>
<body>
	<c:choose>
			<c:when test="${roomlist[0]==null}">
				<div id="admintitle"><span style="color:red; font-size:35px">해당 studio는 room이 존재하지 않습니다.</span></div>
			</c:when>
			<c:otherwise>
				<div id="admintitle"><span style="color:blue; font-size:35px">${roomlist[0].studio_name}</span> 연습실의 방</div>
			</c:otherwise>
	 </c:choose>
	<table id="tables">
	<tr>
		<td>방번호</td>
		<td>방이름</td>
		<td>수용인원</td>
		<td>가격</td>
		<td>호스트id</td>
	</tr>
		<c:forEach var="room" items="${roomlist}">
		<tr>
		 <td>${room.room_no}</td>
		 <td>${room.room_name}</td>
		 <td>${room.room_capacity}</td>
		 <td>${room.room_price}</td>
		 <td>${room.host_id}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>