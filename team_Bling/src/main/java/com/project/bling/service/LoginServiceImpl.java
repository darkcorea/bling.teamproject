package com.project.bling.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.LoginDAO;
import com.project.bling.vo.UserVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginDAO loginDAO;

	// 01_01. 회원 로그인체크
	@Override
	public boolean loginCheck(UserVO vo, HttpSession session) throws Exception {
		boolean result = loginDAO.loginCheck(vo);
		if (result) { // true일 경우 세션에 등록
			UserVO vo2 = viewMember(vo);
			// 세션 변수 등록
			session.setAttribute("id", vo2.getId());
			session.setAttribute("uname", vo2.getUname());
		} 
		//System.out.println("서비스에서 세션 id : "+session.getAttribute("id"));
		//System.out.println("서비스에서 세션 이름 : "+session.getAttribute("uname"));
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
