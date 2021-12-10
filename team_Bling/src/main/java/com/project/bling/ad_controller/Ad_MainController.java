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
		model.addAttribute("price",ad_mainService.seventot());
		
		return "admin/Main/main";
	}
	
	//매출
	@RequestMapping(value="/price.do")
	@ResponseBody
	public Map<String,Object> price() throws Exception{
		
		
		Map<String, Object> price = new HashMap<String, Object>();
		
		List<Integer> totP = new ArrayList<Integer>();
		List<Integer> refP = new ArrayList<Integer>();
		
		int pri=0;
		int ref=0;
		
		for(int a = 0 ; a < 7 ; a++) {
			pri = ad_mainService.recenttot(a);
			totP.add(a, pri);
			ref = ad_mainService.recentref(a);
			refP.add(a, ref);
		}
		price.put("recent", totP);
		price.put("sev",ad_mainService.seventot());
		price.put("fif",ad_mainService.fifteentot());
		price.put("thi",ad_mainService.thirtytot());
		
		price.put("recentref", refP);
		price.put("sevref",ad_mainService.sevenref());
		price.put("fifref",ad_mainService.fifteenref());
		price.put("thiref",ad_mainService.thirtyref());
		
		return price;
	}
}
