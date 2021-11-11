package com.project.bling.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;

import com.project.bling.dao.LoginDAO;
import com.project.bling.session.SessionListener;
import com.project.bling.vo.UserVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginDAO loginDAO;

	// 01_01. 회원 로그인체크
	@Override
	public boolean loginCheck(UserVO vo, HttpSession session, HttpServletRequest request) throws Exception {
		boolean result = loginDAO.loginCheck(vo);
		if (result) { // true일 경우 세션에 등록
			UserVO vo2 = viewMember(vo);
			// 세션 변수 등록
			session.setAttribute("UserVO", vo2);
			/*
				세션에 저장된 UserVO 객체가 null이면 session.getAttribute("UserVO")에서
				id 필드를 NullPointerException 때문에 참조를 못 하기 때문에 밑에 따로 추가함.
			*/
			//session.setAttribute("userId", vo2.getId());

			String userId = SessionListener.getSessionidCheck("userId", vo2.getId());
			
			session = request.getSession();
			session.setAttribute("userId", vo2);
			//세션 유지시간(초 단위)
			session.setMaxInactiveInterval(20*60);
		} 
		return result;
	}
	
	// 01_02. 회원 로그인 정보
	@Override
	public UserVO viewMember(UserVO vo) {

		return loginDAO.viewMember(vo);
	}
	
	// 02. 회원 로그아웃
	@Override
	public void logout(HttpSession session) {
		// 세션 변수 개별 삭제
		// session.removeAttribute("userId");
		//세션을 모두 초기화시킴
		session.invalidate();
	}


	
	
	
	
}
