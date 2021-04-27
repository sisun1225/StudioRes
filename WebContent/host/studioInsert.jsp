<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script>
 $(function(){
 });
 </script>
 <script language="javascript">

function goPopup(){
  var pop = window.open("popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
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
    <h1>연습실 등록</h1>
    
    <form name="form" id="form" method="post">
      HOST_NO
      연습실 명<input type="text" name="studio_name"><br>
      연습실 소개<textarea cols="60" rows="20" name="studio_desc" wrap="hard"></textarea><br>
      핸드폰<input type="text" name="host_phone"><br>
   	  이메일<input type="text" name="host_email"><br>
      마이크<input type="checkbox" name="have" value="studio_have_mic">
      주차장<input type="checkbox" name="have" value="studio_have_park">
      샤워실<input type="checkbox" name="have" value="studio_have_shower">
      정수기<input type="checkbox" name="have" value="studio_have_water">
      에어컨<input type="checkbox" name="have" value="studio_have_aircon">
      히터<input type="checkbox" name="have" value="studio_have_heater">
      화장실<input type="checkbox" name="have" value="studio_have_toilet">
      
      <!-- studio_picture
      studio_days
      studio_notice
      studio_subway
      studio_address
      studio_check-->
      우편번호<input type="text"  style="width:100px;" id="zipNo"  name="zipNo" readonly="readonly"/> 
      <input type="button" onClick="goPopup();" value="칮아보기"/> <br>
      주소 <input type="text"  style="width:500px;" id="roadFullAddr"  name="roadFullAddr" readonly="readonly"/>
      <input type="submit" value="등록하기">
    </form>
    
</body>
</html>