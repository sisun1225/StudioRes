<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" >


<title>SPACESTORE-당신의 열정을 응원합니다.</title>
<style>

#herecontainer{
margin:0 auto;
}

#here{
height: 100%;
margin: 0 auto;
padding : 0px;
width :1120px;
}

#card {
box-shadow: 0 4px 8px 0 rgba(0,0,0,0.1);
border : 1px solid #b3b3b3;
width: 350px;
height: 330px;
display: inline-block;
transition: 0.3s;
padding:0;
margin:10px;
float:left;
}

#card img{
width: 100%;
height: 200px;
padding :0;
margin: 0;
}

#card:hover {
box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}


#textContainer {
display:block;
word-break:break-all;
}

#studioDescClamp{
display:block;
margin: 0;
padding: 0;
white-space:nowrap;
width: 300px;
text-overflow: ellipsis;
overflow:hidden;
}


#textContainer img{
width:20px;
height:20px;
}

	
#studioimage{
width: 350px;
height: 180px;
object-fit: cover;
padding: 0;
margin: 0;
}

p{
line-height : 10px;
font-size: 15px;
}

#studioDescStyle{
font-size: 15px;
}

#searchTextA{
font-size: 20px;
text-align: left;

}


#searchTextB label{
font-size: 20px;
margin : 2px;
color :black;
}

#topSearch{
border : 1px solid #b3b3b3;
height : 110px;
text-align: center;
padding :50px;
margin: 20px;
}

#topSearchIn{
margin: 0 auto;
display: inline-block;
}

input[type=checkbox]{
width: 20px; 
height: 20px;
}

.sliderFrame, .sliderContainer{;
   margin:0;
   padding:0;
}

.sliderInner{
   display:inline-block;
   float:"left";
   margin:0;
   padding:0;
}

.sliderInner img{
   width:100%;
   height:100%;
   margin:0;
   padding:0;
}

#searchTextB{
color:grey;
}

</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
$(function(){
	$("#btn1").on("click", function() {
		
		var chkArr = [];
		  $("input[name=chk]:checked").each(function() { 
		       var chk = $(this).val();
		       chkArr.push(chk);
		       console.log(chkArr);
		    });
		
		$.ajax({
			url:"${pageContext.request.contextPath}/main/searchByOption",
			data:{"loc":$("#loc").val(),"subway":$("#subway").val(), "chkArr":chkArr},
			type:"get",
			success:function(responseData){
				$("#here").html(responseData);
			}
		});
	});
});

 $(function(){
	$("#btn2").on("click", function() {
		location.href='${pageContext.request.contextPath}/main/searchAll';
		
		
	});

}); 
 
 $(function(){
     var length = $(".sliderInner").length
     var height = $(window).height()*0.5;
     var width = $(window).width()*1.0;
     
     $(".sliderFrame").css({
        width:width+'px',
        height:height+'px',
        overflow:"hidden",
        radius : "25px"
     })
     
     $(".sliderContainer").css("width", width*length+'px')
     
     $(".sliderInner").css({
        width : width+'px',
        height : height+'px',
        
     })
     
     var moveTo = function(index){
        //매개변수를 보완합니다.
        index = index||0
        index = index % length
        
        //애니매이션으로 이동합니다.
        $(".sliderContainer").animate({
           marginLeft: -width * index +'px'
        })
        currentIndex = index;
     }
     
     var currentIndex = 0
     setInterval(function(){
        currentIndex +=1;
        moveTo(currentIndex)
     }, 1000*5)
     
     window.moveSlider = moveTo;
     
     
     $('#btn1').click(function(){
        var offset = $('#topSearch').offset();
          $('html').animate({scrollTop : offset.top}, 500);
     });

})

</script>

</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="sliderFrame">
   <div class="sliderContainer">
      <c:set var="pPath" value="${pageContext.request.contextPath }" />
      <div class="sliderInner">
        <img src="${pPath }/common/a.png"/>
      </div><div class="sliderInner">
        <img src="${pPath }/common/b.png"/>
      </div><div class="sliderInner">
        <img src="${pPath }/common/c.png"/>
      </div><div class="sliderInner">
        <img src="${pPath }/common/d.png"/>
      </div><div class="sliderInner">
        <img src="${pPath }/common/e.png"/>
      </div>
   </div>
</div>
	<div id="topSearch">
		<div id="topSearchIn">
			<span id="searchTextA">
			지하철 : <input type="text" placeholder="지하철을 입력하세요" name="subway" id="subway">
			지역 : <input type="text" placeholder="지역을 입력하세요" name="loc" id="loc">
			</span>
			<br>
			
			<span id="searchTextB">
			<label><input type="checkbox" name="chk" value="1">마이크</label>
			<label><input type="checkbox" name="chk" value="2">주차장</label>
			<label><input type="checkbox" name="chk" value="3">샤워장</label>
			<label><input type="checkbox" name="chk" value="4">정수기</label>
			<label><input type="checkbox" name="chk" value="5">에어컨</label>
			<label><input type="checkbox" name="chk" value="6">난방기</label>
			<label><input type="checkbox" name="chk" value="7">내부화장실</label>
			<input type="button" value="검색" id="btn1">
			<input type="button" name="chk" value="초기화" id="btn2">
			</span>
		</div>
	</div>
		
	<div id="herecontainer">
		<div id ="here">
			 <c:forEach var="listall" items="${searchAll}">
					<div id="card" onclick="location.href='${pageContext.request.contextPath}/main/roomDetail?studioid=${listall.studio_no}';">
					
						  <c:set var="pPath" value="${pageContext.request.contextPath}" />
						  <img src="${pPath}/imageUpload/${listall.studio_picture}">
					
						  <div id="textContainer">
						    <span id="searchTextA">${listall.studio_name}</span>
						    	<span id="searchTextB">
								    <p><img src ="images/subwayicon.png"> ${listall.studio_subway}</p> 
								    <div id="studioDescClamp">
								    <span id="studioDescStyle">${listall.studio_desc}</span> 
								    </div>
							    </span>
						    
						  </div>
					</div>
			</c:forEach>
		</div>
	</div>


<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>