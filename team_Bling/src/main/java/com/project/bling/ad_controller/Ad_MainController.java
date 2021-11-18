package com.project.bling.ad_controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value="/Ad_Main")
@Controller
public class Ad_MainController {

	// 메인페이지 이동
	@RequestMapping(value="/main.do")
	public String main(Locale locale, Model model) {
		return "admin/main";
	}
}
