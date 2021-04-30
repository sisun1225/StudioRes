<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.1);
  border : 1px solid #b3b3b3;
  width: 350px;
  height: 350px;
  display: inline-block;
  transition: 0.3s;
  padding:0;  
}

#card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

#textContainer {
  padding: 10px;
  width: 320px;
  
  text-overflow:ellipsis;
  white-space:nowrap;
  overflow:hidden;
  word-break:break-all;

    margin: 0;
}
	
#studioimage{
  width: 350px;
  height: 180px;
  object-fit: cover;
}

p{
line-height : 10px;
}

#searchTextA{
font-size: 32px;
text-align: left;
}

#searchTextB{
font-size: 25px;
}

#topSearch{
border : 1px solid #b3b3b3;
height : 110px;
text-align: center;
padding :50px;
}

#topSearchIn{
/* border : 1px solid #b3b3b3; */
margin: 0 auto;
display: inline-block;
}

#ajaxWrap{
/* width:1000px; */
 height: 100%;
       padding: 0;
    margin: 0;
}


</style>



</head>

<body>

<div id="ajaxWrap">

			<c:forEach var="listall" items="${studioOption}">
				<div id="card" onclick="location.href='roomDetail?studioid=${listall.studio_no}';">
				  <img src="http://www.w-photogroup.com/default/img/mobilen/images/sub1/sub11-slide1.jpg" id="studioimage">
				  <div id="textContainer">
				    <span id="searchTextA">${listall.studio_name}</span>
				    <p>${listall.studio_subway}</p> 
				    <p>${listall.studio_desc}</p> 
				    
				  </div>
				</div>
			</c:forEach>
</div>

</body>
</html>