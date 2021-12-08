package com.project.bling.ad_controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.bling.ad_service.Ad_MainService;

@RequestMapping(value="/Ad_Main")
@Controller
public class Ad_MainController {

	@Autowired
	Ad_MainService ad_mainService;
	
	// 메인페이지 이동
	@RequestMapping(value="/main.do")
	public String main(Locale locale, Model model) throws Exception {
		model.addAttribute("data",ad_mainService.order());
		return "admin/main";
	}
}
