<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPACESTORE-마이페이지_호스트</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function() {
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
        <div id="inputBtn">
          <input type="button" id="updateBtn" value="수정하기"></button>
          <input type="button" id="deleteBtn" name="host_id" value="삭제"></button>
        </div>
      </fieldset>
  	</form>
</div>
</body>
</html>