package com.project.bling.ad_controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.bling.ad_service.Ad_UserService;
import com.project.bling.domain.Criteria;
import com.project.bling.domain.PageMaker;

@RequestMapping(value="/Ad_user")
@Controller
public class Ad_UserController {
	
	@Autowired
	Ad_UserService ad_userService;
	
	@RequestMapping(value="/userList.do")
	public String userList(Locale locale, Model model,int page,String grade) throws Exception {
		
		ad_userService.update_grade();
		
		Criteria sc = new Criteria();
		sc.setPerPageNum(20);
		sc.setPage(page);
		
		PageMaker pm = new PageMaker();
		pm.setScri(sc);
		pm.setGrade(grade);
		
		int userCount = ad_userService.userCount(grade);
		pm.setTotalCount(userCount);
	
		model.addAttribute("pm", pm);
		model.addAttribute("list",ad_userService.user_list(pm));
		model.addAttribute("total",userCount);
		
		return "admin/User/userList";
	}
}
