<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 사진슬라이드 -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>상세페이지-왼쪽</title>
<style>
#map {
	border: 1px solid red;
}
#studioInfo
{
  float: left;
  width:50%;
}
#roomInfo{
  width:40%;
  float:right;
}
#deleteRoom{
  display:block-line;
}
.mySlides {display:none;}
#imageContainer{
 width:600px;
 padding:0px;
 margin:0px;
}
#imageContainer button{
 opacity: 20%;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=806e8091967ec917e3572fad97eb1b9a&libraries=services"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script> 
	$.datepicker.setDefaults({
		dateFormat : 'yy-mm-dd',
		prevText : '이전 달',
		nextText : '다음 달',
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
				'10월', '11월', '12월' ],
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
				'9월', '10월', '11월', '12월' ],
		dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		showMonthAfterYear : true,
		yearSuffix : '년',
		minDate : '0',
		maxDate : '+1M'
	});

	var radioVal;
	var dateVal;
	var studioNo = ${studio.studio_no};
	function radioChk() {
		radioVal = $("input[name='roomno']:checked").val();
	}
	
	$(function() {
		$("#datepicker").datepicker({
			onSelect : function(dateText, inst) {
				dateVal = dateText;
				$.ajax({
					url : "hostSearchResByStudio",
					data : {
						"radioVal" : radioVal,
						"dateVal" : dateVal,
						"studio_no": studioNo
					},
					type : "get",
					success : function(responseData) {
						$("#resvSearch").html(responseData);

					}
				});
			}
		});

	});
</script>
</head>
<body>
  <jsp:include page="../common/hostHeader.jsp"></jsp:include>
  
  <div id="container">
    <div id="studioInfo">
      <h2>스튜디오 이름1 : ${studio.studio_name}</h2>
  
      ${studio.studio_picture}
      <div id="imageContainer" class="w3-content w3-display-container">
        <c:set var="pPath" value="${pageContext.request.contextPath }" />
        <img class="mySlides" src="${pPath }/imageUpload/${studio.studio_picture}" style="width:600px">
        <c:forEach var="room" items="${room }">
          <c:if test="${room.room_picture ne '이미지 없음'}">
            <img class="mySlides" src="${pPath }/imageUpload/${room.room_picture}" style="width:600px">
          </c:if>
        </c:forEach>
        <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
        <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
      </div>
      공간소개<br>
      <div id="studioDesc">
      <pre>${studio.studio_desc}</pre>
      </div>
      <br> 시설안내<br>
      <ul>
       <c:forEach var="studio" items="${studiooption}">
          <li>${studio}</li>
        </c:forEach>
      </ul>
      주소 : ${studio.studio_address }<br>
      전화번호 : ${host.host_phone }  
      이메일 : ${host.host_email }  
      <div id="map" style="width:100%;height:400px;"></div>
    </div>
    <div id="roomInfo">
      <c:set var="number" value="1"/>
      <c:forEach var="room" items="${room}">
        <input type="radio" value="${room.room_no}" name="room_no" id="roomNoChk" onclick="radioChk();">
        방이름 : ${room.room_name} | 수용인원 : ${room.room_capacity} | 가격 : ${room.room_price} /시간
        <form id="deletRoom" action="roomDelete">
          <input type="hidden" name=room_no value=${room.room_no }>
          <input type="hidden" name="studio_no" value="${studio.studio_no }">
          <input type="submit" value="방삭제">
        </form>
        <br>
      </c:forEach>
      <div id="datepicker"></div>
       <p> 예약시간 최소 1시간부터</p>
      <form id="studioUpdate" action="studioUpdatePage" method="post">
        <input type="hidden" name="studio_no" value="${studio.studio_no}">
        <input type="submit" value="수정하기">
      </form>
      </div>
      <div id="resvSearch"></div>    
</div>
<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>    
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
</body>
</html>