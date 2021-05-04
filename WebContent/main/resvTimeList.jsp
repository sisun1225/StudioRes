<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPACESTORE-${studio.studio_name}</title>

<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
* {
	font-family: 'Jua', sans-serif;
	font-size:20px;
}

checkbox{
width:30px;
height:30px;
border:1px;
margin: 10px;
}

input[type=checkbox]{
width: 20px; 
height: 20px;
}

#buttonIconTime{
border-radius: 10px 10px 10px 10px;
background-color:white;
width:85px;
height:30px;
border: 1px solid  #b3b3b3;
margin: 1px 1px 1px 1px;
transition: 0.3s;
float: left;
}

#buttonIconTime:hover{
box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

#buttonIconTime:checked{
border-radius: 10px 10px 10px 10px;
background-color:lightgrey;
width:80px;
height:30px;
border: 2px solid  #b3b3b3;
margin: 3px;
transition: 0.3s;
float: left;
}

#buttonWrap{
padding : 0 15px 0 15px;
display: inline-block;
width:390px;
}

#timeTitle{
font-size: 18px;
}

#btn1{
border-radius: 10px 10px 10px 10px;
width : 400px;
height : 35px;
}
</style>


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

<div id="buttonWrap">
	<c:forEach var="cnt" begin="0" end="23">
	      <c:set  var="chk" value=""/>
	      <c:set  var="dis" value=""/>
		  <c:forEach var="resv" items="${resvList}">			
			<c:if test="${cnt eq resv.resv_time}">
				 <c:set  var="chk" value="checked"/>
				 <c:set  var="dis" value="disabled"/>
			</c:if>
		 </c:forEach>  
		 <label>
		<div id="buttonIconTime">
		<span id="checkmark"></span>
		<input type="checkbox" name="resvChk" value="${cnt}" id="${cnt}" ${chk} ${dis} ><span id="timeTitle">${cnt}:00</span>
		</div>
		</label>	 
	</c:forEach>
</div>

	
	<input type="hidden" name="insertRoomNoVal" value="${i_radio}">
	<input type="hidden" name="insertDateVal" value="${d_date}">
	
	<br>
	
	

	<input type="submit" value="예약하기" id="btn1">


	
	
	</form>

</body>
</html>