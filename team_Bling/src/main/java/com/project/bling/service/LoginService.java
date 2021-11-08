package com.project.bling.service;

import javax.servlet.http.HttpSession;

import com.project.bling.vo.CombineVO;

public interface LoginService {
	// 01_01. 회원 로그인 체크
	public boolean loginCheck(CombineVO vo, HttpSession session) throws Exception;
	// 01_02. 회원 로그인 정보
	public CombineVO viewMember(CombineVO vo);
	// 02. 회원 로그아웃
	public void logout(HttpSession session);
}
