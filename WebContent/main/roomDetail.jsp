<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

p{
	margin: 15px;
}

#row{
	width: 100%;
	height:100%;
	margin:80px 0 0 0;
	display: flex;
	justify-content:  center;
}

#columnleft{
	float: left;
	width: 550px;
	height: 100%;
	padding : 10px;
}

#columnright{
	border-radius: 10px 10px 10px 10px;
	background-color : #f6f6f6;
	float: left;
	width: 410px;
	height: 100%;
	padding : 8px;
}


#titlename{
	font-size: 40px;
}

#linedivLeft{
	background-color : #f6f6f6;
	width: 550px;
	height: 8px;
	padding:0;
	margin: 5px 0 5px 0;
}

#linedivRight{
	background-color : white;
	width: 400px;
	height: 8px;
	padding:0;
	margin: 5px;
}

#resvTime{
	background-color : white;
	border-radius: 10px 10px 10px 10px;
	padding:0;
	border: 5px solid white;
}

#imagesizeDiv img{
	width: 550px;
	height:400px;
	display:inline-block;
}

li{
	margin: 5px;
}

#studioDesc{
	font-size: 18px;
	color:grey;
}

#h2{
	font-size: 25px;
	line-height: 70px;
}

#roomNoChk{
	width:30px;
	height:30px;
	border:1px;
	margin: 10px;
}

#roomNoChkTitle{
	font-size: 30px;
}

#roomNoChkTitle2{
	font-size: 15px;
	text-align: center;
	margin: 2px;
}

#buttonIcon{
	border-radius: 30px 30px 30px 30px;
	background-color:white;
	width:400px;
	border: 5px solid white;
	margin: 5px 0 0 0;
	transition: 0.3s;
}

#buttonIcon:hover{
	box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

/*header를 위한 Css부분  */
#header {
	float: none;
	height: 100px;
	position: relative;
	padding: 10px;
	margin: 5px;
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
	padding: 10px;
	margin: 5px;
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
#center ul li {
    display: inline-block;
    border-radius: 10px;
    border: 1px solid gray;
    width:120px;
    text-align: center;
    padding: 10px;
	margin: 5px;
}

#center ul {
	padding: 10px;
	margin: 5px;
}
#center ul li:hover {
	background-color: #2F55AA;
	color: white;
}
#logoMain {
    position: relative;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
}
#header a:link {
	color: black;
	text-decoration: none;
}
#header a{
	padding: 10px;
	margin: 5px;
}
/*header를 위한 Css끝  */

/*footer를 위한 Css부분  */
#footer {
	font-size: 2px;
	padding: 20px;
	position: relation;
	background-color: #D0CECE
}

#gasan {
	margin: 0px;
	padding: 10px;
	font-size: 40px;
	float: right;
	padding: 10px;
}

/*footer를 위한 Css끝  */

#studiDesclinealign{
	width:100%;
	line-height: 20px;
	white-space:pre-line;
}

#studioOptionStyle{
	color:grey;
}

#studioNameStyle{
	color:grey;
}

#resvTextStyle{
	color:grey;
}
</style>



<!-- 달력을 위한 스크립트 -->
  <link rel="stylesheet" href="jquery-ui.css">
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
  	
  	function ajaxFn(){
		 $.ajax({
			url:"searchByNoDate",
			data:{"radioVal":radioVal,"dateVal":dateVal},
			type:"get",
			success:function(responseData){
			$("#resvTime").html(responseData);
				}
			});
  	}
  	
	function radioChk(){
		 radioVal = $("input[name='roomno']:checked").val();
		 ajaxFn();
	}
	
  
  $( function() {
    $( "#datepicker" ).datepicker({
    	onSelect: function(dateText, inst) {
        dateVal = dateText;
    	ajaxFn();	 
    	} 		
    });  

  });
  </script>
<!-- 달력을 위한 스크립트 여기까지-->

