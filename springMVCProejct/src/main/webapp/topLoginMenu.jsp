<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
<style type="text/css">
h3 {
	padding:15px;
	margin: 0px;
}

a {	
    padding: 25px; 
	text-decoration: none;
	color: #5a5a5a;
}

a:hover {
	color: #444;
	font-weight: bold;
} 
</style>


<!-- 세션이없을땐  sessionScope 생략 가능-->
<c:if test="${memId == null }"> 
<a href="/spring/member/loginForm">LOGIN</a> 
<a href="/spring/member/writeForm">JOIN</a>
</c:if>

<!-- 세션있을때 -->
<c:if test="${memId != null }">
	<h3>${memName }님 로그인</h3>
	<a href="/spring/member/logout">LOGOUT</a>
	<a href="/spring/member/modifyForm">회원정보수정</a>
	<a href="/spring/board/boardWriteForm">글쓰기</a>
	<a href="/spring/imageboard/imageboardWriteForm">상품등록</a>
</c:if>

<!-- 세션 상관 없이 -->
<a href="/spring/board/boardList">목록</a> <!-- pg=1 디폴트로 -->
<a href="/spring/imageboard/imageboardList">상품목록</a>

