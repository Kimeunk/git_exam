$('#imageboardWriteBtn').click(function(){
	$('#imageIdDiv').empty();
	$('#imageNameDiv').empty();
	$('#imagePriceDiv').empty();
	$('#imageQtyDiv').empty();
	$('#imageContentDiv').empty();
	$('#image1Div').empty();
	
	if($('#imageId').val() != 'img_' || $('#imageId').val() == ''){
		$('#imageIdDiv').text('상품코드를 입력하세요');
		$('#imageIdDiv').css('color', 'red');
		$('#imageIdDiv').css('font-size', '8pt');
		$('#imageIdDiv').css('font-weight', 'bold');
	}else if($('#imageName').val() == ''){
		$('#imageNameDiv').text('상품명을 입력하세요');
		$('#imageNameDiv').css('color', 'red');
		$('#imageNameDiv').css('font-size', '8pt');
		$('#imageNameDiv').css('font-weight', 'bold');
	}else if($('#imagePrice').val() == ''){
		$('#imagePriceDiv').text('상품가격을 입력하세요');
		$('#imagePriceDiv').css('color', 'red');
		$('#imagePriceDiv').css('font-size', '8pt');
		$('#imagePriceDiv').css('font-weight', 'bold');
	}else if($('#imageQty').val() == ''){
		$('#imageQtyDiv').text('개수를 입력하세요');
		$('#imageQtyDiv').css('color', 'red');
		$('#imageQtyDiv').css('font-size', '8pt');
		$('#imageQtyDiv').css('font-weight', 'bold');
	}/*else if($('#image1').val() == ''){
		$('#image1Div').text('이미지 파일을 선택하세요');
		$('#image1Div').css('color', 'red');
		$('#image1Div').css('font-size', '8pt');
		$('#image1Div').css('font-weight', 'bold');
	}*/else{
		//(1)번 방식
		//$('#imageboardWriteForm').submit(); //action타고 넘어감
		
		//(2)번 방식-ajax 통신할 때
		//파일타입으로 멀티파트리졸버하면 시리얼라이즈가 안넘어감 
		
		// 폼안의 모든 데이터 읽어
		let formData = new FormData($('#imageboardWriteForm')[0]);
		$.ajax({
			type: 'post',
			enctype: 'multipart/form-data',
			processData: false, //데이터를 컨텐트 타입에 맞게 변환 여부
			contentType: false, //요청 컨텐트 타입
			url: '/spring/imageboard/imageboardWrite',
			data: formData,
			success: function(data){
				alert("이미지 등록 완료");
				location.href = '/spring/imageboard/imageboardList';
			},
			error: function(err){
				console.log(err);
			}	
		});
	}
});

//processData 
//- 기본값은 true
//- 기본적으로 Query String으로 변환해서 보내짐 ('변수=값&변수=값') 이런 형식
//파일전송은이런식으로보내지면안댐
//파일전송시에느 반드시 false (formData를 문자열로 변환하지 않는다)
//
//
//contentType
//- 기본적으로 "application/x-www/form/urlencoded; charset=UTF-8"
//- 파일 전송시에는 'multipart/form-data'로 전송이 될 수 있도록 false로 설정




