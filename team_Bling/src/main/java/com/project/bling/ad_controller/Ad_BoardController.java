package com.project.bling.ad_controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.project.bling.ad_service.Ad_BoardService;
import com.project.bling.domain.Criteria;
import com.project.bling.domain.PageMaker;
import com.project.bling.vo.EventVO;
import com.project.bling.vo.NoticeVO;

@RequestMapping(value="/Ad_board")
@Controller
public class Ad_BoardController {
	
	@Autowired
	Ad_BoardService ad_boardService;
	
	/////////////////////////////////////공지사항///////////////////////////////////////
	
	//공지사항 파일, 이미지 저장 경로
	private static final String FILE_SERVER_PATH = "C:\\image\\uploadFile\\";
	
	//공지사항 게시글리스트메인
	@RequestMapping(value = "/board.do")
	public String board(Locale locale, Model model,int page,String type) throws Exception {
		model.addAttribute("page",page);
		model.addAttribute("type",type);
		//System.out.println("공지사항 게시글 리스트메인"+page+type);
		return "admin/Board/board";
	}
	
	//공지사항 게시글 에이작스 리스트
	@RequestMapping(value="/list.do")
	@ResponseBody
	public Map<String, Object> list(int page, String type,String keyword) throws Exception{
		int count;
		int pageNum = 10;
		int typenum = 0;
		Criteria sc = new Criteria();
		
		if(type.equals("T")) {
			count = ad_boardService.listcount();
			// 가져오는 글 수 10개
			sc.setPerPageNum(pageNum);
			sc.setPage(page);
			typenum = 1;
			
			if(keyword != null) {
				sc.setKeyword(keyword);
				count = ad_boardService.searchcount(keyword);
			}
			
		}else {
			count = ad_boardService.listoptioncount(type);
			// 가져오는 글 수 10개
			sc.setPerPageNum(pageNum);
			sc.setPage(page);
			typenum = 2;
			
		}
		
		// 페이징 하기 위해서 필요한 값들 넣음
		PageMaker pm = new PageMaker();
		pm.setScri(sc);
		pm.setTotalCount(count);
		pm.setType(type);
		
		Map<String, Object> noticelist = new HashMap<String, Object>();
		noticelist.put("pm", pm);
		
		if(typenum == 1) {
			noticelist.put("totalList", ad_boardService.totalList(pm));
			noticelist.put("page", page);
		}else { 
			noticelist.put("totalList", ad_boardService.optionList(pm)); 
			noticelist.put("page", page);
		}
		
		return noticelist;
	}
	
	//공지사항 글 지우기
	@RequestMapping(value="/deleteArry.do")
	@ResponseBody
	public void deletearry(@RequestParam(value="checkbox[]") List<Integer> checkbox) throws Exception {
		for(int i=0;i<checkbox.size();i++) {
			ad_boardService.deleteArr(checkbox.get(i));
			//System.out.println(">>>삭제 배열>>"+checkbox.get(i));
		}
	}
	
	//공지사항 등록란
	@RequestMapping(value="/regist.do")
	public String regist(Locale locale,Model model) throws Exception{
		return "admin/Board/regist";
	}
	
	//공지사항 내용 db에 등록
	@RequestMapping(value="/confirm.do")
	public String confirm(NoticeVO vo,HttpServletRequest request,MultipartFile file) throws Exception{
		
		String FileName=null;
		
		String orifileName = file.getOriginalFilename();
		
		//System.out.println(">>>>!!!>>>>"+orifileName);
		// 파일 업로드 
		
		if(orifileName != "") {
			// 기존 파일 이름을 받고 확장자 저장
			String ext = orifileName.substring(orifileName.lastIndexOf(".")+1);
			//System.out.println(">>>>!!!>>>>"+ext);
			
			// 이름 값 변경을 위한 설정 
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-HHmmssSSS");
			int rand = (int)(Math.random()*1000);
			
			// 파일 이름 변경
			FileName = sdf.format(System.currentTimeMillis()) + "_" + rand +"."+ ext;
			//System.out.println(">>>>>>>>>>>"+FileName);
			
			// 파일 저장
			file.transferTo(new File(FILE_SERVER_PATH + FileName));
		}else {
			FileName = null;
		}
		
		vo.setImgfile(FileName);
		
		ad_boardService.insert(vo);
		
		return "redirect:/Ad_board/board.do?page=1&type=T";
	}
	
