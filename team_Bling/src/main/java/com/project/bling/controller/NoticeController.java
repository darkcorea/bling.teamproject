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
	
	private static final String FILE_SERVER_PATH = "C:\\image\\uploadFile\\";
	//private static final String FILE_SERVER_PATH = "/resources/notice/";
	
	@RequestMapping(value="/notice_main.do")
	public String main(Locale locale, Model model) throws Exception{
		return "notice/notice_main";
	}
	
	@RequestMapping(value="/list.do")
	@ResponseBody
	public Map<String, Object> list(int page)throws Exception{
		int count;
		Criteria sc = new Criteria();
		count = noticeService.listcount()-7;
		sc.setPerPageNum(10);
		
		sc.setPage(page);
		if(page > 1) {
			sc.setPage(page-1);
		}
		
		PageMaker pm = new PageMaker();
		pm.setScri(sc);
		if(page>1) {
			pm.setStart(7);
		}
		pm.setTotalCount(count);
		
		Map<String, Object> noticelist = new HashMap<String, Object>();
		
		if(page == 1) {
			noticelist.put("pm", pm );
			noticelist.put("special",noticeService.special());
			noticelist.put("firstpage",noticeService.firstpage());
			noticelist.put("page", page);
		}else {
			noticelist.put("pm", pm );
			noticelist.put("totalList", noticeService.totalList(pm));
			noticelist.put("page", page);
			System.out.println("여기를 해야해");
		}
		
		System.out.println(">>>>page>>"+page);
		System.out.println(">>>>>>pm.starpage"+pm.getStartPage());
		System.out.println(">>>>>pm.endpage"+pm.getEndPage());
		
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
