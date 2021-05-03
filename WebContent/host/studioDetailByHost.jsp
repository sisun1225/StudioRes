<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>SPACESTORE-연습실상세정보</title>
<style>
#container{
  border-radius: 10px 10px 10px 10px;
  background-color : #f6f6f6;
  width: 80%;
  height: 100%;
  padding : 8px;
  margin-left: auto;
  margin-right: auto;
  text-align: center;
}
#titlename{
  font-size: 50px;
}
#h2{
font-size: 40px;
display:block;
}
#linedivRight{
/* border : 1px solid red; */
background-color : white;
width: 100%;
height: 8px;
padding:0;
margin: 5px;
}
#map{
  width:800px;
  height:400px;
  margin-left: auto;
  margin-right: auto;
}
#map *{
  padding: 6px 0;
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
width:280px;
border: 5px solid white;
margin: 5px 5px 5px 5px;
transition: 0.3s;
display:inline-block;
text-align: center;
}
#buttonIcon:hover{
box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}
#deleteRoom{
  width:100px;
}
#imagesizeDiv img{
width: 800px;
height:400px;
display:inline-block;
}
#infoBox{
  width:100%;
  height:100%;
  float:left;
}
#leftInfo,
#rightInfo{
  width:45%;
  display:inline-block;
  white-space:pre-line;
  text-align: left;
  height:100%;
  float:left;
}
#rightInfo{
  display:inline-block;
  float: left
}

#wrap{
  text-align: center;
}
#facility{
  list-style-type: disc;
  display:inline-block;
  align-content: center;
}
#facility li{
  float:left;
  font-size: 25px;
  margin-left:20px;
  margin-right:20px;
}

.mySlides {display:none;}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=806e8091967ec917e3572fad97eb1b9a&libraries=services"></script>
</head>
<body>
  <jsp:include page="../common/hostHeader.jsp"></jsp:include>
  <div id= "container">
    <span id="titlename">${studio.studio_name}</span>
    <div id="linedivRight"></div>
    <c:set var="number" value="1"/>
    <c:forEach var="room" items="${room}">
        <div id="buttonIcon">
          <span id="roomNoChkTitle">${room.room_name} </span><br>
          <span id="roomNoChkTitle2">수용인원 : ${room.room_capacity} | 가격 : ${room.room_price} /시간</span>
          <form id="deletRoom" action="roomDelete" style="display:inline-block">
            <input type="hidden" name=room_no value=${room.room_no }>
            <input type="hidden" name="studio_no" value="${studio.studio_no }">
            <input type="submit" value="방삭제">
          </form>
        </div>
    </c:forEach>
     
    <!-- 라인 만들기용 div -->
	<div id="linedivRight"></div>
	<!-- 라인 만들기용 div -->
    <div id="imagesizeDiv">
	  <c:set var="pPath" value="${pageContext.request.contextPath}" />
	  <img src="${pPath}/imageUpload/${studio.studio_picture}">
	</div>
	<div id="linedivRight"></div>
  
    <div id="infoBox" style="width:100%; height:100%;">
      <div id=leftInfo>  
        <span id="h2">[공간소개]</span>
          <div id="studioDesc">${studio.studio_desc}</div>
      </div>
      <div id="rightInfo">
        <span id="h2">[주의사항]</span>
          <div id="studioNotice">${studio.studio_notice}</div>
      </div>
    </div>
    <div id="linedivRight"></div>
    <div id="wrap">
    <span id="h2">[시설안내]</span>
      <ul id="facility">
        <c:forEach var="studio" items="${studiooption}">
          <li>${studio}</li>
        </c:forEach>
      </ul>
    </div>
	<div id="linedivRight"></div>
    <span id="h2">[연습실 정보]</span>
    <ul>
      <li>주소 : ${studio.studio_address }</li>
      <li>전화번호 : ${host.host_phone }</li>  
      <li>이메일 : ${host.host_email }</li>
    </ul>
    <div id="map"></div>
    
      <form id="studioUpdate" action="studioUpdatePage" method="post">
        <input type="hidden" name="studio_no" value="${studio.studio_no}">
        <input type="submit" value="수정하기">
      </form>
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