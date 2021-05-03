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
	<c:choose>
			<c:when test="${studiolist[0]==null}">
				<div id="admintitle"><span style="color:red; font-size:35px">해당 host는 연습실이 존재하지 않습니다.</span></div>
			</c:when>
			<c:otherwise>
				<div id="admintitle"><span style="color:blue; font-size:35px">${studiolist[0].host_id}</span> 님의 연습실</div>
			</c:otherwise>
	 </c:choose>
	<table id="tables">
	<tr>
		<td>연습실번호</td>
		<td>연습실이름</td>
		<td>영업일</td>
		<td>주소</td>
		<td>승인여부</td>
	</tr>
		<c:forEach var="studio" items="${studiolist}">
		<tr>
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