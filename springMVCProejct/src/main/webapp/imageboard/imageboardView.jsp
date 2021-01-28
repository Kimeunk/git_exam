<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>				
<form name="imageboardViewForm" method="post" action="">
<h3>${imageboardDTO.imageName} 상품 보기</h3>
<hr>
<table border="1" cellpadding="3" cellspacing="0" frame="hsides" rules="rows">
	<tr>
		<td rowspan="5">
		 <img width="250" height="200 "alt="image1" src="../storage/${imageboardDTO.image1}">
		</td>
	</tr>
	<tr>
		<td width="250" height="40">상품명</td>
		<td>${imageboardDTO.imageName}</td>
	</tr>
	<tr>
		<td width="250"  height="40">단가</td>
		<td>${imageboardDTO.imagePrice}</td>
	</tr>
	<tr>
		<td width="250" height="40">개수</td>
		<td>${imageboardDTO.imageQty}</td>
	</tr>
	<tr>
		<td width="250" height="40">합계</td>
		<td>
		<fmt:formatNumber pattern="##,###" value="${imageboardDTO.imagePrice*imageboardDTO.imageQty}"/>원
		</td>
	</tr>
</table>
	<input type="button" value="목록" onclick="">

</form>

