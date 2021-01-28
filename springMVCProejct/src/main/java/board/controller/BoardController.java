package board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.service.BoardService;

@Controller
@RequestMapping(value="board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	// 글 쓰기 폼
	@RequestMapping(value="/boardWriteForm", method=RequestMethod.GET)
	public ModelAndView boardWriteForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display","/board/boardWriteForm.jsp");
		mav.setViewName("/index"); 
		return mav;
	}
	
	// 글 쓰기
	@RequestMapping(value="/boardWrite", method=RequestMethod.POST)
	@ResponseBody
	public int boardWrite(@RequestParam Map<String, String> map) {
		return boardService.write(map);
	}
	
	// 글 목록 ; pg=1 디폴트로 처리(400에러)
	@RequestMapping(value="/boardList", method=RequestMethod.GET)
	public String boardList(
			@RequestParam(required=false, defaultValue="1") String pg, Model model) {		
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/board/boardList.jsp");
		return "/index";
	}

	 @RequestMapping(value="/getBoardList", method=RequestMethod.POST)
	 public ModelAndView getBoardList(@RequestParam(required=false, defaultValue="1") String pg,
			 							HttpSession session,
										 HttpServletResponse response) {
		List<BoardDTO> list = boardService.getBoardList(pg);
		
		String memId = (String)session.getAttribute("memId");
		
		//조회수 - 새로고침 방지
		if(session.getAttribute("memId") != null) {
    		Cookie cookie = new Cookie("memHit", "0");//생성
    		cookie.setMaxAge(30*60);//초 단위 생존기간
    		response.addCookie(cookie);//클라이언트에게 보내기
    	}
		
		// 페이징 처리 - 내가했던것처럼 여기서 말고 모두 디비 거치는 것은 서비스에서 해결하기.
 		BoardPaging boardPaging = boardService.boarPaging(pg);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg); // 페이지 번호는 계속 끌고감
		mav.addObject("list", list);
		mav.addObject("memId", memId);
		mav.addObject("boardPaging", boardPaging);
		mav.setViewName("jsonView"); // 제이슨으로 가야하기 때문에 
		return mav; //보드리스트.jsp로 감
		//보드리스트.js인 열로 도착 (제이쿼리를 부르기떄매 )
	 }
	 
 	// --------------------- 게시판 검색 ---------------------
	@RequestMapping(value="/getBoardSearch", method=RequestMethod.POST)
	public ModelAndView getBoardSearch(@RequestParam Map<String, String> map) {
		List<BoardDTO> list = boardService.getBoardSearch(map); //pg, searchType, keyword
		
		// 페이징 처리 ; 위의 보드펭지와 매개변수만ㄷ ㅏ름 -> 오버로딩
		BoardPaging boardPaging = boardService.boarPaging(map);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pg", map.get("pg")); //페이지 값도 실어보내야 페이지 넘길 수 있다는 ?
		mav.setViewName("jsonView");
		return mav;
	}
		
		

 	 @RequestMapping(value="/boardView", method=RequestMethod.GET)
	 public String boardView(@RequestParam(required=false, defaultValue="1") String pg, 
			 				@RequestParam String seq, 
			 				Model model) {
 		 model.addAttribute("pg", pg);
 		model.addAttribute("seq", seq);
		model.addAttribute("display", "/board/boardView.jsp");
		return "/index";
	 }
 	 
 	@RequestMapping(value="getBoard", method=RequestMethod.POST)
 	public ModelAndView getBoard(@RequestParam String seq,
 								 @CookieValue(value="memHit", required=false) Cookie cookie,
 								 HttpServletResponse response,
 								 HttpSession session) {
 		//조회수 - 새로고침 방지
 		if(cookie != null) {
 			boardService.hitUpdate(seq); //조회수 증가
 			cookie.setMaxAge(0); //쿠키 삭제
 			response.addCookie(cookie); //쿠키 삭제된걸 클라이언트에게 보내주기.
 		}

 		BoardDTO boardDTO = boardService.boardView(seq);
 		
 		String memId = (String)session.getAttribute("memId");

 		ModelAndView mav = new ModelAndView();
 		mav.addObject("boardDTO", boardDTO);
 		mav.addObject("memId", memId);
 		mav.setViewName("jsonView");
 		return mav;
 	}
 	
 	@RequestMapping(value="boardModifyForm", method=RequestMethod.POST)
 	public String boardModifyForm(@RequestParam String seq,
 									@RequestParam String pg, Model model) {
 		model.addAttribute("seq", seq);
 		model.addAttribute("pg", pg);
 		model.addAttribute("display", "/board/boardModifyForm.jsp");
 		return "/index";
 	}
 	
 	@RequestMapping(value="boardModify", method=RequestMethod.POST)
 	@ResponseBody
 	public void boardModify(@RequestParam Map<String, String> map) {
 		boardService.boardModify(map);
 	}
 	
 	//글 삭제 - seq만 필요
 	@RequestMapping(value="boardDeleteForm", method=RequestMethod.POST)
 	public String boardDeleteForm(@RequestParam String seq, Model model) {
 		//boardService.boardDelete(seq);
 		model.addAttribute("seq", seq);
 		model.addAttribute("display", "/board/boardDelete.jsp");
 		return "/index";
 	}
 	
 	@RequestMapping(value="boardDelete", method=RequestMethod.POST)
 	@ResponseBody
 	public void boardDelete(@RequestParam String seq, Model model) {
 		boardService.boardDelete(seq);
 	}
 	
 	
	@RequestMapping(value="boardReplyForm", method=RequestMethod.POST)
 	public String boardReplyForm(@RequestParam String seq,
				 				@RequestParam String pg,
				 				Model model) {
		//seq가 답글로 넘어올땐 원글번호
		model.addAttribute("pseq", seq);
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/board/boardReplyForm.jsp");
		return "/index";
	}
 	
	@RequestMapping(value="boardReply", method=RequestMethod.POST)
	@ResponseBody
 	public void boardReply(@RequestParam Map<String, String> map) {
		boardService.boardReply(map);
	
	}
 	

 	
 	
 	
 	
 	
		/*
		 * @RequestMapping(value="/getBoard", method=RequestMethod.POST) public
		 * ModelAndView getBoard(@RequestParam(required=false, defaultValue="1") String
		 * seq, HttpSession session, HttpServletResponse response,
		 * 
		 * @CookieValue(value="memHit", required=false) Cookie cookie){ //조회수- 새로고침방지
		 * if(cookie != null) { //스프링은 원하는쿠키값을 가져올수있음 memHit만
		 * boardService.hitUpdate(Integer.parseInt(seq));//조회수증가
		 * cookie.setMaxAge(0);//쿠키삭제 response.addCookie(cookie);//클라이언트에게 보내기 }
		 * 
		 * BoardDTO boardDTO = boardService.boardView(seq);
		 * 
		 * String memId = (String) session.getAttribute("memId");
		 * 
		 * 
		 * 
		 * ModelAndView mav = new ModelAndView(); mav.addObject("boardDTO", boardDTO);
		 * mav.addObject("memId", memId); mav.setViewName("jsonView"); return mav; }
		 */
 	
 	
}



