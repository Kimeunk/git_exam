<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
table {
	background: #FFFFFF;
	width: 65%;
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
.boardWriteTable tbody th{
	padding: 12px 0 12px 18px;
    border: 1px solid #e5e5e5;
    border-bottom-width: 0;
    color: #353535;
    text-align: left;
    font-weight: normal;
    background-color: #fff;
}
.boardWriteTable td {
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
<form name="boardWriteForm" id="boardWriteForm">
<div class="titleArea">
<h2>글쓰기</h2>
</div>
<div class="boardWriteTable">
<table border="1" cellpadding="3" cellspacing="0">
<tbody>
<tr>
	<th scope="row">제목</th>
	<td>
	<input type="text" name="subject" id="subject">
	<div id="subjectDiv" style="color:red; font-size:8pt; font-weight:bold;"></div>
	</td>
</tr>
<tr>
	<th scope="row">내용</th>
	<td>
	<textarea name="content" id="content" cols="50" rows="20"></textarea>
	<div id="contentDiv" style="color:red; font-size:8pt; font-weight:bold;"></div>
	</td>
</tr>
<tr>
<td colspan="2" align="center">
	<input type="button" value="글쓰기" id="boardWriteBtn">
	<input type="reset" value="다시작성" >
</td>
</tr>
</tbody>
</table>
</div>
</form>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>  
<script defer src="../js/board.js"></script> 
