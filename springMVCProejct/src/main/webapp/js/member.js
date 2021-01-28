//로그인 유효성 검사
$('#loginBtn').click(function(){
	$('#loginIdDiv').empty();
	$('#pwdDiv').empty();
	
	if($('#loginId').val() == '')
		$('#loginIdDiv').text('아이디를 입력하세요.');
	else if($('#pwd').val() == '')
		$('#pwdDiv').text('비밀번호를입력하세요.');
	else //걍여기서 폼아이디잡고 submit해도 됨
		$.ajax({
			type:'post',
			url: '/spring/member/login',
			data: { 'id':$('#loginId').val(),
				   'pwd':$('#pwd').val()},
				   
		    success: function(result){
		    	if(result != '') {
		    		alert("로그인 완료~~")
		    		window.location.href = "/spring/";
		    	}
		    	else alert("로그인 실패!!");
		    },
		    error: function(err){
		    	alert(err);
		    }
		});
});


//회원가입 유효성 검사
$('#writeBtn').click(function(){
	$('#nameDiv').empty();
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	$('#rePwdDiv').empty();
	
	if($('#name').val() == '')
		$('#nameDiv').text('이름을 입력하세요.');
	else if($('#id').val() == '')
		$('#idDiv').text('아이디를 입력하세요.');
	//else if($('input[name=pwd]').val() == '')
	else if($('input[id=pwd]').val() == '')
		$('#pwdDiv').text('비밀번호를 입력하세요.');
	else if($('#rePwd').val() == '')
		$('#rePwdDiv').text('비밀번호를 확인하세요.');
	else if($('#pwd').val() != $('#rePwd').val())
		alert("비밀번호가 일치하지 않습니다.");
	else if($('#id').val() != $('#check').val()){
		$('#idDiv').text('중복체크');
	}
	else
		//$('form[name=writeForm]').submit(); //걍 네임으로 다넘기는
		$.ajax({
			type:'post',
			url: '/spring/member/write',
			//data: $('#writeForm').serialize(),
			data: { 'name':$('#name').val(),
					'id':$('#id').val(),
				    'pwd':$('#pwd').val(),
				    'gender':$('#gender').val(),
				    'email1':$('#email1').val(),
				    'email2':$('#email2').val(),
				    'tel1':$('#tel1').val(),
				    'tel2':$('#tel2').val(),
				    'tel3':$('#tel3').val(),
				    'zipcode':$('#zipcode').val(),
				    'addr1':$('#addr1').val(),
				    'addr2':$('#addr2').val()
					}, //$('#writeForm').serialize()
				   
		    success: function(result){
		    	if(result != 0) {
		    		alert("회원 가입 완료")
		    		window.location.href = "/spring/";
		    	}
		    	else alert("회원가입 실패");
		    },
		    error: function(err){
		    	alert(err);
		    }
		});
});


// 아이디 중복체크 - 중복체크 버튼 삭제
$('#id').focusout(function(){
	if($('#id').val() == ''){
		$('#idDiv').text('아이디를 입력하세요.');
		$('#idDiv').css('color', 'magenta');
	}else 
		$.ajax({
			type:'get', // post
			url: '/spring/member/checkId',
			data: 'id='+$('#id').val(),
				   
		    success: function(data){
		    	if(data==''){
		    		//히든으로 잡힌 체크변수에 값을 넣어줘야함
		    		$('#check').val($('#id').val());
		    		$('#idDiv').text('사용가능한 아이디');
		    		$('#idDiv').css('color', 'blue');
		    	}
		    	else {
		    		$('#idDiv').text('이미 사용중인 아이디');
		    		$('#idDiv').css('color', 'red');
		    	}
		    },
		    error: function(err){
		    	alert(err);
		    }
		    
		    //---------------
//		    dataType: 'text',
//		    success: function(data){
//		    	if(data == 'exist'){
//		    		
//		    	}else if(data=='non_exist'){
//		    		
//		    	}
//		    }
		});
	
});

