package board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private HttpSession session;
	//세션값 리퀘스트로부터얻어오는 것. request.getSession()으로했었음
	//세션을얻어올수있는건 컨트롤러밖에업다?는?
	@Autowired
	private BoardPaging boardPaging;
	
	@Override
	public int write(Map<String, String> map) {
		map.put("name", (String) session.getAttribute("memName")); 
		map.put("id", (String) session.getAttribute("memId"));
		map.put("email", (String) session.getAttribute("memEmail"));	
		return boardDAO.write(map);
	}
	
	// 게시판 목록
	@Override
	public List<BoardDTO> getBoardList(String pg) {
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		return boardDAO.getBoardList(map);
	}
	
	// 게시판 목록의 보드페이징 
	@Override // BoardPaging - 컴퍼넌트 설정해줘야함
	public BoardPaging boarPaging(String pg) {
		int totalA = boardDAO.getTotalA();//총글수
		boardPaging.setCurrentPage(Integer.parseInt(pg));
		boardPaging.setPageBlock(5);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
	    boardPaging.makePagingHTML(); 
		return boardPaging;
	}
	
	// 게시판  검색
	@Override
	public List<BoardDTO> getBoardSearch(Map<String, String> map) {
		int endNum = Integer.parseInt(map.get("pg"))*5;
		int startNum = endNum-4;

		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		return boardDAO.getBoardSearch(map);
	}
	
	// 게시판 검색의 페이징 처리 - 오버로드 
	@Override
	public BoardPaging boarPaging(Map<String, String> map) {
		int totalA = boardDAO.getTotalSearch(map);//총글수 - 맵퍼파일의 이름만 똑같이 노노	
		boardPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		boardPaging.setPageBlock(5);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
	    boardPaging.makePagingHTML();
		return boardPaging;
	}
	
	@Override
	public int getTotalA() {
		return boardDAO.getTotalA();
	}

	@Override
	public BoardDTO boardView(String seq) {
		return boardDAO.boardView(seq);
	}

	@Override
	public void hitUpdate(String seq) {
		boardDAO.hitUpdate(seq);	
	}
	
	@Override
	public void boardModify(Map<String, String> map) {
		boardDAO.boardModify(map);	
	}

	@Override
	public void boardDelete(String seq) {
		boardDAO.boardDelete(seq);	
	}


	@Override
	public void boardReply(Map<String, String> map) {
		//원글
		BoardDTO pDTO = boardDAO.boardView(map.get("pseq")); //원글꺼내옴
		
		//맵안에는 원글번호, pseq subject content
		map.put("id", (String)session.getAttribute("memId")); //누가글을작성하는지 세션값이 필요
		map.put("name", (String)session.getAttribute("memName"));
		map.put("email", (String)session.getAttribute("memEmail"));
		map.put("ref", pDTO.getRef()+""); //ref=원글ref
		map.put("lev", pDTO.getLev()+1 +"");//lev=원글 lev+1
		map.put("step", pDTO.getStep()+1 +"");//step=원글 step+1
		boardDAO.boardReply(map);
		
	}









}












