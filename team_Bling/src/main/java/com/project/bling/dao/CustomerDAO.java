package com.project.bling.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String cm = "com.project.bling.mapper.customerMapper.";
	
}
