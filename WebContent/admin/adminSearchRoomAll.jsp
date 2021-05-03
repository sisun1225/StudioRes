<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#admintitle{
	text-align: center;
	font-size: 30px;
}
</style>
</head>
<body>
<div id="admintitle" style>방 전체</div>
<table id="tables">
	<tr>
		<td>방번호</td>
		<td>방이름</td>
		<td>수용가능인원</td>
		<td>가격</td>
		<td>연습실이름</td>
		<td>호스트id</td>
	</tr>
		<c:forEach var="room" items="${roomlist}">
		<tr>
		 <td>${room.room_no}</td>
		 <td>${room.room_name}</td>
		 <td>${room.room_capacity}</td>
		 <td>${room.room_price}</td>
		 <td><a href="javascript:roomDetail(${room.studio_no})">${room.studio_name}</a></td>
		 <td>${room.host_id}</td>
		</tr>
		</c:forEach>
	</table>
	<script>
	function roomDetail(studio_no){
		$.ajax({
			url:"adminRoomDetail",
			data:{"studio_no":studio_no},
			success:function(responsedata){
				$("#content").html(responsedata);
			}
		});
	}
	 
	</script>
</body>
</html>