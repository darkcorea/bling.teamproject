package com.project.bling.dao;

import javax.servlet.http.HttpSessionEvent;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class VisitCountDAO {
	
	private String vc="com.project.bling.mapper.visitcountMapper.";
	
	public void visiter(HttpSessionEvent hse,SqlSession sqlSession) throws Exception{
		System.out.println("999111111111999999test");
		sqlSession.insert(vc+"visiter");
	}
	
	
}
