package com.project.bling.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String om = "com.project.bling.mapper.orderMapper.";
	
}
