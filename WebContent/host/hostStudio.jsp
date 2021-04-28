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
		<td>번호</td>
		<td>연습실이름</td>
		<td>영업요일</td>
		<td>주소</td>
		<td>호스트아이디</td>
		<td>승인여부</td>
	</tr>
		<c:forEach var="studio" items="${studiolist}">
		<tr>
		 <td>${studio.studio_no}</td>
		 <td><a href="javascript:roomDetail(${studio.studio_no})">${studio.studio_name}</a></td>
		 <td>${studio.studio_days}</td>
		 <td>${studio.studio_address}</td>
		 <td>${studio.host_id}</td>
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
	
	function hostDetail(host_id){
		$.ajax({
			url:"adminHostDetail",
			data:{"host_id":host_id},
			success:function(responsedata){
				$("#content").html(responsedata);
			}
		});
	}
	
	</script>
</body>
</html>