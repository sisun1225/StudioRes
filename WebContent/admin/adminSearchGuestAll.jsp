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
<h1>안녕하세요guest</h1>
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
		<c:forEach var="guest" items="${guestlist}">
		<tr>
		 <td><a href="guestDetail?guest_id=${guest.guest_id}">${guest.guest_no}</a></td>
		 <td>${guest.guest_no}</td>
		 <td>${guest.guest_id}</td>
		 <td>${guest.guest_pw}</td>
		 <td>${guest.guest_name}</td>
		 <td>${guest.guest_phone}</td>
		 <td>${guest.guest_email}</td>
		 <td><button onclick="location.href='deptDelete?deptid=${dept.department_id}'">삭제</button></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>