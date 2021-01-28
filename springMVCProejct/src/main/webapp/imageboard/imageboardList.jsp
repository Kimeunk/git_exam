<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
#currentPaging {
	color: red;
	text-decoration: underline;
	cursor: pointer;
}
#paging {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
<form id="imageboardListForm" method="get" action="imageboardDelete">
<input type="hidden" name="pg" value="${pg }">
	<table id="imageboardListTable" border="1" cellpadding="3" cellspacing="0" frame="hsides" rules="rows">
		<tr>
			<td width="70" align="center"><input type="checkbox" id="all">번호</td>
			<td width="150" align="center">이미지</td>
			<td width="170" align="center">상품명</td>
			<td width="100" align="center">단가</td>
			<td width="100" align="center">개수</td>
			<td width="100" align="center">합계</td>
		</tr>
	</table>
<div style="float:left;">
	<input type="button" value="선택삭제" id="choiceDeleteBtn">
</div>

<div style="display:inline-block; width:700px; text-align:center;">
</div>	
</form>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>  
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/spring/imageboard/getImageboardList',
		data: 'pg=${pg}',
		dataType: 'json',
		success : function(data){
			console.log(data);
			
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{
					align: 'center',
					text: items.seq
					
					}).prepend($('<input/>',{
						type: 'checkbox',
						name: 'check',
						value: items.seq
					}))
				).append($('<td/>',{
					align: 'center',
					
					}).append($('<img/>',{
						src: '/spring/storage/'+items.image1,
						style: 'width: 70px; height: 70px; cursor: pointer;',
						class: items.seq+''
					}))
				).append($('<td/>',{
					align: 'center',
					text: items.imageName
					
				})).append($('<td/>',{
					align: 'center',
					text: items.imagePrice.toLocaleString()
					
				})).append($('<td/>',{
					align: 'center',
					text: items.imageQty
					
				})).append($('<td/>',{
					align: 'center',
					text: (items.imagePrice * items.imageQty).toLocaleString()
					
				})).appendTo($('#imageboardListTable'));  
				
				//이미지 보기
				$('.'+items.seq).click(function(){
					location.href = '/spring/imageboard/imageboardView?seq='+items.seq+'&pg='+data.pg;            
				});
			});//each
			
			//패이징 처리
			$('#imageboardPagingDiv').html(data.imageboardPaging.pagingHTML);
		},
		error: function(err){
			console.log(err);
		}
	});
});

function imageboardPaging(pg){
	location.href="imageboardList.do?pg="+pg;
}

// 전체 선택 or 해제
$('#all').click(function(){
	//alert($('all').attr('checked')); - checked 속성이없어서 undefind
	//alert($('all').prop('checked')); //true, false
	
	if($('#all').prop)
		$('input[name=check]').prop('checked', true);//트루로 속성을 줘라
	else
		$('input[name=check]').prop('checked', false);
});

// 선택 삭제
$('#choiceDeleteBtn').click(function(){
	let count = $('input[name=check]:checked').length;
	
	if(count == 0)
		alert('삭제할 항목을 선택해주세요');
	else{
		if(confirm('정말로 삭제하시겠습니까?')){
			$('#imageboardListForm').submit();
		}
	}
		
	
});





</script>

<!-- 
//prop , att
attr()
- HTML에 작성된 속성값을 문자열로 받아온다

prop()
- 자바스크립트의 프로퍼티(속성)를 가져온다
- 자바스크립트의 프로퍼티 값이 넘어오므로 boolean, date, function등을 가져올 수 있다  

[형식]
prop(key) 	     -> 속성값을 가져온다
prop(key, value) -> 속성값을 추가한다

[exam04.html]
<p>
	<a href="#">LINK</a>
</p>
<p>
	<script>
		document.write("attr = "+$('a').attr('href')); //# , 속성의값을문자열로
		document.write("<br>");
		document.write("prop = "+$('a').prop('href')); //href가 지니는 스크립트의 값 , 주소가 출력됨 - http://localhost:8080/spring/exam/exam04.html
	</script>
</p>
 -->







