<%@page import="model.ReservationsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
List<ReservationsVO> resvlist = (List<ReservationsVO>)request.getAttribute("resvlist");
%>
</head>
<body>
<h3>예약정보</h3>
<table>
	<tr>
		<td>예약번호</td><td>게스트번호</td><td>방번호</td><td>예약날짜</td>
		<td>예약시간</td><td>상태</td><td>게스트아이디</td><td>호스트아이디</td>
		<td>연습실이름</td><td>방이름</td><td>연습실번호</td><td>예약취소</td>
	</tr>
	<% for(ReservationsVO resv:resvlist){ %>
	<tr>
		<td><%=resv.getResv_no() %></td>
		<td><%=resv.getGuest_no() %></td>
		<td><%=resv.getRoom_no() %></td>
		<td><%=resv.getResv_date() %></td>
		<td><%=resv.getResv_time() %></td>
		<td><%=resv.getResv_check() %></td>
		<td><%=resv.getGuest_id() %></td>
		<td><%=resv.getHost_id() %></td>
		<td><%=resv.getStudio_name() %></td>
		<td><%=resv.getRoom_name() %></td>
		<td><%=resv.getStudio_no() %></td>
		<td><button onclick="location.href='resvDelete?resv_no=<%=resv.getResv_no() %>'">삭제버튼</button></td>
	</tr>
	<%} %>
</table>
</body>
</html>