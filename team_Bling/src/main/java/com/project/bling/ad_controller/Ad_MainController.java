package com.project.bling.ad_controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bling.ad_service.Ad_MainService;

@RequestMapping(value="/Ad_Main")
@Controller
public class Ad_MainController {

	@Autowired
	Ad_MainService ad_mainService;
	
	// 메인페이지 이동
	@RequestMapping(value="/main.do")
	public String main(Locale locale, Model model) throws Exception {
		//주문관리
		model.addAttribute("data",ad_mainService.order());
		//문의답변
		model.addAttribute("proq",ad_mainService.productq());
		model.addAttribute("priq",ad_mainService.privateq());
		//버튼4개
		model.addAttribute("price",ad_mainService.recenttot());
		model.addAttribute("order",ad_mainService.ordertot());
		
		model.addAttribute("newmem",ad_mainService.newmem());
		
		return "admin/Main/main";
	}
	
	//매출
	@RequestMapping(value="/price.do")
	@ResponseBody
	public Map<String,Object> price(int type) throws Exception{
		
		Map<String, Object> price = new HashMap<String, Object>();
		
		//매출
		if(type == 1) {
			price.put("recent", ad_mainService.recenttot());
			price.put("recentref",ad_mainService.recentref());
		}
		//주문
		else if(type == 2) {
			price.put("recent", ad_mainService.recenttot());
			price.put("ordertot", ad_mainService.ordertot());
			price.put("ordercount",ad_mainService.ordercount());
		}
		//방문자
		else if(type == 3) {
			
		}
		//신규회원
		else if(type == 4) {
			price.put("recentmem", ad_mainService.recentmem());
			price.put("newmem", ad_mainService.newmem());
			price.put("delmem", ad_mainService.delmem());
		}
		
		price.put("type", type);
		
		
		return price;
	}
}
