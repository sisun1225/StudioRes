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
</head>
<body>
    <h1>연습실 등록</h1>
    
    <form name="form" id="form" method="post">
      HOST_NO
      STUDIO_DESC
      STUDIO_NAME
      STUDIO_PICTURE
      STUDIO_DAYS
      STUDIO_NOTICE
      STUDIO_SUBWAY
      STUDIO_ADDRESS
      STUDIO_CHECK
      STUDIO_HAVE_MIC
      STUDIO_HAVE_PARK
      STUDIO_HAVE_SHOWER
      STUDIO_HAVE_WATER
      STUDIO_HAVE_AIRCON
      STUDIO_HAVE_HEATER
      STUDIO_HAVE_TOILET
      우편번호<input type="text"  style="width:100px;" id="zipNo"  name="zipNo" readonly="readonly"/> 
      <input type="button" onClick="goPopup();" value="칮아보기"/> <br>
      주소 <input type="text"  style="width:500px;" id="roadFullAddr"  name="roadFullAddr" readonly="readonly"/>
      
    </form>
    
</body>
</html>