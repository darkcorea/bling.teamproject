package com.project.bling.dao;

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
	public UserVO viewMember(UserVO vo) throws Exception{
		return sqlSession.selectOne(lm+"viewMember", vo);
	}
	
	
	//아이디 찾기(이름,이메일)
	public String idFindEmail(UserVO vo) throws Exception{
		return sqlSession.selectOne(lm+"idFindEmail", vo);
	}
	//아이디 찾기(이름,휴대폰)
	public String idFindPhone(UserVO vo) throws Exception{
		return sqlSession.selectOne(lm+"idFindPhone", vo);
	}
	//비밀번호 찾기(아이디,이름,이메일)
	public int pwdFindEmail(UserVO vo) throws Exception{
		return sqlSession.selectOne(lm+"pwdFindEmail", vo);
	}
	//비밀번호 찾기(아이디,이름,휴대폰)
	public int pwdFindPhone(UserVO vo) throws Exception{
		return sqlSession.selectOne(lm+"pwdFindPhone", vo);
	}
	//임시 비밀번호 발급
	public void tempPwd(UserVO vo) throws Exception{
		sqlSession.update(lm+"tempPwd", vo);
	}
	
}
