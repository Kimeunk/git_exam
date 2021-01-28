<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<style>
table {
	background: #FFFFFF;
	width: 95%;
	margin: 20px;
	border: 0;
	border-spacing: 0;
	border-collapse: collapse;
	border: 1px solid #e5e5e5;
    border-top: 0;
    border-left: 0;
    border-right: 0;
}
.titleArea{
	font-family: 'Nanum Gothic';
	text-align: center;
}
tbody {
	font-family: 'Nanum Gothic';
	font-size: 12px;
	color: #353535;
}
.wrtieFormTable tbody th{
	padding: 12px 0 12px 18px;
    border: 1px solid #e5e5e5;
    border-bottom-width: 0;
    color: #353535;
    text-align: left;
    font-weight: normal;
    background-color: #fff;
}
.wrtieFormTable td {
    padding: 12px 10px;
    border-top: 1px solid #e5e5e5;
    color: #353535;
    font-size: 12px;
    vertical-align: middle;
    word-break: break-all;
    word-wrap: break-word;
}
input[type=text] {
	height: 22px;
	line-height: 22px;
	padding: 2px 4px;
	border: 1px solid #d5d5d5;
	color: #353535;
	font-size: 12px;
}
input[type=button], input[type=reset]{
	display: inline-block;
    box-sizing: border-box;
    padding: 2px 8px;
    border: 1px solid #d1d1d1;
    border-radius: 0;
    font-size: 12px;
    line-height: 18px;
    font-weight: normal;
    text-decoration: none;
    vertical-align: middle;
    word-spacing: -0.5px;
    letter-spacing: 0;
    text-align: center;
    white-space: nowrap;
    color: #353535;
    background-color: #fff;
}
</style>    

 <form name="writeForm" method="post" action="/spring/member/write">
 <div class="titleArea">
 <h2>Join us</h2>
 </div>
 <div class="wrtieFormTable">
 <table border="1">
 <colgroup>
 	<col style="width:150px;">
 	<col style="width:auto;">
 </colgroup>
 <tbody>
  <tr>
  	<th scope="row">이름<img src="../image/blueStar.png" alt="필수"/></th>
   	<td><input type="text" name="name" id="name" size="20" placeholder="이름입력">
   	<div id="nameDiv" style="color:red; font-size:8pt; font-weight:bold;"></div>
   	</td>
  </tr>
  <tr>
    <th scope="row">아이디<img src="../image/blueStar.png" alt="필수"/></th>
   	<td>
   		<input type="text" id="id" name="id" size="25" placeholder="아이디 입력">
		<input type="hidden" id="check" value="">
   		<div id="idDiv" style="color:red; font-size:8pt; font-weight:bold;"></div>
   	</td>
   	
  </tr>
  <tr>
    <th scope="row">비밀번호<img src="../image/blueStar.png" alt="필수"/></th>
   	<td><input type="text" name="pwd" id="pwd" size="30">
   	<div id="pwdDiv" style="color:red; font-size:8pt; font-weight:bold;"></div>
   	</td>
  </tr>
  <tr>
    <th scope="row">재확인<img src="../image/blueStar.png" alt="필수"/></th>
   	<td><input type="text" name="rePwd" id="rePwd" size="30">
   	<div id="rePwdDiv" style="color:red; font-size:8pt; font-weight:bold;"></div>
   	</td>
  </tr>
  <tr>
	<th scope="row">성별</th>
	<td><input type="radio" name="gender" id="gender" value="0" checked>남
	<input type="radio" name="gender" id="gender" value="1">여</td>
  </tr>
  <tr>
	<th scope="row">이메일</th>
	<td>
		<input type="text" name="email1" id="email1" size="15"> 
		@ 
		<input type="email" list="emailList" id="email2" name="email2" placeholder="직접입력">
		<datalist id="emailList">
			<option value = "gmail.com">
			<option value = "naver.com">
			<option value = "daum.net">
		</datalist>
	</td>
  </tr>
  <tr>
  	<th scope="row">핸드폰</th>
	<td>
	 <select name="tel1" id="tel1" style="width:60px;"> 
	  <option value="010">010</option>
	  <option value="011">011</option> 
	  <option value="017">017</option>
	 </select> 
	 -
	 <input type="text" name="tel2" id="tel2" size="5">
	  -
	 <input type="text" name="tel3" id="tel3" size="5">
	</td>
  </tr>
  <tr>
	<th scope="row">주소</th>
	<td><input type="text" id="zipcode" name="zipcode" size="5" readonly>
	<input type="button" value="우편번호검색" id="checkPostBtn"><br>
	<input type="text" id="addr1" name="addr1" size="50" placeholder="주소" readonly><br>
	<input type="text" id="addr2" name="addr2" size="50" placeholder="상세주소"></td>
  </tr>
  <tr>
  	<td colspan="2" align="center">
   	<input type="button" value="회원가입" id="writeBtn">
	<input type="reset" value="다시작성">
	</td>
  </tr>
 </tbody>
 </table>
 </div>
 </form>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>  
<script defer src="../js/member.js"></script> 





