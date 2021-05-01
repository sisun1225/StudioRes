<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
  $("#hostInfo").on("click",function(){
    $(location).attr("href","hostDetail");
  });
  $("#studioInsert").on("click",function(){
  	$(location).attr("href","studioInsert");
  });
  $("#studioSearch").on("click",function(){
    $(location).attr("href","hostSearchStudio");
  });
});
</script>
<style>
#roomfrm{
  width:80%;
  margin-left:auto;
  margin-right:auto;
}
#roomfrm label {
  float: left;
  font-size: 24px;
  width: 100%;
}
textarea,
.input{
  width:95.7%;
}
</style>
</head>
<body>
  <jsp:include page="../common/hostHeader.jsp"></jsp:include>
  <div id="container">
    <nav id="nav">
      <ul>
        <li class = "menu" id="hostInfo">마이페이지</li>
        <li class = "menu" id="studioInsert">연습실등록</li>
        <li class = "menu" id="studioSearch">연습실조회</li>
      </ul>
    </nav>
    <form id="roomfrm" action="roomInsert" method="post" enctype="multipart/form-data">
    <fieldset>
      <legend>방 등록</legend>
      <input type="hidden" name="studio_no" value="${studio_no}">
      <input type="hidden" name="host_no" value="${host_no }">
      <label>방이름</label>
      <input type="text" class="input" name="room_name"><br>
      <label>수용인원</label>
      <input type="number" class="input" name="room_capacity"><br>
      <label>방소개</label>
      <textarea cols="30" rows="10" name="room_intro" wrap="hard"></textarea><br>
      <label>가격</label>
      <input type="number" name="room_price"><br>
      <label>방사진</label>
      <input type="file" name="room_picture"><br>
      <input type="submit" value="방등록">
      <input type="reset" value="취소">
    </fieldset>
  </form>
  </div>
</body>
</html>