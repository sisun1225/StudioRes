<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
</style>
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
		console.log(radioVal);
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
  <a href="javascript:document.getElementById('studioUpdate').submit()">수정하기</a>
  <form id="studioUpdate" action="studioUpdatePage" method="post">
    <input type="hidden" name="studio_no" value="${studio.studio_no}">
  </form>
  <div id="container">
    <div id="studioInfo">
      <h2>스튜디오 이름1 : ${studio.studio_name}</h2>
  
      <h1>사진(studios ->studio_picture)</h1>
      <div id="imageBox">
        <c:set var="pPath" value="${pageContext.request.contextPath }" />
        <img src="${pPath }/imageUpload/${studio.studio_picture}.png">
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
      지도,연락처,주소<br>  
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
      </div>
      <div id="resvSearch"></div>    
</div>
    
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