// 중복체크 버튼 O
/*$('#checkIdBtn').click(function(){
	
	if($('#id').val() == '')
		$('#idDiv').text('먼저 아이디를 입력하세요.');
	else 
		$.ajax({
			type:'get',
			url: '/spring/member/checkId',
			data: 'id='+$('#id').val(),
				   
		    success: function(data){
		    	if(data=='') alert("사용 가능한 아이디입니다");
		    	else alert("이미 사용 중인 아이디입니다");
		    },
		    error: function(err){
		    	alert(err);
		    }
		});
	
});*/

// 우편번호 폼 
$('#checkPostBtn').click(function(){
	window.open("/spring/member/checkPost","asdf","width=500 height=500 scrollbars=yes");
	
});


// 우편번호 검색
$('#searchPostBtn').click(function(){
	$.ajax({
		type: 'post',
		url: '/spring/member/checkPostSearch',
		data: $('#checkPostForm').serialize(), //네임 속성의 값들을 자동으로 넘겨줌
		dataType: 'json',
		success: function(data){ //제이슨오브젝트로 데이터받음
			//alert(JSON.stringify(data));
			//어펜드로 계속 아래로 붙이도록?
			//기존에깔려있는 영역을 지우고 ㅐㅅ로운거 붙이게 
			//0 ,1 , 2행은 살리고  ; 2보다 큰거는 다제거; removechild
			$('#checkPostTable tr:gt(2)').remove();
		
			$.each(data.list, function(index, items){ //값을꺼내기윟items 아이템즈가 한줄 한뭉탱이 집코드시도시군구읍면동리
				//한 줄로 묶어서 창(회원가입)에 띄어주기 위해
				var address = items.sido + ' ' 
							+ items.sigungu + ' '
				 			+ items.yubmyundong + ' '
				 			+ items.ri + ' '
				 			+ items.roadname + ' '
				 			+ items.buildingname;
				address = address.replace(/null/g, '');  //null이라는글자를 g(전체)에서 찾는다; 정규식 표현법
				
				$('<tr/>').append($('<td/>',{
					align: 'center',
					text: items.zipcode
					
				})).append($('<td/>',{
					colspan: '3',
					}).append($('<a/>',{
						href: '#',
						id: 'addressA',
						text: address
					}))
				).appendTo($('#checkPostTable'));
			});//each
			
			$('a').click(function(){
				//alert($(this).prop('tagName')); //에이태그중에서 딱하나 클릭된 애
				$('#zipcode', opener.document).val($(this).parent().prev().text());
				$('#addr1', opener.document).val($(this).text()); //열러있는창들중에아이디가 addr1인 거에 넣어라
				$('#addr2', opener.document).focus();
				window.close();
			});
			
			
		},
		error: function(err){
			console.log(err);
		}
		
	});
});

// 회원정보수정
$('#modifyBtn').click(function(){
	$('#nameDiv').empty();
	$('#pwdDiv').empty();
	$('#rePwdDiv').empty();
	
	if($('#name').val() == ''){
		$('#nameDiv').text('이름을 입력하세요.');
		$('#nameDiv').css('color','red');
		$('#nameDiv').css('font-size','8pt');
		$('#nameDiv').css('font-weight','bold');}
	else if($('input[id=pwd]').val() == ''){
		$('#pwdDiv').text('비밀번호를 입력하세요.');
		$('#pwdDiv').css('color','red');
		$('#pwdDiv').css('font-size','8pt');
		$('#pwdDiv').css('font-weight','bold');}
	else if($('#rePwd').val() == ''){
		$('#rePwdDiv').text('비밀번호를 확인하세요.');
		$('#rePwdDiv').css('color','red');
		$('#rePwdDiv').css('font-size','8pt');
		$('rePwdDiv').css('font-weight','bold');}
	else if($('#pwd').val() != $('#rePwd').val())
		alert("비밀번호가 일치하지 않습니다.");
	else{
		$.ajax({
			type: 'post',
			url: '/spring/member/modify',
			data: $('#modifyForm').serialize(),
			success: function(){
				alert('회원정보수정완료');
				window.location.href='/spring/';
			},
			error: function(err){
				console.log(err);
			}
		});
	}
});













