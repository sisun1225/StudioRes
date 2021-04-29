<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>
#nav {
	border: solid orange;
}

table, td {
	border: 2px solid black;
	border-collapse: collapse;
}

#container {
	overflow: scroll;
	min-height: 400px;
}

#content {
	overflow: scroll;
	height: 400px;
}

#footer {
	font-size: 2px;
	padding: 20px;
	position: relation;
	background-color: #D0CECE
}

#header {
	border: 3px solid red;
	float: none;
	height: 100px;
	position: relative;
}

#logo {
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
	right: 10px;
	top: 70px;
}

#guestcenter {
	right: 10px;
	top: 70px;
}

#gasan {
	margin: 0px; padding : 10px;
	font-size: 40px;
	float: right;
	padding: 10px;
}

#myfrm {
	padding: 20px;
	width: 400px;
	border: 1px solid #222;
	border-radius: 5px;
}

label {
	float: left;
	font-size: 13px;
	width: 80px;
}
</style>

</head>
<body>
	<c:set var="apppath" value="${pageContext.request.contextPath}"></c:set>
	<div id="header">
		<a href="${apppath}/main/searchAll"> <img id="logo"
			src="${apppath}/common/spacestore.png" alt="로고자리">
		</a>
		<span id="namewelcome">${adminid}님 환영합니다.</span>
		<span id="logout"><a href="${apppath}/admin/adminLogOut">로그아웃</a></span>
	</div>
</body>
</html>