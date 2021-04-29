<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>

<body>



<table border="1">
  <tr>
    <td>studio_no</td>
    <td>host_no</td>
    <td>host_id</td>
    <td>studio_desc</td>
    <td>studio_name</td>
    <td>studio_picture</td>
    <td>studio_days</td>
    <td>studio_notice</td>
    <td>studio_subway</td>
    <td>studio_address</td>
    <td>studio_check</td>
    <td>studio_have_mic</td>
    <td>studio_have_park</td>
    <td>studio_have_shower</td>
    <td>studio_have_water</td>
    <td>studio_have_aircon</td>
    <td>studio_have_heater</td>
    <td>studio_have_toilet</td>
  </tr>
  
 	<c:forEach var="listall" items="${studioOption}">
    <tr>
    <td><a href="roomDetail?studioid=${listall.studio_no}">${listall.studio_no}</a></td>
    <td>${listall.host_no}</td>
    <td>${listall.host_id}</td>
    <td>${listall.studio_desc}</td>
    <td>${listall.studio_name}</td>
    <td>${listall.studio_picture}</td>
    <td>${listall.studio_days}</td>
    <td>${listall.studio_notice}</td>
    <td>${listall.studio_subway}</td>
    <td>${listall.studio_address}</td>
    <td>${listall.studio_check}</td>
    <td>${listall.studio_have_mic}</td>
    <td>${listall.studio_have_park}</td>
    <td>${listall.studio_have_shower}</td>
    <td>${listall.studio_have_water}</td>
    <td>${listall.studio_have_aircon}</td>
    <td>${listall.studio_have_heater}</td>
    <td>${listall.studio_have_toilet}</td>

  </tr>
	</c:forEach>
	
</table>

</body>
</html>