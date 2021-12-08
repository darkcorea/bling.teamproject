package com.project.bling.ad_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.vo.DeliveryVO;

@Repository
public class Ad_MainDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private String ps = "com.project.bling.mapper.adminmapper.ad_mainMapper.";
	
	public List<DeliveryVO> order() throws Exception{
		return sqlSession.selectList(ps+"order");
	}

}