	//에디터 이미지 서버, 스프링 폴더에 저장
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request,NoticeVO vo )  {
		
		JsonObject jsonObject = new JsonObject();
		
		// 톰캣내부경로로 저장
		String fileRoot = request.getSession().getServletContext().getRealPath("/resources/notice/");
		// 스프링 내부 폴더 경로로 저장
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-HHmmssSSS");
		int rand = (int)(Math.random()*1000);
		String savedFileName = sdf.format(System.currentTimeMillis()) + "_" + rand + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//톰캣 파일 저장
			
			
			//이게 에이작스여서 저장버튼 안눌러도 사진이 저장됨. 이걸 어떻게 해야할지 생각해야함....
			File f = new File(FILE_SERVER_PATH+savedFileName); 
			multipartFile.transferTo(f); //스프링 폴더 파일 저장
			
			
			// url에 경로 저장
			jsonObject.addProperty("url", "/resources/notice/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
			jsonObject.addProperty("imges", savedFileName);
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		
		return a;
	}
	
	//공지사항 detail 
	@RequestMapping(value="/detail.do")
	public String detail(Locale locale,Model model,int nidx) throws Exception{
		model.addAttribute("detail",ad_boardService.detail(nidx));
		return "admin/Board/detail";
	}
	
	//공지사항 detail 삭제
	@RequestMapping(value="/detail_del.do")
	@ResponseBody
	public void detail_del(Locale locale,Model model,int nidx)throws Exception{
		ad_boardService.deleteArr(nidx);
		//return "admin/Board/board";
	}
	
	
	//파일 다운로드
	@RequestMapping(value="/fileDownLoad.do") 
	public ModelAndView download(@RequestParam HashMap<Object,Object> params, ModelAndView mv) {
		String fileName = (String)params.get("fileName");
		String fullPath = FILE_SERVER_PATH + fileName;
		File file = new File(fullPath);
		
		mv.setViewName("downloadView");
		mv.addObject("downloadFile",file);
		
		return mv;
	}
	
	//공지사항 수정
	@RequestMapping(value="/bf_modify.do")
	public String ad_modify(Locale locale, Model model,int nidx) throws Exception {
		model.addAttribute("modify",ad_boardService.detail(nidx));
		return "admin/Board/modify";
	}
	
	@RequestMapping(value="/af_modify.do")
	public String af_modify(Model model,NoticeVO vo,HttpServletRequest request,MultipartFile file) throws Exception{
		
		//파일삭제(수정누르면 바로 파일 삭제)
		String files = vo.getImgfile();
		File deletefile = new File(FILE_SERVER_PATH + files);
		if(deletefile.exists()) {
			deletefile.delete();
		}
		
		//사진파일 삭제
		String imges = vo.getImges();
		File deleteimg = new File(FILE_SERVER_PATH + imges);
		if(deleteimg.exists()) {
			deleteimg.delete();
		}
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		System.out.println("사진파일 삭제>>>>>>"+imges);
		System.out.println("삭제중>>>>"+deleteimg);
		
		// 파일 업로드 
		String FileName=null;
		String orifileName = file.getOriginalFilename();
		
		if(orifileName != "") {
			// 기존 파일 이름을 받고 확장자 저장
			String ext = orifileName.substring(orifileName.lastIndexOf(".")+1);
			
			// 이름 값 변경을 위한 설정 
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-HHmmssSSS");
			int rand = (int)(Math.random()*1000);
			
			// 파일 이름 변경
			FileName = sdf.format(System.currentTimeMillis()) + "_" + rand +"."+ ext;
			
			// 파일 저장
			file.transferTo(new File(FILE_SERVER_PATH + FileName));
		}else {
			FileName = null;
		}
		
		vo.setImgfile(FileName);
		
		String editimg = vo.getEdit();
		vo.setImges(editimg);
		
		System.out.println("사진파일 저장22222>>>>>>"+editimg);
		
		ad_boardService.modify(vo);
		return "redirect:/Ad_board/detail.do?nidx="+vo.getNidx();
	}
	
	/////////////////////////////////////////이벤트////////////////////////////////////////
	
	//이벤트
	@RequestMapping(value="/event.do")
	public String event(Locale locale, Model model,int page,int type) throws Exception {
		model.addAttribute("page",page);
		model.addAttribute("type",type);
		return "admin/Board/event_board";
	}
	
	//이벤트 게시글 에이작스 리스트
	@RequestMapping(value="/eventlist.do")
	@ResponseBody
	public Map<String, Object> eventlist(int page,int type) throws Exception{
		
		
		return null;
	}
	
	//이벤트 등록
	@RequestMapping(value="/event_regist.do")
	public String event_regist(Locale locale,Model model) throws Exception{
		return "admin/Board/event_regist";
	}
	
	@RequestMapping(value="/event_regist_all.do", method = RequestMethod.POST)
	public String event_regist_all(EventVO vo,HttpServletRequest request,@RequestParam("image") MultipartFile file1,@RequestParam("banner") MultipartFile file2 ) throws Exception{
	
		String image = file1.getOriginalFilename();
		String banner = file2.getOriginalFilename();
		
		String images=null;
		String banners=null;
		
		// 파일 업로드 
		
		if(image != null) {
			// 기존 파일 이름을 받고 확장자 저장
			String ext = image.substring(image.lastIndexOf("."));
			
			// 이름 값 변경을 위한 설정 
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-HHmmssSSS");
			int rand = (int)(Math.random()*1000);
			
			// 파일 이름 변경
			images = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;
			
			// 파일 저장
			file1.transferTo(new File(FILE_SERVER_PATH + images));
		}
		if(banner != null) {
			// 기존 파일 이름을 받고 확장자 저장
			String ext = banner.substring(banner.lastIndexOf("."));
			
			// 이름 값 변경을 위한 설정 
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-HHmmssSSS");
			int rand = (int)(Math.random()*1000);
			
			// 파일 이름 변경
			banners = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;
			
			// 파일 저장
			file2.transferTo(new File(FILE_SERVER_PATH + banners));
		}
		System.out.println(vo.getEvent_start());
		System.out.println(vo.getEvent_end());
		
		System.out.println(banners);
		System.out.println(images);
		
		//vo.setBanner(banner);
		//vo.setImage(image);
		
		
		//ad_boardService.event_insert(vo);
		
		return "redirect:/Ad_board/board.do?page=1&type=T";
	}	
	
	
	
	/*       	 문의 사항          		   */
	// 관리자 문의하기 게시판 이동
	@RequestMapping(value="/question.do")
	public String question(Locale locale,Model model) throws Exception{
		
		model.addAttribute("list", ad_boardService.question_list());
		return "admin/Board/question";
	}
	
	
}
















