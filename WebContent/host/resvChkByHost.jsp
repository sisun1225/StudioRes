<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function() {
	$("#resvChk").submit();
});
</script>
</head>
<body>
 <form id="resvChk" action="resvSearchByHost" method="post">
  <input type="hidden" name="studio_id" value="${studio_id}">
 </form>
</body>
</html>