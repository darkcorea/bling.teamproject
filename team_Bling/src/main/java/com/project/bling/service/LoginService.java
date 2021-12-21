package com.project.bling.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.project.bling.vo.UserVO;

public interface LoginService {
	// 01_01. 회원 로그인 체크
	public boolean loginCheck(UserVO vo, HttpSession session, HttpServletRequest request) throws Exception;
	public boolean delyn(UserVO vo)throws Exception;
	// 01_02. 회원 로그인 정보
	public UserVO viewMember(UserVO vo) throws Exception;
	// 02. 회원 로그아웃
	public void logout(HttpSession session) throws Exception;
	
	public String idFindEmail(UserVO vo) throws Exception;
	public String idFindPhone(UserVO vo) throws Exception;
	public int pwdFindEmail(UserVO vo) throws Exception;
	public int pwdFindPhone(UserVO vo) throws Exception;
	public void tempPwd(UserVO vo) throws Exception;
	public void final_login(int midx) throws Exception;
	
	//암호화된 패스워드를 비교
	public String getpwd(String id)throws Exception;
	//아이디있는지 확인
	public String getid(String id) throws Exception;
	
	// 로그인한 횟수
	int login_count(String id) throws Exception;
	void login_count_zero(String id) throws Exception;
}
