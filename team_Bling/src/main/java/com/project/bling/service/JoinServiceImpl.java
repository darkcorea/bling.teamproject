package com.project.bling.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.JoinDAO;

import com.project.bling.vo.UserVO;

@Service("JoinService")
public class JoinServiceImpl implements JoinService {

	@Autowired
	JoinDAO joinDAO;
	
	//회원가입 db에 저장
	@Override
	public void insert(UserVO vo) throws Exception {
		joinDAO.insert(vo);
	}
	
	//아이디 중복확인
	@Override
	public String confirmid(String id) throws Exception {
		System.out.println(">>>!!!<>>>>>"+id);
		return joinDAO.confirmid(id);
	}
	
	//이메일 중복확인
	@Override
	public String confirmemail(String email) throws Exception {
		return joinDAO.confirmemail(email);
	}
}
