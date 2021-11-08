package com.project.bling.service;

import com.project.bling.vo.UserVO;

public interface JoinService {
		//회원가입 db에 저장
		void insert(UserVO vo) throws Exception;
		//아이디 중복확인
		String confirmid(String id) throws Exception;
		//이메일 중복확인
		String confirmemail(String email) throws Exception;
}
