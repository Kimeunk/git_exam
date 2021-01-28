<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.titleArea{
	font-family: 'Nanum Gothic';
	text-align: center;
	margin: 40px;
}
table {
	background: #FFFFFF;
	width: 85%;
	margin: auto;
	border: 0;
	border-spacing: 0;
	border-collapse: collapse;
	border: 1px solid #e5e5e5;
    border-top: 0;
    border-left: 0;
    border-right: 0;
}
th{
	font-size: 11pt;
}
td{
	font-size: 10pt;
}
tr{
	height: 45px;
}

#subjectA:link{ color:black; text-decoration:none; } 
#subjectA:visited{  color:black; text-decoration:none; }
#subjectA:hover{  color:darkgreen; text-decoration:underline;  }
#subjectA:active{  color:black; text-decoration:none;  }
#currentPaging{
	color:darkgreen;
	text-decoration:underline;
}
#paging{
	color : black;
	text-decoration:none;
}
</style>

<div class="titleArea">
<h2>글 목록</h2>
</div>
<input type="hidden" id="pg" value="${pg }"> <!-- 컨트롤러부터넘어오는값  -->
<table id="boardListTable" border="1" cellpadding="3" cellspacing="0" frame="hsides" rules="rows">
<tr>
	<th width="100">글번호</th>
	<th width="300">제목</th>
	<th width="100">작성자</th>
	<th width="70">조회수</th>
	<th width="150">작성일</th>	
</tr>
</table>

<!-- //페이징처리 -->
<div id="boardPagingDiv" class="paging" align="center">
</div>

<br><br>

<!-- 검색 창 -->
<form id="boardSearchForm">
<input type="hidden" name="pg" value="1">  
<!-- 만약 3페이지에서 검색하면 3페이지를 기본값으로 갖고가기때매;
무조건 1페이지부터 검색해야돼서
검색을 위해 무조건 일페이지로 셋팅  -->
<div style="text-align : center;">
	<select name="searchType" id="searchType"style="width:100px;">
	    <option value="subject" selected>제목</option>
	    <option value="id">아이디</option>
	</select>
	<input type="search" name="keyword" id="keyword">
	<input type="button" id="boardSearchBtn" value="검색">
</div>
</form>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>  
<script defer src="../js/boardList.js"></script> 
<script>
/* 페이지클릭하면이동함 */
function boardPaging(pg){
	var keyword = document.getElementById("keyword").value;
	if(keyword == ""){
		location.href = 'boardList?pg='+pg;	
	}else { 
		//alert("누구시죠");
		// 검색 후에 페이지 1페이지말고 2,3 페이지 누를 때의 이벤트가 검색버튼 눌렀을 때의 이벤트와 동일한.. -> trigger사용; 
		//왜냐 걍 getBoardSsearch?pg , keyword, searchtype 다 가져가는ㄱ ㅔ검색눌럿을때랑 똑같으닌깐
		//location.href = 'getBoardSearch?pg='+pg; //이게보드리스트로가면 전체글을 다끌고옴; 검색글말고
		//강제로 피쥐값을 히든의 pg값에 넣음
		$('input[name=pg]').val(pg);
		
		//강제로 이벤트를발생
		//[2]페이지에서 다시 검색버튼을 누르면 2페이지부터 찾는다
		// 다시 검색 버튼을 눌렀을 때는 1페이지에서부터 찾도록
		$('#boardSearchBtn').trigger('click', 'research'); //크릭하면 js에서 이벤트를 받고 문자열을받음
	}	
}
</script>




