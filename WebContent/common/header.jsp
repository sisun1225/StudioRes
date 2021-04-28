<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	padding: 10px;
	margin: 10px;
}

#nav {
	border: solid orange;
}

#container {
	border: solid yellow;
}

#header {
	border: 3px solid red;
	float: none;
	height: 100px;
	position: relative;
}

#logo {
	position: absolute;
	left: 10px;
	top: 15px;
}

#namewelcome {
	position: absolute;
	right: 10px;
	top: 10px;
}

#logout, #login {
	position: absolute;
	right: 10px;
	top: 40px;
}

#hostcenter {
	position: absolute;
	right: 10px;
	top: 70px;
}
</style>
</head>
<body>
	<c:set var="apppath" value="${pageContext.request.contextPath}"></c:set>
	<div id="header">
		<img id="logo" src="${apppath}/common/spacestore.png" alt="로고자리">
		<c:choose>
			<c:when test="${guest_id!=null}">
				<span id="namewelcome">${guest_name}님 환영합니다.</span>
				<span id="logout"><a href="${apppath}/guest/logout">로그아웃</a></span>
			</c:when>

			<c:otherwise>
				<span id="login"> <a href="${apppath}/guest/insert">회원가입</a>
					<a href="${apppath}/guest/login">로그인</a>
				</span>
			</c:otherwise>
		</c:choose>
		<span id="hostcenter"><a href="${apppath}/host/hostLogin">호스트센터</a></span>
	</div>
</body>
</html>