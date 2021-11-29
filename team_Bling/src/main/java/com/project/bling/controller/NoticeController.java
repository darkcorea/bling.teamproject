package com.project.bling.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.bling.ad_service.Ad_BoardService;
import com.project.bling.domain.Criteria;
import com.project.bling.domain.PageMaker;
import com.project.bling.service.NoticeService;

@RequestMapping(value="/Notice")
@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	
	private static final String FILE_SERVER_PATH = "D:\\팀프로젝트\\팀 깃\\4\\bling.teamproject\\team_Bling\\src\\main\\webapp\\resources\\notice\\";
	
	@RequestMapping(value="/notice_main.do")
	public String main(Locale locale, Model model) throws Exception{
		String type="T";
		model.addAttribute("page",1);
		model.addAttribute("type",type);
		return "notice/notice_main";
	}
	
	@RequestMapping(value="/list.do")
	@ResponseBody
	public Map<String, Object> list(int page, String type,String keyword) throws Exception{
		int count = 0;
		int pageNum = 10;
		Criteria sc = new Criteria();
		
		count = noticeService.listcount();
		// 가져오는 글 수 10개
		sc.setPerPageNum(pageNum);
		sc.setPage(page);
		
		if(keyword != null) {
			sc.setKeyword(keyword);
			count = noticeService.searchcount(keyword);
		}
		
		System.out.println("count값"+count);
		System.out.println("토탈타입이 아닌 다른 타입확인"+type);
		
		// 페이징 하기 위해서 필요한 값들 넣음
		PageMaker pm = new PageMaker();
		pm.setScri(sc);
		pm.setTotalCount(count);
		pm.setType(type);
		
		Map<String, Object> noticelist = new HashMap<String, Object>();
		noticelist.put("pm", pm);
		
		System.out.println("<<<<<"+page);
		System.out.println("<<<<endpage"+pm.getEndPage());
		System.out.println("<<<<startpage"+pm.getStartPage());
		
		noticelist.put("totalList", noticeService.totalList(pm));
		noticelist.put("page", page);
		
		return noticelist;
	}
	
	//공지사항 detail 
	@RequestMapping(value="/detail.do")
	public String detail(Locale locale,Model model,int nidx) throws Exception{
		model.addAttribute("detail",noticeService.detail(nidx));
		return "notice/notice_detail";
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
}
