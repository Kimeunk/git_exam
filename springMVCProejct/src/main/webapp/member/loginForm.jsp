<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
table {
	background: #FFFFFF;
	width: 520px;
	margin: auto;
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
.loginFormTable tbody th{
	padding: 12px 0 12px 18px;
    border: 1px solid #e5e5e5;
    border-bottom-width: 0;
    color: #353535;
    text-align: left;
    font-weight: normal;
    background-color: #fff;
}
.loginFormTable td {
    padding: 12px 10px;
    border-top: 1px solid #e5e5e5;
    color: #353535;
    font-size: 12px;
    vertical-align: middle;
    word-break: break-all;
    word-wrap: break-word;
}
input[type=button]{
    display: inline-block;
    box-sizing: border-box;
    padding: 8px 55px;
    border: 1px solid transparent;
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
    color: #fff;
    background-color: #555;

}
</style>
 <form name="loginForm" id="loginForm" method="post"> 
<div class="titleArea">
<h2>Login</h2>
</div>
<div class="loginFormTable">
 <table border="1" >
 <colgroup>
 	<col style="width:150px;">
 	<col style="width:auto;">
 </colgroup>
<tbody>
  <tr>
   <th scope="row">아이디</th>
   <td><input type="text" name="loginId" id="loginId" size="20">
    <div id="loginIdDiv" style="color:red; font-size:8pt; font-weight:bold;"></div>
   	</td>
  </tr>
  
  <tr>
    <th scope="row">비밀번호</th>
   <td><input type="text" name="pwd" id="pwd" size="20">
    <div id="pwdDiv" style="color:red; font-size:8pt; font-weight:bold;"></div>
   	</td>
  </tr>
  <tr>
   <td colspan="2" align="center">
    <input type="button" value="로그인" id="loginBtn">
	<input type="button" value="회원가입" onclick="location.href='/spring/member/writeForm'">
  </tr>
</tbody>
</table>
</div>
</form>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>  
<script defer src="../js/member.js"></script> 
