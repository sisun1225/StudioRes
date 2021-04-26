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
		<td>아이디</td>
		<td>패스워드</td>
		<td>이름</td>
		<td>전화번호</td>
		<td>이메일</td>
		<td></td>
	</tr>
		<c:forEach var="host" items="${hostlist}">
		<tr>
		 <td><a href="hostDetail?host_id=${host.host_id}">${host.host_no}</a></td>
		 <td>${host.host_id}</td>
		 <td>${host.host_pw}</td>
		 <td>${host.host_name}</td>
		 <td>${host.host_phone}</td>
		 <td>${host.host_email}</td>
		 <td><button onclick="location.href='deptDelete?deptid=${dept.department_id}'">삭제</button></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>