package com.project.bling.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

			//	getSessionidCheck(String type, String compareId)
			//	-> String type으로 "userId"가 대입되고, String compareId로 vo.getId()가 대입된다.
			//	vo.getId()는 로그인창(jsp화면)->로그인 컨트롤러->로그인 서비스로 전달된 즉, 입력된 id이다.
			SessionListener.getSessionidCheck("userId", vo.getId());
			/**
				session.setAttribute("userId", vo.getId());가
				SessionListener.getSessionidCheck("userId", vo.getId()); 보다 위에 위치하면
				로그인 하자마자 로그아웃 시킨다.
				
			**/
			session.setAttribute("userId", vo.getId());
			
			//세션 유지시간(초 단위)
			session.setMaxInactiveInterval(20 * 60);
			
				
			
		} 
		return result;
	}
	
	// 01_02. 회원 로그인 정보
	@Override
	public UserVO viewMember(UserVO vo) throws Exception{

		return loginDAO.viewMember(vo);
	}
	
	// 02. 회원 로그아웃
	@Override
	public void logout(HttpSession session) throws Exception{
		// 세션 변수 개별 삭제
		// session.removeAttribute("userId");
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
	
	
}
