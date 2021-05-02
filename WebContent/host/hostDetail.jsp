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
$(function() {
  $("#hostInfo").on("click",function(){
  	$(location).attr("href","hostDetail");
  });
  $("#studioInsert").on("click",function(){
	$(location).attr("href","studioInsert");
  });
  $("#studioSearch").on("click",function(){
  	$(location).attr("href","hostSearchStudio");
  });
  $("#updateBtn").on("click", function() {
  	$(location).attr("href","hostUpdate");
  });
  $("#deleteBtn").on("click", function() {
	  $(location).attr("href","hostDelete?host_id=" + "${host.host_id}");
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
  <div id="container">
  	<form id="myfrm" action="hostUpdate">
      <fieldset>
        <legend>호스트정보</legend>
          <label>ID</label> 
          <input type="text" value="${host.host_id }"	readonly> <br> 
          <label>이름</label> 
          <input type="text" value="${host.host_name }" readonly> <br> 
          <label>핸드폰</label>
          <input type="text" value="${host.host_phone }" readonly> <br>
          <label>이메일</label>
          <input type="text" value="${host.host_email }" readonly> <br>
    	</fieldset>
    	<input type="button" id="updateBtn" value="수정하기"></button>
    	<input type="button" id="deleteBtn" name="host_id" value="삭제"></button>
  	</form>
</div>
</body>
</html>