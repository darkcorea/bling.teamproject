package com.project.bling.dao;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.support.WebApplicationContextUtils;

@Repository
public class VisitCountDAO {
	
	private String vc="com.project.bling.mapper.visitcountMapper.";
	
	public void visiter(HttpSessionEvent hse,SqlSession sqlSession) throws Exception{
		System.out.println("999111111111999999test");
		sqlSession.insert(vc+"visiter");
	}
	
	
}
