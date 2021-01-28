<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form id="boardModifyForm">

<input type="hidden" name="seq" id="seq" value="${boardDTO.seq }">
<input type="hidden" name="pg" id="pg" value="${pg }">

<h3>글수정</h3>
<hr>
<table border="1" cellpadding="3" cellspacing="0">
<tr>
<td align="center" width="60px">제   목</td>
<td>
 <input size="70" type="text" name="subject" id="subject" value="${boardDTO.subject }">
 <div id="subjectDiv" style="color: red; font-size:8pt; font-weigth:bold;"></div>
</td>
</tr>
<tr>
<td align="center">내   용</td>
<td>
 <textArea name="content" id="content" rows="20" cols="70">${boardDTO.content }</textArea>
 <div id="contentDiv" style="color: red; font-size:8pt; font-weigth:bold;"></div>
</td>
</tr>
<tr>
<td align="center" colspan="2">
 <input type="button" value="글수정" id="boardModifyBtn">
 <input type="reset" value="다시작성">
</td>
</tr>
</table>
</form>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
		$.ajax({
			type: 'post',
			url: '/spring/board/getBoard',
			data: 'seq='+$('#seq').val(),
			dataType: 'json',
			success: function(data){
				alert(JSON.stringify(data));
			
			/* 	$('#subject').val() */	
		},
			error: function(err){
				console.log(err);
			}
		});
});

$('#boardModifyBtn').click(function(){
	$('#subjectDiv').empty();
	$('#contentDiv').empty();	
	
	if($('#subject').val() == '')
		$('#subjectDiv').text('제목을 입력하세요.');
	else if($('#content').val() == '')
		$('#contentDiv').text('내용을 입력하세요.');
	else {
		$.ajax({
			type:'post',
			url: '/spring/board/boardModify',
			//수정하는거닌깐 seq알아야함 seq pg subject content
			data: $('#boardModifyForm').serialize(),
		    success: function(result){
		    	alert("글 수정 완료")
				location.href='/spring/board/boardList?pg='+$('#pg').val();
		    },
		    error: function(err){
		    	alert(err);
		    }
			
		});
		
	}
	
	
});
</script>











