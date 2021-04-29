<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>



$(function(){
	$("#btn1").on("click", function() {
		//alert('아아아!!');
		
		var chkArr = [];
		  $("input[name=chk]:checked").each(function() { 
		       var chk = $(this).val();
		       chkArr.push(chk);
		       console.log(chkArr);
		    });
		
		$.ajax({
			url:"searchByOption",
			data:{"loc":$("#loc").val(),"subway":$("#subway").val(), "chkArr":chkArr},
			type:"get",
			success:function(responseData){
				$("#here").html(responseData);
			}
		});
	});
});

 $(function(){
	$("#btn2").on("click", function() {
		location.href='searchAll';
		
		
	});

}); 

</script>

</head>
<body>

<hr>
지하철:<input type="text" placeholder="지하철을 입력하세요" name="subway" id="subway" value="잠실">
		지역:<input type="text" placeholder="지역을 입력하세요" name="loc" id="loc" value="구로">
		

		<input type="checkbox" name="chk" value="1">마이크
		<input type="checkbox" name="chk" value="2">주차장
		<input type="checkbox" name="chk" value="3">샤워장
		<input type="checkbox" name="chk" value="4">정수기
		<input type="checkbox" name="chk" value="5">에어컨
		<input type="checkbox" name="chk" value="6">난방기
		<input type="checkbox" name="chk" value="7">내부화장실
		<input type="button" value="검색" id="btn1">
		<input type="button" name="chk" value="초기화" id="btn2">

	<hr>
	
	
	<div id ="here">여기

		
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
		  
		 	<c:forEach var="listall" items="${searchAll}">
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



	</div>
	
</body>
</html>