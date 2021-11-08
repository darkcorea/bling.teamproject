package com.project.bling.service;

import javax.servlet.http.HttpSession;

import com.project.bling.vo.UserVO;

public interface LoginService {
	// 01_01. 회원 로그인 체크
	public boolean loginCheck(UserVO vo, HttpSession session) throws Exception;
	// 01_02. 회원 로그인 정보
	public UserVO viewMember(UserVO vo);
	// 02. 회원 로그아웃
	public void logout(HttpSession session);
}
