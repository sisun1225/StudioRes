<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간확인 예약하기 페이지</title>

<script>

$(function(){
	$("#btn1").on("click", function() {

		var chkArr = [];
		  $("input[name=resvChk]:checked").each(function() { 
		       var chk = $(this).val();
		       chkArr.push(chk);
		       console.log(chkArr);
		      
		    });

	});
});

</script>

</head>
<body>



	<c:forEach var="cnt" begin="0" end="23">

		<c:forEach var="resv" items="${resvList}">
			<c:if test="${cnt eq resv.resv_time}">
				<script>
		     	 document.getElementById('${cnt}').setAttribute('disabled','chekced');
		    	</script>
			</c:if>
		</c:forEach>
		<input type="checkbox" name="resvChk" value="${cnt}" id="${cnt}">${cnt} ~ ${cnt+1}<br>
	</c:forEach>

<form action="searchByNoDate" method="post">
<input type="hidden" name="insertRadioVal" value="${i_radio}">
<input type="hidden" name="insertDateVal" value="${d_date}">
<input type="hidden" name="insertChakArrVal" value="${chkArr}">
<input type="submit" value="예약하기" id="btn1">
</form>

</body>
</html>