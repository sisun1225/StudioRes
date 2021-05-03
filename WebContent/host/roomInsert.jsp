<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPACESTORE-방추가</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
      <div id="inputBtn">
        <input type="submit" value="방등록">
        <input type="reset" value="취소">
      </div>
    </fieldset>
  </form>
  </div>
</body>
</html>