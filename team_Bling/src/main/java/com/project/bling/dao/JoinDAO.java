package com.project.bling.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.vo.UserVO;

@Repository
public class JoinDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String jm = "com.project.bling.mapper.joinMapper.";
	
	//회원가입 db에 저장
	public void insert(UserVO vo) throws Exception{
		sqlSession.insert(jm+"insert",vo);
	}
	
	//아이디 중복확인
	public String confirmid(String id) throws Exception{
		return sqlSession.selectOne(jm+"confirmId", id);
	}
	
	//이메일 중복확인
	public String confirmemail(String email) throws Exception{
		return sqlSession.selectOne(jm+"confirmEmail", email);
	}
}
