$('#boardWriteBtn').click(function(){
	$('#subjectDiv').empty();
	$('#contentDiv').empty();	
	
	if($('#subject').val() == '')
		$('#subjectDiv').text('제목을 입력하세요.');
	else if($('#content').val() == '')
		$('#contentDiv').text('내용을 입력하세요.');
	else 
		$.ajax({
			type:'post',
			url: '/spring/board/boardWrite',
			data: { 'subject':$('#subject').val(),
				   'content':$('#content').val()},
				   
		    success: function(result){
		    	if(result != '') {
		    		alert("글 쓰기 완료")
		    		window.location.href = "/spring/board/boardList"; //목록으로 변경하기
		    	}
		    	else alert("글 쓰기 실패!!");
		    },
		    error: function(err){
		    	alert(err);
		    }
			
		});
});








/*

   }else
      window.boardWriteForm.submit();   
}

function checkBoardModify(){
	document.getElementById("subjectDiv").innerText = "";
	document.getElementById("contentDiv").innerText = "";
	
	if(document.boardModifyForm.subject.value==""){
		document.getElementById("subjectDiv").innerText = "제목을 입력하세요";
		//alert ("제목을 입력하세요");
	
   }else if(document.boardModifyForm.content.value==""){
		document.getElementById("contentDiv").innerText = "내용을 입력하세요";
      	//alert ("내용을 입력하세요");
   
   }else
      window.boardModifyForm.submit();   
}*/