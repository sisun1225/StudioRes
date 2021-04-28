<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>연습실 수정</h1>
  <form action="hostUpdateStudio" method="post">
    아이디<input type="text" name="host_id" value="${studio.studio_no }" readonly="readonly">${studio.studio_no}<br>
    비밀번호<input type="password" name="host_pw" value="${host.host_pw }"><br>
    이름<input type="text" name="host_name" value="${host.host_name }"><br>
    핸드폰<input type="text" name="host_phone" value="${host.host_phone}"><br>
    이메일<input type="text" name="host_email" value="${host.host_email }"><br>
    <input type="submit" value="수정완료">
    <input type="reset" value="취소">
  </form>
  
  <form name="form" id="form" method="post" enctype="multipart/form-data">
      연습실 번호<input type="number" name="studio_no" value="${studio.studio_no}" readonly="readonly">${studio.studio_no}
      호스트 번호<input type="number" name="host_no" value="${studio.host_no}" readonly="readonly">${studio.host_no}
      연습실 소개<textarea cols="60" rows="20" name="studio_desc" wrap="hard" value="${studio.studio_desc}"></textarea><br>
      연습실 명<input type="text" name="studio_name" value="${studio.studio_name}"><br>
      연습실 사진<input type="file" name="studio_picture" value="${studio.studio_picture}">
      연습실 영업일<input type="text" name="image" value="${studio.studio_days}">
      마이크<input type="checkbox" name="have" value="${studio.studio_days}">
      주차장<input type="checkbox" name="have" value="studio_have_park">
      샤워실<input type="checkbox" name="have" value="studio_have_shower">
      정수기<input type="checkbox" name="have" value="studio_have_water">
      에어컨<input type="checkbox" name="have" value="studio_have_aircon">
      히터<input type="checkbox" name="have" value="studio_have_heater">
      화장실<input type="checkbox" name="have" value="studio_have_toilet">
      
      <!-- studio_picture
      studio_days
      studio_notice
      studio_subway
      studio_address
      studio_check-->
      우편번호<input type="text"  style="width:100px;" id="zipNo"  name="zipNo" readonly="readonly"/> 
      <input type="button" onClick="goPopup();" value="칮아보기"/> <br>
      주소 <input type="text"  style="width:500px;" id="roadFullAddr"  name="roadFullAddr" readonly="readonly"/>
      <input type="submit" value="등록하기">
    </form>
</body>
</html>