<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPACESTORE-호스트_정보수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
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
#studiofrm label, 
#imageUpdate{
  float: left;
  font-size: 24px;
  width: 100%;
}
#studiofrm{
  width:80%;
  margin-left:auto;
  margin-right:auto;
}
textarea,
.input{
  width:95.7%;
}
#address{
  width:457px;
}
#photoBox{
  hight:250px;
  float:right
}
#hidden{
  display: none;
}
</style>
</head>
<body>
  <jsp:include page="../common/hostHeader.jsp"></jsp:include>
  <div id="container">
    <form name="form" id="studiofrm" method="post" action="studioUpdate" enctype="multipart/form-data">
      <fieldset>
          <legend>연습실 등록</legend>
          <label>연습실 명</label>
          <input type="text" class="input" name="studio_name" value="${studio.studio_name}"><br>
          <span id="imageUpdate">사진수정하기</span>
          <div id= "photoBox">
            <c:set var="pPath" value="${pageContext.request.contextPath }"/>
            <img src="${pPath }/imageUpload/${studio.studio_picture}"> 
          </div>
          <input type="file" name="studio_picture"><br>
          <input type="hidden" class="hidden" name="hidden_studio_picture" value="${studio.studio_picture}">
          <label>연습실 소개</label>
          <textarea cols="60" rows="20" name="studio_desc" wrap="hard">${studio.studio_desc}</textarea><br>
          <label>예약 시 주의사항</label>
          <textarea cols="30" rows="10" name="studio_notice" wrap="hard">${studio.studio_notice}</textarea><br>
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
        <label>주변지하철</label>
        <input type="text" name="studio_subway" value="${studio.studio_subway}"><br>
        <fieldset>
          <legend>주소</legend>
          <input type="text" id="postcode" placeholder="우편번호" readonly="readonly">
          <input type="button" onclick="execDaumPostcode()" value="주소 찾기"><br>
          <input type="text" id="address" name="address" placeholder="주소" value="${studio.studio_address }" readonly="readonly"><br>
          <input type="text" id="detailAddress" name="detailAddress" value="${detailAddress }">
          <input type="text" id="extraAddress" placeholder="참고항목" readonly="readonly"><br>
        </fieldset>
        <input type="hidden" class="hidden" name="studio_check" value="${studio.studio_check}">
        <input type="hidden" class="hidden" name="studio_no" value="${studio.studio_no}">  
        <div id="inputBtn">
          <input type="submit" value="수정하기">
          <input type="reset" value="취소">
        </div>
      </fieldset>
    </form>
  </div>
</body>
</html>