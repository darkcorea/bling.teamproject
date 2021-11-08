package com.project.bling.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String em = "com.project.bling.mapper.eventMapper.";
	
}
