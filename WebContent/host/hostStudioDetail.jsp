<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<style>
  .column {
    float: left;
    width: 100%;
    padding: 10px;
  }
  
  .row:after {
    content: "";
    display: table;
    clear: both;
  }
</style>
<meta charset="UTF-8">
<title>상세페이지-왼쪽</title>
<script>
	$(function(){
		$("#Update").on("click",function(){
			location.href = "hostUpdateStudio?studio_no="+${studio.studio_no};
		})
	});
</script>
</head>
<body>
  <jsp:include page="../common/hostHeader.jsp"></jsp:include>
  <div id="container">
    <h2>스튜디오 이름 :  ${studio.studio_name} </h2>
    <input type="button" id="Update" value="수정하기">
    <div class="row">
      <div class="column" style="background-color:#aaa;">
        <h1>사진(studios ->studio_picture)</h1>
        <div id="imageBox">
          <c:set var="pPath" value="${pageContext.request.contextPath }"/>
          <img src="${pPath }/imageUpload/${studio.studio_picture}"> 
        </div>
        <h1>공간소개</h1>
         	<textarea>${studio.studio_desc}</textarea>
        
        <h1>시설안내</h1>
    	    <ul>
    	    	<c:forEach var="studio" items="${studiooption}">
    				<li>${studio}</li>
    			</c:forEach>
    	    </ul>
        
        <h1>지도,연락처,주소</h1>
    	    주소 : ${studio.studio_address}  <br>
    	    연락처 : ${host.host_phone}
           <div id="map" style="width:350px;height:350px;"></div>
    	<br>
    	   
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
geocoder.addressSearch("${studio.studio_address}", function(result, status) {
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
            content: "<div style="width:150px;text-align:center;padding:6px 0;">${studio.studio_name}</div>"
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
  
</body>
</html>