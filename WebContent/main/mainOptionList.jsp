<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPACESTORE-상세검색</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#card {
box-shadow: 0 4px 8px 0 rgba(0,0,0,0.1);
border : 1px solid #b3b3b3;
width: 350px;
height: 330px;
display: inline-block;
transition: 0.3s;
padding:0;  
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
	
#studioimage{
width: 350px;
height: 180px;
object-fit: cover;
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
}

#topSearchIn{
margin: 0 auto;
display: inline-block;
}

#ajaxWrap{
height: 100%;
padding: 0;
margin: 0;
}

#searchTextB{
color:grey;
}

</style>

</head>

<body>

<div id="ajaxWrap">

			<c:forEach var="listall" items="${studioOption}">
				<div id="card" onclick="location.href='${pageContext.request.contextPath}/main/roomDetail?studioid=${listall.studio_no}';">
				
						<c:set var="pPath" value="${pageContext.request.contextPath}" />
						<img src="${pPath}/imageUpload/${listall.studio_picture}" id="studioimage">
				  
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

</body>
</html>