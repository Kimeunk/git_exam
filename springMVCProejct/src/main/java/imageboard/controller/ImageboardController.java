package imageboard.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import imageboard.bean.ImageboardDTO;
import imageboard.service.ImageboardService;

@Controller
@RequestMapping(value = "imageboard")
public class ImageboardController {
	@Autowired
	private ImageboardService imageboardService;

	@RequestMapping(value = "imageboardWriteForm", method = RequestMethod.GET)
	public String imageboardWriteForm(Model model) {
		model.addAttribute("display", "/imageboard/imageboardWriteForm.jsp");
		return "/index";
	}

	// name="img" 1개일 경우!!!!!!!!!!!

//	  @RequestMapping(value="imageboardWrite", method=RequestMethod.POST)
//	  @ResponseBody 
//	  public void imageboardWrite(@ModelAttribute ImageboardDTO imageboardDTO,
//			  						@RequestParam MultipartFile img) { // 이미지등록완료하고 리스트로띄워주면되기때매 리턴값없음 //업로드를하면
//	  //실제폴더에 임시파일 16진수이름.tmp -> 원래이름으로 밖ㄴ다 
//	  String filePath = "C:\\Program Files\\Spring\\workspace\\springMVCProejct\\src\\main\\webapp\\storage"
//	  ; // 가상폴더의 위치 가져오기 
//	  String fileName = img.getOriginalFilename();
//	  File file = new File(filePath, fileName);
//	  
//	  //2. 가상폴더인 storage로 복사한다 // 파일 복사 // (실제파일경로를읽어가자ㅣ고, 현재이파일로출력ㅎ라) 
//	  try {
//		  FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file)); 
//	  } catch(IOException e) { 
//		  e.printStackTrace(); } 
//	  imageboardDTO.setImage1(fileName); 
//	  }
//	 

	// name="img" 2개 이상일 경우!!!!!!!!!!! 배열로 받는다 --------------------------------
	
//	  @RequestMapping(value="imageboardWrite", method=RequestMethod.POST)
//	  @ResponseBody 
//	  public void imageboardWrite(@ModelAttribute ImageboardDTO imageboardDTO,
//			  							@RequestParam MultipartFile[] img) { 
//		  // 이미지등록완료하고 리스트로띄워주면되기때매 리턴값없음 
//		  //업로드를하면실제폴더에 임시파일 16진수이름.tmp -> 원래이름으로 밖ㄴ다 
//	  String filePath ="C:\\Program Files\\Spring\\workspace\\springMVCProejct\\src\\main\\webapp\\storage"; 
//	  // 가상폴더의 위치 가져오기 String fileName; File file;
//	  
//	  //2. 가상폴더인 storage로 복사한다 // 여러개인경우알아서 알아서 for문돌리삼!!!!!!!!!!!!!! 
//	  // 파일 복사 
//	  //(실제파일경로를읽어가자ㅣ고, 현재이파일로출력ㅎ라) 
//	  if(img[0] != null) {
//		  fileName =img[0].getOriginalFilename(); file = new File(filePath, fileName);
//	  
//	  try { FileCopyUtils.copy(img[0].getInputStream(), new FileOutputStream(file)); } 
//	  catch (IOException e) { e.printStackTrace(); }
//
//	  
//	  imageboardDTO.setImage1(fileName); }else { imageboardDTO.setImage1("");
//	  //이미지없으면 이미지없다고? }
//	  
//	  if(img[1] != null) { fileName = img[1].getOriginalFilename(); file = new
//	  File(filePath, fileName);
//	  
//	  try { FileCopyUtils.copy(img[1].getInputStream(), new
//	  FileOutputStream(file)); } catch (IOException e) { e.printStackTrace(); }
//	  
//	  imageboardDTO.setImage2(fileName); //디티오에만들어줘야함 }else {
//	  imageboardDTO.setImage2(""); //이미지없으면 이미지없다고? 값이없게끔.. null넣으면 글씨까들어가 }
//	  
//	  }
	 

	// =--------------------------------------------------------------------------
	// 3번재.. 이미지여러개 멀티플로 올린거 ? 드래그해서올린거?
	// 드래그해서 한번에 여러개의 파일을 선택
	@RequestMapping(value = "imageboardWrite", method = RequestMethod.POST)
	@ResponseBody
	public void imageboardWrite(@ModelAttribute ImageboardDTO imageboardDTO,
			@RequestParam("img[]") List<MultipartFile> list) {

		String filePath = "C:\\Program Files\\Spring\\workspace\\springMVCProejct\\src\\main\\webapp\\storage"; // 가상폴더의
																												// 위치																									// file;
		for (MultipartFile img : list) {
			String fileName = img.getOriginalFilename();
			File file = new File(filePath, fileName);

			try {
				FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}

			imageboardDTO.setImage1(fileName);
			imageboardDTO.setImage2("");
			
			//DB
			imageboardService.imageboardWrite(imageboardDTO);
		}//for
	}
	
	// 이미지보드리스트 .링크타고넘어오니 GET방식
	@RequestMapping(value="imageboardList", method=RequestMethod.GET)
	public String imageboardList(@RequestParam(required=false, defaultValue="1") String pg,
								 Model model) {
		
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/imageboard/imageboardList.jsp");
		return "/index";
	}
	
	@RequestMapping(value="getImageboardList", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getImageboardList(@RequestParam String pg) {
		List<ImageboardDTO> list = imageboardService.getImageboardList(pg);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="imageboardView", method=RequestMethod.GET)
	public String imageboardView(@RequestParam String seq,
								 @RequestParam String pg,
								 Model model) {
		model.addAttribute("seq", seq);
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/imageboard/imageboardView.jsp");
		return "/index";
	}
	
	@RequestMapping(value="getImageboardView", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getImageboardView(@RequestParam String seq) {
		ImageboardDTO imageboardDTO = imageboardService.getImageboardView(seq);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("imageboardDTO", imageboardDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	
//	@RequestMapping(value="imageboardDelete", method=RequestMethod.GET)
//	public String imageboardDelete(@RequestParam String[] check, Model model) {
//		imageboardService.imageboardDelete(check);
//		
//		model.addAttribute("display", "/imageboard/imageboardDelete.jsp");
//		return "/index";
//	}
	
	@RequestMapping(value="imageboardDelete", method=RequestMethod.GET)
	public ModelAndView imageboardDelete(@RequestParam String[] check) {
		imageboardService.imageboardDelete(check);
		
		return new ModelAndView("redirect:/imageboard/imageboardList"); //바로직빵으로넘어가게,,바로 컨트롤러불러버리는
		//mvc포워딩방식이아니라 바로 보내버리게
		//근데 jsp를 안거치니 얼럿창같은게안
	}
}




	
	
	






