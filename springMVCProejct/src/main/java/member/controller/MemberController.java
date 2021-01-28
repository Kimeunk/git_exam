package member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;
import member.service.MemberService;
@Controller
@RequestMapping(value="member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	// 로그인 폼
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public ModelAndView loginForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display","/member/loginForm.jsp"); //Q. 여기는 .jsp ?
		mav.addObject("su", 99);
		mav.setViewName("/index"); 
		return mav;
	}
	
	// 로그인
	@RequestMapping(value="/login", method=RequestMethod.POST)
	@ResponseBody //메시지컨버터에 의해 움직이도록
	public MemberDTO login(@RequestParam Map<String, String> map, HttpServletRequest request) {
		MemberDTO memberDTO = memberService.login(map); //DTO
		if(memberDTO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memId", memberDTO.getId());
			session.setAttribute("memDTO", memberDTO);
			session.setAttribute("memEmail",  memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
		}
		return memberDTO; //Q. 위에는 세션에 설정하고 이거는 js로 데이터보내주고..?
	}
	
	// 로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("memName");
		session.removeAttribute("memId");
		session.removeAttribute("memDTO");
		return "/member/logout"; //이거 제이쿼리로 받아오면 될 거 같은데 --> 강사님 코드 다시 보기!!!!
	}
	
	// 회원가입 폼
//	@RequestMapping(value="/writeForm", method=RequestMethod.GET)
//	public ModelAndView writeForm() {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("display","/member/writeForm.jsp"); //Q. 여기는 .jsp ?
//		mav.addObject("su", 99);
//		mav.setViewName("/index"); 
//		
//		return mav;
//	}
	
	// 회원가입 폼 - 수업
	@RequestMapping(value="/writeForm", method=RequestMethod.GET)
	public String writeForm(Model model) {
		model.addAttribute("display", "/member/writeForm.jsp");
		return "/index";
	}
	
	// 회원가입
	@RequestMapping(value="/write", method=RequestMethod.POST)
	@ResponseBody
	public int write(@RequestParam Map<String, String> map) {
		return memberService.write(map);
	}
	
	// 아이디 중복 체크; +출력까지 하기 위해 DTO리턴
	@RequestMapping(value="/checkId", method=RequestMethod.GET)
	@ResponseBody
	public MemberDTO checkId(@RequestParam String id) {
		return memberService.getMember(id);
	}
	
	
	// 우편번호 검색 창
	@RequestMapping(value="/checkPost", method=RequestMethod.GET)
	public String checkPost() {
		return "/member/checkPost";
	}
	
	// 우편번호 검색; 우편번호를 우편번호 검색 창에 보내야함
	@RequestMapping(value="/checkPostSearch", method=RequestMethod.POST)
	public ModelAndView checkPostService(@RequestParam Map<String, String> map) {
		List<ZipcodeDTO> list = memberService.getZipcodeList(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list); 
		mav.setViewName("jsonView"); // 인터널리소스뷰리절브(jsonView.jsp)가아닌 jsonView라는 bean의 이름을 찾게 만들 것
		return mav;
	}
	
	// 회원정보 수정 폼
	@RequestMapping(value="/modifyForm", method=RequestMethod.GET)
	public String modifyForm(HttpSession session, Model model) {
		String id = (String)session.getAttribute("memId"); //세션 값 꺼내오기
		MemberDTO memberDTO = memberService.getMember(id);
		
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("display", "/member/modifyForm.jsp");
		return "/index";
	}
	
	// 회원정보 수정 
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	@ResponseBody
	public void modify(@ModelAttribute MemberDTO memberDTO) {
		memberService.modify(memberDTO);
	}

}











