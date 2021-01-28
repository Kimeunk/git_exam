package board.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class BoardPaging {
	private int currentPage;//현재페이지
	private int pageBlock;//[이전][1][2][3][다음]
	private int pageSize;//1페이지 당 5개씩
	private int totalA;//총 글 수 
	private StringBuffer pagingHTML;//StringBuffer는 편집이 가능
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		int totalP = (totalA + (pageSize-1)) / pageSize; //총 페이지 수
		
		int startPage = (currentPage-1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if(endPage > totalP) endPage = totalP;
		
		if(startPage > 1)
	        pagingHTML.append("[<span id='paging' onclick='boardPaging("+(startPage-1)+")'>이전</span>]");
		for(int i=startPage; i<=endPage; i++) {
			if(i == currentPage)
			      pagingHTML.append("[<span id='currentPaging' onclick='boardPaging("+i+")'>"+i+"</span>]");
			else
				 pagingHTML.append("[<span id='paging' onclick='boardPaging("+i+")'>"+i+"</span>]");
													//누르면 보드페이징(자바스크립트코드적어놓은거)호출
		}//for
		
		
		if(endPage < totalP)
			//pagingHTML.append("[<a id='paging' href='boardList.do?pg="+(endPage+1)+"'>다음</a>]");
			 pagingHTML.append("[<span id='paging' onclick='boardPaging("+(endPage+1)+")'>다음</span>]");

		
	}
}
