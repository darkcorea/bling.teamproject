package com.project.bling.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.bling.service.AddrService;

@RequestMapping(value="/Addr")
@Controller
public class AddrController {

	@Autowired
	AddrService addrService;
	
	@RequestMapping(value="/main.do")
	public String main(Locale locale, Model model) {
		return "addr/main";
	}
}
