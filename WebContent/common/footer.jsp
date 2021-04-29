<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	
	<div id="footer">
		<c:set var="apppath" value="${pageContext.request.contextPath}"></c:set>

		<a href="${apppath}/main/searchAll"> <img id="logo"
			src="${apppath}/common/spacestore.png" alt="로고자리">
		</a>
		<p id="gasan">KOSTA</p>
		<ul>
			<p>상호명: 주식회사 밥뜨랑 공동대표: 박태웅 윤종무 최한길 김현유</p>
			<p>영업소재지: 서울특별시 금천구 가산디지털1로 151 2층 밥뜨랑</p>
			<p>대표전화:1544-1234</p>
			<p>공간에 대한 문의사항은 해당 공간 호스트에게 직접 문의해주세요.</p>
			<p>자사는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 공간 거래정보 및 거래에 대해 책임지지
				않습니다.</p>
			<br>
			<p>&copy; 밥뜨랑</p>

		</ul>
	</div>
</body>
</html>