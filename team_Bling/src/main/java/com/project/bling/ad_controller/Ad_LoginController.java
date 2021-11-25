package com.project.bling.ad_controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.bling.ad_service.Ad_LoginService;
import com.project.bling.vo.AdminVO;

@RequestMapping(value="/Ad_login")
@Controller
public class Ad_LoginController {
	
	@Autowired
	Ad_LoginService ad_loginService;
	
	//관리자 로그인 화면
	@RequestMapping(value="/login.do")
	public String adminLogin() throws Exception{
		
		
		return "admin/Login/login1";
	}
	
	//관리자 로그인 체크(1차 비밀번호)
	@RequestMapping(value="/check1.do")
	public ModelAndView adminCheck1(@ModelAttribute AdminVO vo) throws Exception{
		//	admin/login1 으로부터 post 방식으로 id, pwd를 vo로 전달받음
		System.out.println("관리자 컨트롤러 check1 id : "+vo.getId());
		System.out.println("관리자 컨트롤러 check1 pwd1 : "+vo.getPwd1());
		
		boolean result = ad_loginService.adminCheck1(vo);
		ModelAndView mav = new ModelAndView();
		
		if(result == true) {
			mav.setViewName("admin/Login/login2");
		}
		else {
			mav.setViewName("admin/Login/login1");
			mav.addObject("msg", "failure");
		}
		
		return mav;
	}
	
	//관리자 로그인 체크(2차 비밀번호)
	@RequestMapping(value="/check2.do")
	public ModelAndView adminCheck2(@ModelAttribute AdminVO vo, HttpSession session) throws Exception{
		System.out.println("관리자 컨트롤러 check2 pwd2 : "+vo.getPwd2());
		
		boolean result = ad_loginService.adminCheck2(vo, session);
		ModelAndView mav = new ModelAndView();
		
		System.out.println("컨트롤러 check2 : "+result);
		
		if(result == true) {
			mav.setViewName("admin/Regist/regist");
		}
		else {
			mav.setViewName("admin/Login/login2");
			mav.addObject("msg", "failure");
		}
		
		return mav;
	}
	
	// 관리자 로그아웃 처리
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpSession session){
		ad_loginService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		mav.addObject("msg", "logout");
		return mav;
	}
	

}
