package com.project.bling.controller;

import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bling.service.EventService;

@RequestMapping(value="/Event")
@Controller
public class EventController {

	@Autowired
	EventService eventService;
	
	@RequestMapping(value="/main.do")
	public String main(Locale locale, Model model) {
		return "event/main";
	}
	
	//어드민 이벤트 따온거 
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
}
