package com.project.bling.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.vo.UserVO;

@Repository
public class LoginDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String lm = "com.project.bling.mapper.loginMapper.";
	
	// 01_01. 회원 로그인체크
	public boolean loginCheck(UserVO vo) throws Exception{
		String name = sqlSession.selectOne(lm+"loginCheck", vo);
		//System.out.println("DAO에서 아이디 : "+vo.getId());
		//System.out.println("DAO에서 비밀번호 : "+vo.getPwd());
		return (name == null) ? false : true;
	}
	// 01_02. 회원 로그인 정보
	public UserVO viewMember(UserVO vo) {
		return sqlSession.selectOne(lm+"viewMember", vo);
	}
	// 02. 회원 로그아웃
	public void logout(HttpSession session) {
	}
}
