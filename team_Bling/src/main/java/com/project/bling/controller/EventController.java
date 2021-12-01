package com.project.bling.controller;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bling.domain.Criteria;
import com.project.bling.domain.PageMaker;
import com.project.bling.service.EventService;

@RequestMapping(value="/Event")
@Controller
public class EventController {

	@Autowired
	EventService eventService;
	
	@RequestMapping(value="/main.do")
	public String main(Locale locale, Model model) {
		return "event/event_main";
	}
	
	//이벤트 게시글 에이작스 리스트
	@RequestMapping(value="/eventlist.do")
	@ResponseBody
	public Map<String, Object> eventlist(int page,int types) throws Exception{
		
		//옵션마다 개수
		int count = 0;
		String type = null;
		if(types == 1) {
			type = "tot";
			 count = eventService.eventCount_tot();
		}else if(types == 2) {
			type = "ing";
			 count = eventService.eventCount_ing();
		}else if(types == 3) {
			type = "end";
			 count = eventService.eventCount_end();
		}
		
		Criteria sc = new Criteria();
		
		sc.setPerPageNum(3);
		sc.setPage(page);
		
		PageMaker pm = new PageMaker();
		pm.setScri(sc);
		pm.setTotalCount(count);
		pm.setType(type);
		
		//옵션마다 개수
		type="tot";
		int count_tot = eventService.eventCount_tot();
		type="ing";
		int count_ing = eventService.eventCount_ing();
		type="end";
		int count_end = eventService.eventCount_end();
		
		Map<String, Object> eventlist = new HashMap<String, Object>();
		
		eventlist.put("pm", pm);
		eventlist.put("totalList", eventService.eventTotal(pm));
		eventlist.put("page", page);
		eventlist.put("types", types);
		
		eventlist.put("count_tot", count_tot);
		eventlist.put("count_ing", count_ing);
		eventlist.put("count_end", count_end);
		
		return eventlist;
	}
	
	@RequestMapping(value="/detail.do")
	public String detail(Locale locale,Model model,int eidx) throws Exception{
		model.addAttribute("detail",eventService.detail(eidx));
		return "event/event_detail";
	}
}
