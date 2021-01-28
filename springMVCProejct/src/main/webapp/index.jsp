<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!-- 인덱스라는파일명은 생략가능하기때문에 메인화면에 index를 많이 씀 -->
<html>
<head>
<meta charset="UTF-8">
<title>EUNKYUNG 웹 페이지</title>
<!-- <link rel="stylesheet" href="css/index.css"> webapp/ ?--> 
<!-- 스위퍼 사용 -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<body>
<div id=wrap>
<!-- header -->
<div id="header">
	<div class="inner">
		<!-- 탑로고 + 회원관련 탑 메뉴 -->
		<div class="topArea"> 
			<h1 class="logotop">
				<a href="http://localhost:8080/spring/">EUNKYUNG</a>
			</h1>
			<div class="toplogin">
				<jsp:include page="topLoginMenu.jsp" />
			</div>
		</div>
	</div>
	
</div>
<hr class="layout"> 

<!-- container -->
<div id="container">
	<div id="mainSection">
		<c:if test="${empty display }">
			<!-- 대문이미지 -->
			<!-- Slider main container --> 
			 <div class="swiper-container">
			    <div class="swiper-wrapper">
			      <div class="swiper-slide"><img src="image/slide3.jpg" height="400"></img></div>
			      <div class="swiper-slide"><img src="image/slide2.jpg" height="400"></img></div>
			      <div class="swiper-slide"><img src="image/slide1.jpg" height="400"></div>
			    </div>
			       <!-- Add Pagination -->
		   		<div class="swiper-pagination"></div>
			 </div> <!-- //swiper-container -->
		</c:if>
		<c:if test="${not empty display}"> 
			<div id="section">
			<jsp:include page="${requestScope.display }"/> 
			</div> <!-- //section -->
		</c:if> 
	</div> <!-- //mainsection -->
</div> <!-- //container -->

<hr class="layout">
<!-- footer -->
<div id="footer">
	<p>f o o t e r</p>
</div>
</div>
<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- Initialize Swiper -->
<script>
var swiper = new Swiper('.swiper-container', {
  pagination: {
    el: '.swiper-pagination',
  },
});
</script>
</body>
</html>




