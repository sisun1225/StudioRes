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
		<td>호스트id</td>
		<td>연습실번호</td>
		<td>연습실이름</td>
		<td>영업일</td>
		<td>주소</td>
		<td>승인여부</td>
	</tr>
		<c:forEach var="studio" items="${studiolist}">
		<tr>
		 <td>${studio.host_id}</td>
		 <td>${studio.studio_no}</td>
		 <td>${studio.studio_name}</td>
		 <td>${studio.studio_days}</td>
		 <td>${studio.studio_address}</td>
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