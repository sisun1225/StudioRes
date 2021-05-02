<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--  <script language="javascript">

function goPopup(){
  var pop = window.open("${pageContext.request.contextPath}/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
    // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
    document.form.roadFullAddr.value = roadFullAddr;
    document.form.zipNo.value = zipNo;
}
</script> -->
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
<!-- <script>
$(.input).on('keydown', function(e){
    $(input).attr('size', $(input).val().length);
});
</script> -->
<style>
#studiofrm label {
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
</style>
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
    <form id="studiofrm" action="studioInsert" method="post" enctype="multipart/form-data">
      <fieldset>
        <legend>연습실 등록</legend>
        <label>연습실 명</label>
        <input type="text" class="input" name="studio_name"><br>
        <label>연습실 사진</label>
        <input type="file" name="studio_picture"><br>
        <label>연습실 소개</label>
        <textarea cols="60" rows="20" name="studio_desc" wrap="hard"></textarea><br>
        <label>예약 시 주의사항</label>
        <textarea cols="30" rows="10" name="studio_notice" wrap="hard"></textarea><br>
      <fieldset>
        <legend>시설안내</legend>
        마이크<input type="checkbox" name="have" value="studio_have_mic">
        주차장<input type="checkbox" name="have" value="studio_have_park">
        샤워실<input type="checkbox" name="have" value="studio_have_shower">
        정수기<input type="checkbox" name="have" value="studio_have_water">
        에어컨<input type="checkbox" name="have" value="studio_have_aircon">
        히터<input type="checkbox" name="have" value="studio_have_heater">
        화장실<input type="checkbox" name="have" value="studio_have_toilet">
      </fieldset>
        <label>주변지하철</label>
        <input type="text" name="studio_subway"><br>
      <fieldset>
        <legend>주소</legend>
        <input type="text" id="postcode" placeholder="우편번호" readonly="readonly">
        <input type="button" onclick="execDaumPostcode()" value="주소 찾기"><br>
        <input type="text" id="address" name="address" placeholder="주소" readonly="readonly"><br>
        <input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
        <input type="text" id="extraAddress" placeholder="참고항목" readonly="readonly"><br>
      </fieldset>
        <input type="submit" value="등록하기">
        <input type="reset" value="취소">
      </fieldset>
    </form>
  </div>
</body>
</html>