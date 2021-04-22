<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <table>
    <tr>
      <th>부서아이디</th>
      <th>부서명</th>
      <th>위치</th>
      <th>관리자</th>
    </tr>
    <c:forEach var="dept" items="${dlist }">
      <tr>
        <td>${dept.department_id }</td>
        <td>${dept.department_name}</td>
        <td>${dept.location_id }</td>
        <td>${dept.manager_id }</td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>