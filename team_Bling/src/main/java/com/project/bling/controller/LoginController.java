package com.project.bling.controller;

import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.bling.service.LoginService;
import com.project.bling.vo.UserVO;

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
	public ModelAndView loginCheck(@ModelAttribute UserVO vo, HttpSession session, HttpServletRequest request) throws Exception{
		
		String idd = vo.getId();
		String pwd = vo.getPwd();
		String getpwd = loginService.getpwd(idd);
		System.out.println("************"+getpwd);
		System.out.println("************"+pwd);
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		
		ModelAndView mav = new ModelAndView();
		if(encoder.matches(pwd, getpwd)) {
			System.out.println("성공");
			//넘겨받은 비밀번호와 user객체에 암호화된 비밀번호와 비교
			loginService.loginCheck(vo, session, request);
			UserVO uv = (UserVO)session.getAttribute("UserVO");
			//회원정보에서 회원번호만 선택
			int midx = uv.getMidx();
			
			loginService.final_login(midx);
			mav.setViewName("redirect:/");
			mav.addObject("msg", "success");
		}else {
			mav.setViewName("login/main");
			mav.addObject("msg", "failure");
		}
		return mav;
	}
	
	
	// 03. 로그아웃 처리
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpSession session) throws Exception{
		loginService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/main");
		mav.addObject("msg", "logout");
		return mav;
	}
	
	//아이디 찾기 페이지로 이동
	@RequestMapping(value="/idFind.do")
	public String idFind(UserVO vo) throws Exception{
		return "login/idFind";
	}
	
	//비밀번호 찾기 페이지로 이동
	@RequestMapping(value="/pwdFind.do")
	public String pwdFind(UserVO vo) throws Exception{
		return "login/pwdFind";
	}
	
	//아이디 찾기
	@RequestMapping(value="/idSearch.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String idSearch(UserVO vo) throws Exception{
		System.out.println("로그인 컨트롤러에서 이름>>>>>>>>>>"+vo.getUname());
		System.out.println("로그인 컨트롤러에서 메일>>>>>>>>>>"+vo.getEmail());
		String id = "";
		
		if(vo.getEmail() != null) {
			id = loginService.idFindEmail(vo);
		}else if(vo.getPhone() != null) {
			id = loginService.idFindPhone(vo);
		}
		
		System.out.println("로그인 컨트롤러에서 id>>>>>>>>>>"+id);
		return id;
	}
	
	@RequestMapping(value="/pwdSearch.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String pwdSearch(UserVO vo) throws Exception {
		System.out.println("로그인 컨트롤러에서 비번찾기 아이디>>>>>>>>>>"+vo.getId());
		System.out.println("로그인 컨트롤러에서 비번찾기 이름>>>>>>>>>>"+vo.getUname());
		
		StringBuffer buf =new StringBuffer();
		
		/**
			if 조건문에서 phone 데이터로 비밀번호 찾기시
			if(loginService.pwdFindEmail(vo) != null)
			else if(loginService.pwdFindPhone(vo) != null)
			
			를 사용하면 DB에서는 이미 Email 값이 입력되어 있는데
			jsp 페이지에서 사용자에 의해 입력된 값에는 email 데이터가 넘어오지 않았기 때문에 
			phone 데이터로 비밀번호 찾기를 하려하면
			java.sql.SQLException: 부적합한 열 유형: 1111
			오류가 발생함
			-> 위에서 아이디 찾기에 사용한것처럼
				사용자에 의해 입력되어 들어오는 값을 사용해야한다.
				if(vo.getEmail() != null)
				else if(vo.getPhone() != null)
				와 같이 사용해야 한다.
		**/
		
		// 랜덤 문자열로 임시 비밀번호 생성(출처 : https://thingsthis.tistory.com/18)
		if(vo.getEmail() != null) {
			Random rnd =new Random();
	
			for(int i=0;i<10;i++){
			    // rnd.nextBoolean() 는 랜덤으로 true, false 를 리턴. true일 시 랜덤 한 소문자를,
				// false 일 시 랜덤 한 숫자를 StringBuffer 에 append 한다.
			    /**
			    	rnd.nextBoolean()을 사용하면 3가지(대문자,소문자,숫자)를 사용할 수 없어서
			    	nextInt()에 범위조건을 통해 적용함.
			    	rnd.nextInt(10) : (0 ~ 9 사이의 값)
			    	
			    	출처 : https://mine-it-record.tistory.com/143
			    **/
				if(rnd.nextInt(10) < 3){
			        buf.append((char)((int)(rnd.nextInt(26))+65));
			    }else if(rnd.nextInt(10) < 6){
			        buf.append((char)((int)(rnd.nextInt(26))+97));
			    }else{
			        buf.append((rnd.nextInt(10)));
			    }
			}
		}else if(vo.getPhone() != null) {
			Random rnd =new Random();
			
			for(int i=0;i<10;i++){
			    if(rnd.nextInt(10) < 3){
			        buf.append((char)((int)(rnd.nextInt(26))+65));
			    }else if(rnd.nextInt(10) < 6){
			        buf.append((char)((int)(rnd.nextInt(26))+97));
			    }else{
			        buf.append((rnd.nextInt(10)));
			    }
			}
		}
		System.out.println("로그인 컨트롤러에서 랜덤문자열 : "+buf);
		
		//StringBuffer to String 형변환
		String temp = buf.toString();
		
		//생성한 임시 비밀번호를 UserVO에 저장
		
		
		//여기에 밑에 선언한 임시비번을 DB에 적용하는 메소드 입력하기
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(temp);
		
		vo.setPwd(securePw);
		tempPwd(vo);
		
		return temp;
	}
	
	//임시 비밀번호를 받아서 DB에 적용시키는 메소드
	public void tempPwd(UserVO vo) throws Exception {
		if(vo.getEmail() != null) {
			//회원정보를 특정하기 위해 midx 가져오기
			int midx = loginService.pwdFindEmail(vo);
			System.out.println("로그인 컨트롤러에서 폰번으로 회원번호 가져오기 : "+midx);
			//가져온 midx를 UserVO에 저장
			vo.setMidx(midx);
			//midx에 해당하는 계정에 임시 비밀번호로 변경하기
			loginService.tempPwd(vo);
		}else if(vo.getPhone() != null) {
			//회원정보를 특정하기 위해 midx 가져오기
			int midx = loginService.pwdFindPhone(vo);
			System.out.println("로그인 컨트롤러에서 폰번으로 회원번호 가져오기 : "+midx);
			vo.setMidx(midx);
			//midx에 해당하는 계정에 임시 비밀번호로 변경하기
			loginService.tempPwd(vo);
		}
	}
	
}
