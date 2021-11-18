package com.project.bling.ad_dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Ad_Order_deliveryDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private String ps = "com.project.bling.mapper.adminmapper.ad_order_deliveryMapper.";

}
