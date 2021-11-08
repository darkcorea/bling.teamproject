package com.project.bling.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String sm = "com.project.bling.mapper.searchMapper.";
	
}
