<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script language="javascript">

function goPopup(){
  var pop = window.open("${pageContext.request.contextPath}/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
    // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
    document.form.roadFullAddr.value = roadFullAddr;
    document.form.zipNo.value = zipNo;
}
</script>
<script>
	$(function(){
		$("input[name=have]:checked").each(function(){
			$(this).val().replace("0","1");
		})
		
	});
</script>
<style>
  textarea{
    width:780px;
    height:160px;
  }
</style>
</head>
<body>
  <jsp:include page="../common/hostHeader.jsp"></jsp:include>

  <h1>연습실 수정</h1>
    
    <form name="form" id="form" method="post" action="studioUpdate" enctype="multipart/form-data">
      연습실 명<input type="text" name="studio_name" value="${studio.studio_name}"><br>
      연습실 사진<input type="file" name="studio_picture" value="${studio.studio_picture}"><br>
      연습실 소개<textarea cols="60" rows="20" name="studio_desc" wrap="hard">${studio.studio_desc}</textarea><br>
      예약 시 주의사항<textarea cols="30" rows="10" name="studio_notice" wrap="hard">${studio.studio_notice}</textarea><br>
      <fieldset>
        <legend>시설안내</legend>
        <c:choose>
        	<c:when test="${studio.studio_have_mic == 1}">
        마이크<input type="checkbox" name="have" value="studio_have_mic" checked="checked">
        	</c:when>       
        	<c:otherwise>
        마이크<input type="checkbox" name="have" value="studio_have_mic">
        	</c:otherwise>    
        </c:choose>
        <c:choose>
        	<c:when test="${studio.studio_have_park == 1}">
        주차장<input type="checkbox" name="have" value="studio_have_park" checked="checked">
        	</c:when>       
        	<c:otherwise>
        주차장<input type="checkbox" name="have" value="studio_have_park">
        	</c:otherwise>
        </c:choose>
        <c:choose>
        	<c:when test="${studio.studio_have_shower == 1}">
        샤워실<input type="checkbox" name="have" value="studio_have_shower" checked="checked">
        	</c:when>       
        	<c:otherwise>
        샤워실<input type="checkbox" name="have" value="studio_have_shower">
        	</c:otherwise>
        </c:choose>
        <c:choose>
        	<c:when test="${studio.studio_have_water == 1}">
        정수기<input type="checkbox" name="have" value="studio_have_water" checked="checked">
        	</c:when>       
        	<c:otherwise>
        정수기<input type="checkbox" name="have" value="studio_have_water">
        	</c:otherwise>
        </c:choose>
        <c:choose>
        	<c:when test="${studio.studio_have_aircon == 1}">
        에어컨<input type="checkbox" name="have" value="studio_have_aircon" checked="checked">
        	</c:when>       
        	<c:otherwise>
        에어컨<input type="checkbox" name="have" value="studio_have_aircon">
        	</c:otherwise>
        </c:choose>
        <c:choose>
        	<c:when test="${studio.studio_have_heater == 1}">
        히터<input type="checkbox" name="have" value="studio_have_heater" checked="checked">
        	</c:when>       
        	<c:otherwise>
        히터<input type="checkbox" name="have" value="studio_have_heater">
        	</c:otherwise>
        </c:choose>
        <c:choose>
        	<c:when test="${studio.studio_have_toilet == 1}">
        화장실<input type="checkbox" name="have" value="studio_have_toilet" checked="checked">
        	</c:when>       
        	<c:otherwise>
        화장실<input type="checkbox" name="have" value="studio_have_toilet">
        	</c:otherwise>
        </c:choose>
      </fieldset>
      주변 지하철<input type="text" name="studio_subway" value="${studio.studio_subway}"><br>
      우편번호<input type="text"  style="width:100px;" id="zipNo"  name="zipNo" readonly="readonly"/> 
      <input type="button" onClick="goPopup();" value="칮아보기"/> <br>
      주소 <input type="text"  style="width:500px;" id="roadFullAddr"  name="roadFullAddr" readonly="readonly" value="${studio.studio_address}"/>
      <input type="hidden" name="studio_check" value="${studio.studio_check}">
      <input type="hidden" name="studio_no" value="${studio.studio_no}">
      <input type="submit" value="수정하기">
    </form>
</body>
</html>