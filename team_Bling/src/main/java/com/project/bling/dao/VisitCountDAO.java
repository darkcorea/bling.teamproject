package com.project.bling.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VisitCountDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private String vc="com.project.bling.mapper.visitcountMapper.";
	
	public void visiter() throws Exception{
		sqlSession.insert(vc+"visiter");
	}
	
}