</head>
<body>
<!-- 헤더부분 -->
<c:set var="apppath" value="${pageContext.request.contextPath}"></c:set>
<div id="header">
	<img onclick="location.href='${apppath}/main/searchAll'" id="logoMain"
		src="${apppath}/common/spacestore2.png" alt="로고자리"/>
	<c:choose>
		<c:when test="${guest_id!=null}">
			<span id="namewelcome">${guest_name}님 환영합니다.</span>
			<span id="logout"><a href="${apppath}/guest/logout">로그아웃</a></span>
		</c:when>

		<c:otherwise>
			<span id="login"> <a href="${apppath}/guest/insert">회원가입</a>
				<a href="${apppath}/guest/login">로그인</a>
			</span>
		</c:otherwise>
	</c:choose>
	<div id="center">
		<ul>
			<li onclick="location.href='${apppath}/guest/main'">게스트센터</li>
			<li onclick="location.href='${apppath}/host/hostLogin'">호스트센터</li>
		</ul>
	</div>
</div>
<!-- 헤더부분 끝-->
<div id="row">

  <div id="columnleft">
    <span id="titlename">${studio.studio_name}</span>
    
        <!-- 라인 만들기용 div -->
		<div id="linedivLeft"></div>
		<!-- 라인 만들기용 div -->
    
    	<div id="imagesizeDiv">
		  <c:set var="pPath" value="${pageContext.request.contextPath}" />
		  <img src="${pPath}/imageUpload/${studio.studio_picture}">
		</div>
		
		<!-- 라인 만들기용 div -->
		<div id="linedivLeft"></div>
		<!-- 라인 만들기용 div -->

    <span id="h2">공간소개</span>
    <div id="studiDesclinealign">
     	<span id="studioDesc">${studio.studio_desc}</span>
    </div>
    
    <!-- 라인 만들기용 div -->
	<div id="linedivLeft"></div>
	<!-- 라인 만들기용 div -->
    
    <span id="h2">시설안내</span>
	    <ul>
	    	<c:forEach var="studio" items="${studiooption}">
				<span id="studioOptionStyle"><li>${studio}</li></span>
			</c:forEach>
	    </ul>
	    
    	<!-- 라인 만들기용 div -->
		<div id="linedivLeft"></div>
		<!-- 라인 만들기용 div -->
		
   	    <span id="h2">${studio.studio_name}</span>
   	    <ul>
   	    <span id="studioNameStyle">
	    <li>주소:${studio.studio_address}</li>
	    <li>연락처:${host.host_phone}</li>
	    </span>
	    </ul>
	    <br>
	    <!-- 지도 출력 용 div -->
	    <div id="map" style="width:100%;height:350px;"></div>
    

    	<br>
    	
  </div>
  
  
  <div id="columnright">
  
 
   
    <p> 예약을 하시려면 호스트의 승인이 필요합니다.</p>
	<p>	승인 후에 예약 정보 확인 가능합니다.</p>
	
		<!-- 라인 만들기용 div -->
		<div id="linedivRight"></div>
		<!-- 라인 만들기용 div -->
    
    
	<c:forEach var="room" items="${room}">
	<label>
	<div id="buttonIcon">
	<input type="radio" value="${room.room_no}" name="roomno" id="roomNoChk" onclick="radioChk();"><span id="roomNoChkTitle">${room.room_name} </span><span id="roomNoChkTitle2">수용인원 : ${room.room_capacity} | 가격 : ${room.room_price} /시간</span><br>
	</div>
	</label>
	</c:forEach>
	
	
		<!-- 라인 만들기용 div -->
		<div id="linedivRight"></div>
		<!-- 라인 만들기용 div -->
    
	    <!-- 달력 -->
	    <div id="datepicker"></div>
	    <!-- 달력 끝 -->

    
		<!-- 라인 만들기용 div -->
		<div id="linedivRight"></div>
		<!-- 라인 만들기용 div -->
    
    <p> 예약시간 최소 1시간부터</p>
    <div id="resvTime">
    <span id="resvTextStyle">
    <p>방번호와 날짜를 선택하시면</p>
    <p>예약 가능한 시간 확인 가능합니다.</p>
    </span>
    </div>
  
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