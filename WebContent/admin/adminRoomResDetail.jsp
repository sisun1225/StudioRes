<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>SPACESTORE-admin-roomReservation</title>
<style>
#admintitle{
	text-align: center;
	font-size: 30px;
}
</style>
<style>
#admintitle{
	text-align: center;
	font-size: 30px;
}
</style>
</head>
<body>
<div id="admintitle">
		번호 :<span style="color:blue; font-size:35px"> ${reservationlist[0].room_no}</span>
	 	이름 :<span style="color:blue; font-size:35px">${reservationlist[0].room_name}</span> 방의 예약현황</div>
<div id="guest_resv">
	<table id="tables">
	<tr>
		<td>예약번호</td>
		<td>게스트id</td>
		<td>예약일</td>
		<td>예약시간</td>
		<td>연습실이름</td>
		<td>호스트id</td>
		<td>현재상태</td>
	</tr>
		<c:forEach var="reservation" items="${reservationlist}">
		<tr>
		 <td>${reservation.resv_no}</td>
		 <td><a href="javascript:guestDetail(${reservation.guest_no})">${reservation.guest_id}</a></td>
		 <td>${reservation.resv_date}</td>
		 <td>${reservation.resv_time}</td>
		 <td><a href="javascript:roomDetail(${reservation.studio_no})">${reservation.studio_name}</a></td>
		 <td><a href="javascript:hostDetail('${reservation.host_id}')">${reservation.host_id}</a></td>
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
</div>
	<script>
	function hostDetail(host_id){
		$.ajax({
			url:"adminHostDetail",
			data:{"host_id":host_id},
			success:function(responsedata){
				$("#content").html(responsedata);
			}
		});
	}
	
	function guestDetail(guest_no){
		$.ajax({
			url:"adminGuestDetail",
			data:{"guest_no":guest_no},
			success:function(responsedata){
				$("#content").html(responsedata);
			}
		});
	}
	
	function roomDetail(studio_no){
		$.ajax({
			url:"adminRoomDetail",
			data:{"studio_no":studio_no},
			success:function(responsedata){
				$("#content").html(responsedata);
			}
		});
	}
	
	function resDetail(room_no){
		$.ajax({
			url:"adminResvDetailByRoom",
			data:{"room_no":room_no},
			success:function(responsedata){
				$("#content").html(responsedata);
			}
		});
	}
	 
	</script>
</body>
</html>