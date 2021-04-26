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
		<td>호스트번호</td>
		<td>이름</td>
		<td>영업요일</td>
		<td>주소</td>
		<td>승인여부</td>
		<td></td>
	</tr>
		<c:forEach var="studio" items="${studiolist}">
		<tr>
		 <td><a href="studioDetail?studio_id=${studio.studio_no}">${studio.studio_no}</a></td>
		 <td>${studio.host_no}</td>
		 <td>${studio.studio_name}</td>
		 <td>${studio.studio_days}</td>
		 <td>${studio.studio_address}</td>
		 <td>${studio.studio_check}</td>
		 <td><button onclick="location.href='deptDelete?deptid=${dept.department_id}'">삭제</button></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>