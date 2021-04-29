<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지-왼쪽</title>
<style>
* {
  box-sizing: border-box;
}

/* Create two equal columns that floats next to each other */
.column {
  float: left;
  width: 50%;
  padding: 10px;
  height: 100%; /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
</style>





<!-- 달력을 위한 스크립트 -->
  <!--   <link rel="stylesheet" href="/resources/demos/style.css"> -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script> 
  $.datepicker.setDefaults({
      dateFormat: 'yy-mm-dd',
      prevText: '이전 달',
      nextText: '다음 달',
      monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
      monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
      dayNames: ['일', '월', '화', '수', '목', '금', '토'],
      dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
      showMonthAfterYear: true,
      yearSuffix: '년',
      minDate: '0',
      maxDate: '+1M'
  });
	
  	var radioVal;
  	var dateVal;
  	
	function radioChk(){
		 radioVal = $("input[name='roomno']:checked").val();
		console.log(radioVal);
	}
	
  
  $( function() {
    $( "#datepicker" ).datepicker({
    	onSelect: function(dateText, inst) {
    	     dateVal = dateText;
    		console.log(dateText);
    		console.log("---------------");
    		
    		 $.ajax({
 				url:"searchByNoDate",
 				data:{"radioVal":radioVal,"dateVal":dateVal},
 				type:"get",
 				success:function(responseData){
 					$("#resvTime").html(responseData);

 				}
 			});
    	} 		
    });  

  });
  

  </script>
<!-- 달력을 위한 스크립트 여기까지-->


</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>

<h1>스튜디오 이름 :  ${studio.studio_name} </h1>



<div class="row">
  <div class="column" style="background-color:#aaa;">
    
    <h2>사진(studios ->studio_picture)</h2>
    
    <h2>공간소개</h2>
     	${studio.studio_desc}
    
    <h2>시설안내</h2>
	    <ul>
	    	<c:forEach var="studio" items="${studiooption}">
				<li>${studio}</li>
			</c:forEach>
	    </ul>
    
    <h2>지도,연락처,주소</h2>
	    주소 : ${studio.studio_address}  <br>
	    연락처 : ${host.host_phone}
	    <br>
	    <div id="map" style="width:350px;height:350px;"></div>
    
    	<br>
		  <p style="margin-top:-12px">
		    <em class="link">
		        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
		            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
		        </a>
		    </em>
		  </p>
    
    	<input type="button" value="호스트페이지 이동 버튼 ${host.host_no}"onClick="location.href='http://localhost:9090/StudioRes/host/hostLogin'">
  </div>
  
  
  <div class="column" style="background-color:#bbb;">
  
 
   
    <p> 예약을 하시려면 호스트의 승인이 필요합니다.</p>
	<p>	승인 후에 온라인 결제가 가능합니다!</p>
	

    
	<c:forEach var="room" items="${room}">
	<input type="radio" value="${room.room_no}" name="roomno" id="roomNoChk" onclick="radioChk();">방번호 : ${room.room_no}호실 | 수용인원 : ${room.room_capacity} | 가격 : ${room.room_price} /시간<br>
	</c:forEach>
	

    
    <div id="datepicker"></div>
    

    

    
    <p> 예약시간 최소 1시간부터</p>
    <div id="resvTime" style ="border: 1px solid red"></div>
  
  
  
</div>
</div>





<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=806e8091967ec917e3572fad97eb1b9a&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${studio.studio_address}', function(result, status) {
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${studio.studio_name}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>









<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>