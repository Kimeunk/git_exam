<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 넘어온 seq 넘겨주기위해서 히든 -->
<input type="hidden" id="seq" value="${seq }">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/spring/board/boardDelete',
		data: 'seq='+$('#seq').val(),
		success: function(){
			alert("글 삭제 완료");
			location.href="/spring/board/boardList";
		},
		error: function(err){
			console.log(err);
		}
	});
});	

</script>

