//목록
$(document).ready(function(){
   $.ajax({
      type: 'post',
      url: '/spring/board/getBoardList',
      data: {'pg': $('#pg').val()},
      dataType: 'json',
      
      success: function(data){
  
         $.each(data.list, function(index, items){
            $('<tr/>').append($('<td/>',{
               align: 'center',
               text: items.seq
            })).append($('<td/>',{
               
               }).append($('<a/>',{
                  href: '#',
                  text: items.subject,
                  id: 'subjectA',
                  class: items.seq+""
               }))
            
            ).append($('<td/>',{
               align: 'center',
               text: items.id
            })).append($('<td/>',{
               align: 'center',
               text: items.hit
            })).append($('<td/>',{
               align: 'center',
               text: items.logtime
            })).appendTo($('#boardListTable'));  
            
            // 답글 이미지  prev와 before는 다름 aa바로 앞에 ;앞칸뒷칸이아님 바로 내앞으로
            for(i=0; i<items.lev; i++){
            	$('.'+items.seq).before('&emsp;');
            }
            if(items.pseq!=0){ //0번이면 원글
            	$('.'+items.seq).before($('<img/>', {
            		src: '../image/reply.gif'
            	}));
            }
            
            
            
            // 로그인 여부 확인(1); a태그 안에서 #subjectA인
            // 각각 다른 이름의 class 속성을 지정하면 이벤트가 따로 실행됨
           /* $('.'+items.seq).click(function(){
            	//alert($(this).prop('tagName'));
            	
            	if(data.memId == null){ // 단점 : 세션 아이디 공개됨..
            		alert('먼저 로그인하세요');
            	}else{
            		// 글 보려면 seq가 필요 
            		// 지금 위치 a태그 -> 부모인 td로 가야함 -> 앞에 있는(seq)형제 지간의 td로 이동 prev 의 text
            		var seq =  $(this).parent().prev().text();
            		alert(seq);
            	}
            	
            });*/// 로그인여부
            
         });//each
         
         // 로그인 여부 확인(2) - 댓글 수정할 때 아이디 다 같으면 첫번째 꺼만 먹음..질문많이하는거!!
         //					비동기라그럼. 동기식으로 바꾸면 돼 ;클릭이벤트발생하면 비동기가돼
         //					on을 쓸땐 부모.on(이벤트, 자식, 함수()) ; 부모가아닌 조상도 ㄱㅊ
         $('#boardListTable').on('click', '#subjectA', function(){
         	//alert($(this).prop('tagName'));
         	
         	if(data.memId == null){ // 단점 : 세션 아이디 공개됨..
         		alert('먼저 로그인하세요');
         	}else{
         		// 글 보려면 seq가 필요 
         		// 지금 위치 a태그 -> 부모인 td로 가야함 -> 앞에 있는(seq)형제 지간의 td로 이동 prev 의 text
         		let seq =  $(this).parent().prev().text();
         		let pg = data.pg; //컨트롤러서 제이슨으로 넘어왓자나
         		//alert(seq);
         		location.href = '/spring/board/boardView?seq='+seq+"&pg="+pg;
         	}
         	
         });// 로그인 여부
         
         // 로그인 여부 끝나느 시점에서 페이징 처리, text가아닌 html로 걸어야 span태그도나옴 
         $('#boardPagingDiv').html(data.boardPaging.pagingHTML);

      },
      error: function(err){
         console.log(err);
      }
   });
});

// -------------------  검색   -------------------
$('#boardSearchBtn').click(function(event, str){
	if(str != 'research') $('input[name=pg]').val(1); //직접 검색버튼을 눌렀을 때
	
	if($('#keyword').val() == ''){
		alert('검색어를 입력하세요');
	}else 
		$.ajax({
			type: 'post',
			url: '/spring/board/getBoardSearch',
			data: $('#boardSearchForm').serialize(), //pg, searchType, keyword
			dataType: 'json',
			success: function(data){
				alert(JSON.stringify(data));
				
				$('#boardListTable tr:gt(0)').remove();
				// 검색한 내용 리스트 - append 기존의 값에 붙여줌 -> 기존의 리스트 내용은 지워줘야 함
				$.each(data.list, function(index, items){
		            $('<tr/>').append($('<td/>',{
		               align: 'center',
		               text: items.seq
		            })).append($('<td/>',{
		               
		               }).append($('<a/>',{
		                  href: '#',
		                  text: items.subject,
		                  id: 'subjectA',
		                  class: items.seq+""
		               }))
		            
		            ).append($('<td/>',{
		               align: 'center',
		               text: items.id
		            })).append($('<td/>',{
		               align: 'center',
		               text: items.hit
		            })).append($('<td/>',{
		               align: 'center',
		               text: items.logtime
		            })).appendTo($('#boardListTable'));  
		            
		            // 답글 이미지  prev와 before는 다름 aa바로 앞에 ;앞칸뒷칸이아님 바로 내앞으로
		            for(i=0; i<items.lev; i++){
		            	$('.'+items.seq).before('&emsp;');
		            }
		            if(items.pseq!=0){ //0번이면 원글
		            	$('.'+items.seq).before($('<img/>', {
		            		src: '../image/reply.gif'
		            	}));
		            }
		            
		         });//each
				
				 // 페이징 처리
				$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
			},
			error: function(err){
				console.log(err);
			}
			
		});
	
	
	
});











