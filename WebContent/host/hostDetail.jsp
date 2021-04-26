<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("#deleteBtn").on("click",function(){
			location.href="hostDelete";
		});
	};);
</script>
</head>
<body>
  ${host }
  <table>
    <tr>
      <th scope="row">아이디</th>
      <td>${host.host_id }</td>
    </tr>
    <tr>
      <th scope="row">이름</th>
      <td>${host.host_name }</td>
    </tr>
    <tr>
      <th scope="row">핸드폰</th>
      <td>${host.host_phone }</td>
    </tr>
    <tr>
      <th scope="row">이메일</th>
      <td>${host.host_email }</td>
    </tr>
  </table>
  <button id="updateBtn"><a href="hostUpdate">수정하기</a></button>
  <input type="button" id="deleteBtn" name="host_id" value="${host.host_id }">
</body>
</html>