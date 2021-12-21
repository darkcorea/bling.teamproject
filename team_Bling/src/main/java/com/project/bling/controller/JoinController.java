package com.project.bling.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bling.service.JoinService;
import com.project.bling.vo.UserVO;

@RequestMapping(value="/Join")
@Controller
public class JoinController {

	@Autowired
	JoinService joinService;
	
	//회원가입메인(아직 미정)
	@RequestMapping(value="/main.do")
	public String main(Locale locale, Model model) {
		return "join/addr";
	}
	
	//일반회원가입
	@RequestMapping(value="/normal.do")
	public String normal(Locale locale,Model mode) {
		return "join/normal";
	}
	
	//회원가입시 정보들 db에 저장
	@RequestMapping(value="/value.do", method = RequestMethod.POST)
	public String insert(Locale locale,Model model,UserVO vo)throws Exception{
		//비밀번호 암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(vo.getPwd());
		vo.setPwd(securePw);
		System.out.println(securePw);
		joinService.insert(vo);
		
		return "login/main";
	}
	
	//아이디 중복확인
	@RequestMapping(value="/confirmid.do", method = RequestMethod.POST)
	@ResponseBody
	public String confirmid(Locale locale,Model model,String iddata)throws Exception{
		String data = joinService.confirmid(iddata);
		if(data==null) {
			data="yes";
		}else {
			data="no";
		}
		return data;
	}
	
	//이메일 중복확인
	@RequestMapping(value="/confirmemail.do")
	@ResponseBody
	public String confirmemail(Locale locale,Model model,String emaildata)throws Exception{
		String data = joinService.confirmemail(emaildata);
		if(data==null) {
			data="yes";
		}else {
			data="no";
		}
		return data;
	}
}