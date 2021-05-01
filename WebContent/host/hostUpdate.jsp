<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
</head>
<body>
  <jsp:include page="../common/hostHeader.jsp"></jsp:include>
  <nav id="nav">
    <ul>
      <li class = "menu" id="hostInfo">마이페이지</li>
      <li class = "menu" id="studioInsert">연습실등록</li>
      <li class = "menu" id="studioSearch">연습실조회</li>
    </ul>
  </nav>
  <form id="myfrm" action="hostUpdate" method="post">
  <fieldset>
    <legend>호스트 수정</legend>
    <label>아이디</label>
    <input type="text" name="host_id" value="${host.host_id }" readonly="readonly"><br>
    <label>비밀번호</label>
    <input type="password" name="host_pw" value="${host.host_pw }"><br>
    <label>이름</label> <input type="text" name="host_name" value="${host.host_name }"><br>
    <label>핸드폰</label>
    <input type="text" name="host_phone" value="${host.host_phone}"><br>
    <label>이메일</label>
    <input type="text" name="host_email" value="${host.host_email }"><br>
    <input type="submit" value="수정완료"> <input type="reset" value="취소">
  </fieldset>
  </form>
</body>
</html>