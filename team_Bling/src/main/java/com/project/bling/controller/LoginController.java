package com.project.bling.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.bling.service.LoginService;
import com.project.bling.vo.CombineVO;

@RequestMapping(value="/Login")
@Controller
public class LoginController {

	@Autowired
	 LoginService  loginService;
	
	// 01. 로그인 화면 
	@RequestMapping(value="/main.do")
	public String main(Locale locale, Model model) throws Exception{
		
		return "login/main";	// views/login/main.jsp로 포워드
	}
	
	// 02. 로그인 처리
	@RequestMapping(value="/check.do")
	public ModelAndView loginCheck(@ModelAttribute CombineVO vo, HttpSession session) throws Exception{
		//System.out.println("로그인 컨트롤러에서 post로 받은 id : "+vo.getId());
		//System.out.println("로그인 컨트롤러에서 post로 받은 pwd : "+vo.getPwd());
		
		boolean result = loginService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if (result == true) { // 로그인 성공
			// home.jsp로 이동
			mav.setViewName("redirect:/");
			//mav.addObject("msg", "success");
		} else {	// 로그인 실패
			// main.jsp로 이동
			mav.setViewName("login/main");
			mav.addObject("msg", "failure");
		}
		return mav;
	}
	
	
	// 03. 로그아웃 처리
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpSession session){
		loginService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/main");
		mav.addObject("msg", "logout");
		return mav;
	}
}
