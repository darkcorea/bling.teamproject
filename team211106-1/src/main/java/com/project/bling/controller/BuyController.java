package com.project.bling.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.bling.service.BuyService;

@RequestMapping(value="/Buy")
@Controller
public class BuyController {

	@Autowired
	BuyService buyService;
	
	@RequestMapping(value="/main.do")
	public String main(Locale locale, Model model) {
		return "buy/main";
	}
}
