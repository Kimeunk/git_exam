<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>  
<script defer src="../js/member.js"></script>
<script>
 //성별
 window.onload=function(){ //현재 페이지를 읽으면 바로 적응; gender[0] gender[1]..이런식으로   같은 이름은 배열로 들어옴
	document.modifyForm.gender['${memberDTO.gender}'].checked = true;
	document.modifyForm.email2.value = "${memberDTO.email2}";
	document.modifyForm.tel1.value = "${memberDTO.tel1}";
 }
</script>
<style>

</style>
<form name="modifyForm" id="modifyForm">
 <h2>회원정보수정</h2>
 <hr>
 <table border="1" cellpadding="2" >
  <tr>
  	<td align="center" width="80">이름</td>					
   	<td><input type="text" name="name" id="name" size="20" value="${memberDTO.name}" placeholder="이름입력" >
    <div id="nameDiv"></div>
   	</td>
   
  </tr>
  <tr>
    <td align="center">아이디</td>
   	<td>
   		<input type="text" id="id" name="id" size="25" value="${memberDTO.id}" readonly>
   	</td>
   	</td>	
  </tr>
  <tr>
    <td align="center">비밀번호</td>
   	<td><input type="text" name="pwd" id="pwd" size="30">
   	<div id="pwdDiv"></div>
   	</td>
   	
  </tr>
  <tr>
    <td align="center">재확인</td>
   	<td><input type="text" name="rePwd" id="rePwd" size="30">
   	<div id="rePwdDiv"></div>
   	</td>
  </tr>
  <tr>
	<td align="center">성별</td>
	<td>
		<input type="radio" name="gender" value="0" >남
		<input type="radio" name="gender" value="1">여
	</td>
  </tr>
  <tr>
	<td align="center">이메일</td>
	<td>
		<input type="text" name="email1" size="15" value="${memberDTO.email1}"> 
		@ 
		<select id="email2"  type="email" name="email2"  style="width:130px;" value="${memberDTO.email2}">
			<option value = "gmail.com">gmail.com</option>
			<option value = "naver.com">naver.com</option>
			<option value = "daum.net">daum.net</option>
		</select>
	</td>
  </tr>
  <tr>
  	<td align="center">핸드폰</td>
	<td>
	 <select name="tel1" style="width:60px;" value="${memberDTO.tel1}"> 
	  <option value="010">010</option>
	  <option value="011">011</option> 
	  <option value="017">017</option>
	 </select> 
	 -
	 <input type="text" name="tel2" size="5" value="${memberDTO.tel2}">
	  -
	 <input type="text" name="tel3" size="5" value="${memberDTO.tel3}">
	</td>
  </tr>
  <tr>
	<td align="center">주소</td>
	<td>
	<input type="text" id="postcode" name="zipcode" size="5" value="${memberDTO.zipcode}" readonly>
	<input type="button" value="우편번호검색" id="checkPostBtn" ><br>
	<input type="text" id="address" name="addr1" size="50" placeholder="주소" value="${memberDTO.addr1}" readonly><br>
	<input type="text" id="detailAddress" name="addr2" size="50" value="${memberDTO.addr2}" placeholder="상세주소">
	</td>
  </tr>
  <tr>
  	<td colspan="2" align="center">
   	<input type="button" value="회원정보수정" id="modifyBtn">
	<input type="reset" value="다시작성">
	</td>
  </tr>
</table>
</form>






