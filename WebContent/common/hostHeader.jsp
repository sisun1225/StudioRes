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
	margin: 5px;
	font-family: 배달의민족 주아;
	font-size:20px;
}

input[type=password]{
	font-family: Consolas;
}

table {
	margin-left: auto;
	margin-right: auto;
}

table, td {
	border: 2px solid black;
	border-collapse: collapse;
}

#container {
	overflow: auto;
	min-height: 400px;
}

#content {
	overflow: auto;
	height: 400px;
}

#footer {
	font-size: 2px;
	padding: 20px;
	position: relation;
	background-color: #D0CECE
}

#header {
	float: none;
	height: 100px;
	position: relative;
}

#logoMain {
	position: relative;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
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

#gasan {
	margin: 0px;
	padding: 10px;
	font-size: 40px;
	float: right;
	padding: 10px;
}

#guest_resv {
	margin-top: 30px;
	margin-left: auto;
	margin-right: auto;
	padding: 20px;
}

#myfrm {
	margin-left: auto;
	margin-right: auto;
	padding: 20px;
	width: 400px;
	border: 1px solid #222;
	border-radius: 5px;
}

#hello {
	margin-top: 30px;
	margin-left: auto;
	font-size: 30px;
}

label {
	float: left;
	font-size: 13px;
	width: 80px;
}

ul {
	list-style: none;
}

#center ul li {
   display: inline-block;
   border-radius: 10px;
    border: 1px solid gray;
    width:120px;
    text-align: center;
}

#center ul li:hover {
	background-color: #2F55AA;
	color: white;
}

#nav ul li {
   display: inline-block;
   width:120px;
   color:#2F55AA;
   border: 2.5px solid #2F55AA; 
}

#nav ul li:hover{
   background-color: #2F55AA;
   color:white;
}


#nav a {
   display: block;
}

#nav a:link, a:active {
   color: black;
   text-decoration: none;
}

#nav a:hover {
   color: #fff;
}

#header a:link {
	color: black;
	text-decoration: none;
}

body{
	padding:0 !important;
	margin:0 !important;
}

html{
	padding:0 !important;
	margin:0 !important;
}

#center{
	padding:0 !important;
	margin:0 !important;
	width:200px;
	display:inline-block;
	position: absolute;
	left:0px;
	top:0px;
}

</style>

</head>
<body>
	<c:set var="apppath" value="${pageContext.request.contextPath}"></c:set>
	<div id="header">
		<img onclick="location.href='${apppath}/main/searchAll'" id="logoMain"
			src="${apppath}/common/spacestore2.png" alt="로고자리"/>
		<c:choose>

			<c:when test="${host_id!=null}">
				<span id="namewelcome">${host_name}님 환영합니다.</span>
				<span id="logout"><a href="${apppath}/host/hostLogout">로그아웃</a></span>
			</c:when>

			<c:otherwise>
				<span id="login"> <a href="${apppath}/host/hostInsert">회원가입</a>
					<a href="${apppath}/host/hostLogin">로그인</a>
				</span>
			</c:otherwise>
		</c:choose>
	</div>
	<div id="center">
			<ul>
				<li id="guestCenteronclick="location.href='${apppath}/guest/main'">게스트센터</li>
				<li onclick="location.href='${apppath}/host/hostLogin'">호스트센터</li>
			</ul>
	</div>
</body>
</html>