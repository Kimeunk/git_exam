<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/member.css">
</head>
<body>
<form id="checkPostForm"> 
<table id="checkPostTable" border="1" width="100%" cellpadding="2" cellspacint="0">
<tr>
	 <td width="100" align="center">시도</td>
	 <td>
	 	<select name="sido" id="sido" style="width:100px;"> 
	 	<option >시도선택</option>
		<option value="서울">서울</option>
		<option value="인천">인천</option>
		<option value="대전">대전</option>
		<option value="대구">대구</option>
		<option value="울산">울산</option>
		<option value="세종">세종</option>
		<option value="광주">광주</option>
		<option value="경기">경기</option>
		<option value="강원">강원</option>
		<option value="전남">전남</option>
		<option value="경남">경남</option>
		<option value="경북">경북</option>
		<option value="충남">충남</option>
		<option value="충북">충북</option>
		<option value="부산">부산</option>
		<option value="제주">제주</option>
		</select></td>
	 <td>시.군.구</td>
	 <td><input type="text" name="sigungu" id="sigungu" size="20" ></td>
</tr>
<tr>
	 <td align="center">도로명</td>
	 <td colspan="3">
	 <input type="text" name="roadname" id="roadname" size="30" >
	 <input type="button" id="searchPostBtn" value="검색">
	 </td>
<tr>
	 <td align="center">우편번호</td>
	 <td colspan="3" align="center">주소</td>
</tr>

<%-- 
이거써도되지만 제이쿼리로 바꿀 것
<c:if test="${requestScope.list!=null}">
	<c:forEach var="zipcodeDTO" items="${list}">
	<c:set var="address">
	${zipcodeDTO.sido } ${zipcodeDTO.sigungu} ${zipcodeDTO.yubmyundong} ${zipcodeDTO.ri} ${zipcodeDTO.roadname} ${zipcodeDTO.buildingname}
	
	</c:set> <!-- 변수설정;value로 써도 되고 --><!-- 메소드를 변수명처럼 쓸 수 있다(한글파일참고)  한번에 쭉 써야함.. 엔터값(공백)있으면 에러나 -->
	 	<tr>
	 		<td align="center">${zipcodeDTO.zipcode }</td>	
	 		<td colspan="3">
				<a id="addressA" href="#" onclick="checkPostClose('${zipcodeDTO.getZipcode() }', '${address }')">
				${address}</a>
			</td>	
	 	</tr>
	</c:forEach>
</c:if> --%>
	

</table>
</form>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>  
<script defer src="../js/member.js"></script> 
</body>
</html>