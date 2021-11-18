package com.project.bling.ad_dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.vo.AdminVO;

@Repository
public class Ad_LoginDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private String am = "com.project.bling.mapper.adminmapper.ad_loginMapper.";
	
	//관리자 로그인 체크1
	public boolean adminCheck1(AdminVO vo) throws Exception{
		System.out.println("관리자 DAO에서 pwd1 : "+vo.getPwd1());
		System.out.println("관리자 DAO에서 id : "+vo.getId());
		
		String adminId1 = sqlSession.selectOne(am+"adminCheck1", vo);
		System.out.println("관리자 DAO에서 id1 : "+adminId1);
		return (adminId1 == null) ? false : true;
	}
	
	//관리자 로그인 체크2
	public boolean adminCheck2(AdminVO vo) throws Exception{
		String adminId2 = sqlSession.selectOne(am+"adminCheck2", vo);
		
		System.out.println("관리자 DAO에서 pwd2 : "+vo.getPwd2());
		System.out.println("관리자 DAO에서 adminId : "+adminId2);
		
		return (adminId2 == null) ? false : true ;
	}
		
	//관리자 정보
	public AdminVO adminInfo(AdminVO vo) throws Exception{
		
		return sqlSession.selectOne(am+"adminInfo", vo);
	}
}
