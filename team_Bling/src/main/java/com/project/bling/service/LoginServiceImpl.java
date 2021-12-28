package com.project.bling.service;

import java.text.SimpleDateFormat;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

import com.project.bling.dao.LoginDAO;
import com.project.bling.session.SessionListener;
import com.project.bling.vo.UserVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginDAO loginDAO;

	// 01_01. 회원 로그인체크
	@Override
	public boolean loginCheck(UserVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		boolean result = loginDAO.loginCheck(vo);
		boolean delyn = delyn(vo);
		if (result) { // true일 경우 세션에 등록
			if(delyn == true) {
				
				/*
					세션에 저장된 UserVO 객체가 null이면 session.getAttribute("UserVO")에서
					id 필드를 NullPointerException 때문에 참조를 못 하기 때문에 밑에 따로 추가함.
				*/
				// 로그인 유지 체크 안 했을 때
				if(vo.getLoginKeep() == null) {
					UserVO vo2 = viewMember(vo);
					// 세션 변수 등록
					session.setAttribute("UserVO", vo2);
					//System.out.println("서비스 midx : "+vo2.getMidx());
				// 로그인 유지 체크했을 때
				}else {
	                // 쿠키를 생성하고 현재 로그인되어 있을 때 생성되었던 세션의 id를 쿠키에 저장한다.
					Cookie cookie =new Cookie("loginCookie", session.getId());
					// 쿠키를 찾을 경로를 컨텍스트 경로로 변경해 주고...
	                cookie.setPath("/team_Bling/");
	                int amount = 60*60*24*7;
	                // 단위는 (초)이므로 7일정도로 유효시간을 설정해 준다.
	                cookie.setMaxAge(amount);
	                // 쿠키를 적용해 준다.
	                response.addCookie(cookie);
	                
	                // DB에 저장될 쿠키에 사용할 세션의 유효기간
	                // currentTimeMills()가 1/1000초 단위임으로 1000곱해서 더해야함
	                String sessionLimit = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(System.currentTimeMillis() + (1000*amount));
	                // 현재 세션 id와 유효시간을 사용자 테이블에 저장한다.
	                UserVO vo2 = viewMember(vo);
	                System.out.println("로그인 서비스-로그인 유지 체크시 uname : "+vo2.getUname());
	                vo2.setSessionId(session.getId());
	                vo2.setSessionLimit(sessionLimit);
	                loginDAO.keepLogin(vo2);
	                
	                session.setAttribute("UserVO", vo2);   
				}
	            
				//session.setAttribute("userId", vo2.getId());

				//	getSessionidCheck(String type, String compareId)
				//	-> String type으로 "userId"가 대입되고, String compareId로 vo.getId()가 대입된다.
				//	vo.getId()는 로그인창(jsp화면)->로그인 컨트롤러->로그인 서비스로 전달된 즉, 입력된 id이다.
				SessionListener.getSessionidCheck("userId", vo.getId());
				
				// 쿠키 리셋(중복 로그인시 쿠키 초기화) 불필요 한듯
				// 위에 이미 로그인 체크를 해서 로그인을 하면 세션이 새로 들어가는데 왜 아래에서 세션 정보를 업데이트 하는거지?
				
				/**
					session.setAttribute("userId", vo.getId());가
					SessionListener.getSessionidCheck("userId", vo.getId()); 보다 위에 위치하면
					로그인 하자마자 로그아웃 시킨다.
				**/
				session.setAttribute("userId", vo.getId());
				//세션 유지시간(초 단위)
				session.setMaxInactiveInterval(60 * 60);
			}else {
				result = false;
			}
		} 
		return result;
	}
	
	@Override
	public boolean delyn(UserVO vo) throws Exception {
		return loginDAO.delyn(vo);
	}
	
	
	
	// 01_02. 회원 로그인 정보
	@Override
	public UserVO viewMember(UserVO vo) throws Exception{

		return loginDAO.viewMember(vo);
	}
	
	// 02. 회원 로그아웃
	@Override
	public void logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
		UserVO vo = (UserVO)session.getAttribute("UserVO");
			
		//쿠키를 가져와서
        Cookie loginCookie = WebUtils.getCookie(request,"loginCookie");
        if ( loginCookie !=null ){
            // null이 아니면 존재하면!
            loginCookie.setPath("/team_Bling/");
            // 쿠키는 없앨 때 유효시간을 0으로 설정하는 것 !!! invalidate같은거 없음.
            loginCookie.setMaxAge(0);
            // 쿠키 설정을 적용한다.
            response.addCookie(loginCookie);
             
            // DB에 있는 쿠키 정보에 null값 입력
            vo.setSessionId(session.getId());
            vo.setSessionLimit("0");
            loginDAO.keepLogin(vo);
        }
        
		// 세션 변수 개별 삭제
		session.removeAttribute("userId");
		session.removeAttribute("UserVO");
		//세션을 모두 초기화시킴
		session.invalidate();
	}
	
	@Override
	public String idFindEmail(UserVO vo) throws Exception {
		return loginDAO.idFindEmail(vo);
	}

	@Override
	public String idFindPhone(UserVO vo) throws Exception {
		return loginDAO.idFindPhone(vo);
	}

	@Override
	public int pwdFindEmail(UserVO vo) throws Exception {
		return loginDAO.pwdFindEmail(vo);
	}

	@Override
	public int pwdFindPhone(UserVO vo) throws Exception {
		return loginDAO.pwdFindPhone(vo);
	}

	@Override
	public void tempPwd(UserVO vo) throws Exception {
		loginDAO.tempPwd(vo);
	}

	@Override
	public void final_login(int midx) throws Exception {
		loginDAO.final_login(midx);
		
	}

	//비번암호화 확인
	@Override
	public String getpwd(String id) throws Exception {
		return loginDAO.getpwd(id);
	}

	@Override
	public String getid(String id) throws Exception {
		return loginDAO.getid(id);
	}
	// 로그인 한 횟수
	@Override
	public int login_count(String id) throws Exception {
		return loginDAO.login_count(id);
	}
	
	// 로그인 카운트 초기화
	@Override
	public void login_count_zero(String id) throws Exception {
		loginDAO.login_count_zero(id);
	}

}
