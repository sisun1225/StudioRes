<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간확인 예약하기 페이지</title>

<script>
	$("#btn1").on("click", function() {
		var chkTimeArr = [];
		  $("input[name=resvChk]:checked").each(function() { 
		       var chk = $(this).val();
		       chkTimeArr.push(chk);

		    });  
	});

</script>

</head>
<body>


<form action="searchByNoDate" method="post">
	<c:forEach var="cnt" begin="0" end="23">
	      <c:set  var="chk" value=""/>
	      <c:set  var="dis" value=""/>
		  <c:forEach var="resv" items="${resvList}">			
			<c:if test="${cnt eq resv.resv_time}">
				 <c:set  var="chk" value="checked"/>
				 <c:set  var="dis" value="disabled"/>
			</c:if>
		 </c:forEach>  
		<input type="checkbox" name="resvChk" value="${cnt}" id="${cnt}" ${chk} ${dis} >${cnt} ~ ${cnt+1}<br>
			 
	</c:forEach>


	
	<input type="hidden" name="insertRoomNoVal" value="${i_radio}">
	<input type="hidden" name="insertDateVal" value="${d_date}">

	<input type="submit" value="예약하기" id="btn1">
	</form>

</body>
</html>