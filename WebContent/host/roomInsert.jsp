<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>방 등록</h1>
  <form action="roomInsert" method="post" enctype="multipart/form-data">
    <input type="hidden" name="studio_no" value="1">${studio_no}
    방이름<input type="text" name="room_name"><br>
    수용인원<input type="number" name="room_capacity"><br>
    방소개<textarea cols="30" rows="10" name="room_intro" wrap="hard"></textarea><br>
    가격<input type="number" name="room_price"><br>
    방사진<input type="file" name="room_picture"><br>
    <input type="submit" value="방등록">
    <input type="reset" value="취소">
  </form>
</body>
</html>