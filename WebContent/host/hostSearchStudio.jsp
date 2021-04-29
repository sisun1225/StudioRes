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
  <jsp:include page="../common/hostHeader.jsp"></jsp:include>

<table>
	<tr>
		<td>연습실번호</td>
		<td>연습실이름</td>
		<td>영업요일</td>
		<td>주소</td>
		<td>승인여부</td>
	</tr>
		<c:forEach var="studio" items="${studiolist}">
		<tr>
		 <td>${studio.studio_no}</td>
		 <td><a href="javascript:studioDetail(${studio.studio_no})">${studio.studio_name}</a></td>
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
		 <td><button onclick='searchResv("${studio.studio_no}");'>예약현황</button></td>
		 <td><button>방추가</button></td>
		</tr>
		</c:forEach>
	</table>
	<script>
	function searchResv(studio_no){
		$.ajax({
			url:"hostSearchResByStudio",
			data:{"studio_no":studio_no},
			success:function(responsedata){
				$("body").html(responsedata);
			}
		});
	}
	
	function studioDetail(studio_no){
		$.ajax({
			url:"hostStudioDetail",
			data:{"studio_no":studio_no},
			success:function(responsedata){
				$("body").html(responsedata);
			}
		});
	}
	
	</script>
</body>
</html>