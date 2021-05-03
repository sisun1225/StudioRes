<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>SPACESTORE-admin-host</title>
</head>
<style>
#admintitle{
	text-align: center;
	font-size: 30px;
}
</style>
<body>
	<div id="admintitle" style>호스트 전체</div>
	<table id="tables">
	<tr>
		<td>번호</td>
		<td>아이디</td>
		<td>패스워드</td>
		<td>이름</td>
		<td>전화번호</td>
		<td>이메일</td>
	</tr>
		<c:forEach var="host" items="${hostlist}">
		<tr>
		 <td>${host.host_no}</td>
		 <td><a href="javascript:hostDetail('${host.host_id}')">${host.host_id}</a></td>
		 <td>${host.host_pw}</td>
		 <td>${host.host_name}</td>
		 <td>${host.host_phone}</td>
		 <td>${host.host_email}</td>
		</tr>
		</c:forEach>
	</table>
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
	 
	</script>
</body>
</html>