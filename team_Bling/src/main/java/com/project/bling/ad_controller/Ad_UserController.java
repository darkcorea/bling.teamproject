package com.project.bling.ad_controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.bling.ad_service.Ad_UserService;

@RequestMapping(value="/Ad_user")
@Controller
public class Ad_UserController {
	
	@Autowired
	Ad_UserService ad_userService;
	
	@RequestMapping(value="/userList.do")
	public String userList(Locale locale, Model model) throws Exception {
		
		
		return "admin/User/userList";
	}
}
