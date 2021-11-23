package com.project.bling.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.vo.NonorderVO;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String om = "com.project.bling.mapper.orderMapper.";
	
	public void insert(NonorderVO vo) throws Exception{
		sqlSession.insert(om+"nonorderinsert",vo);
	}
	public void detailInsert(NonorderVO vo) throws Exception{
		sqlSession.insert(om+"nonorderdetailinsert",vo);
	}
	
}
