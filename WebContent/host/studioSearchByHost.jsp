<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>SPACESTORE-연습실조회</title>
<style>
input[type="hidden"],
.hiddenfrm{
    display:none;
  }
.studio_approve{
  color:#ac0d0d;
}
  
</style>
<script>
$(function(){
  $("table,td").css({
    "border":"2px solid black", 
    "border-collapse":"collapse"
  });
})
</script>
</head>
<body>
  <jsp:include page="../common/hostHeader.jsp"></jsp:include>
  <div id="container"> 
    <table>
      <tr>
        <td>연습실번호</td>
        <td>연습실이름</td>
        <td>영업요일</td>
        <td>주소</td>
        <td>승인여부</td>
        <td>방개수</td>
      </tr>
    	<c:set var="number" value="1"/>
      <c:forEach var="studio" items="${studiolist}">
      <tr>
        <td>${studio.studio_no}</td>
        <td>
          <a href="javascript:document.getElementById('studiodetail${number}').submit()">${studio.studio_name}</a>
          <form id="studiodetail${number}" class="hiddenfrm" action="studioDetail" method="get">
            <input type="hidden" name="studio_no" value="${studio.studio_no}">
          </form>
        </td>
        <td>${studio.studio_days}</td>
        <td>${studio.studio_address}</td>
        <c:choose>
          <c:when test="${studio.studio_check==0}">
           <td><span class="studio_approve">신청중</span></td>
          </c:when>
          <c:when test="${studio.studio_check==1}">
            <td><span class="studio_approve">승인완료</span></td>
          </c:when>
          </c:choose>
        <td>${studio.room_count }</td>
        <td>
          <button onclick="javascript:document.getElementById('roominsert${number}').submit()">방추가</button>
          <form id="roominsert${number}" class="hiddenfrm" action="roomInsert" method="get">
            <input type="hidden" name="studio_no" value="${studio.studio_no}">
          </form>
        </td>
        <td><button onclick="javascript:document.getElementById('searchres${number}').submit()">예약현황</button>
          <form id="searchres${number}" class="hiddenfrm" action="resvSearchByHost" method="post">
           <input type="hidden" name="studio_no" value="${studio.studio_no}">
           <input type="hidden" name="studio_name" value="${studio.studio_name }">
          </form>
        </td>
      </tr>
      <div style="display:none">${number = number + 1}</div>
    </c:forEach>
    </table>
  </div>
</body>
</html>