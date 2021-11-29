package com.project.bling.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.vo.NonorderVO;
import com.project.bling.vo.OrderVO;

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
	public void memberinsert(OrderVO vo) throws Exception{
		sqlSession.insert(om+"m_orderinsert",vo);
		
	}
	public void memberdetailInsert(OrderVO vo) throws Exception{
		sqlSession.insert(om+"m_orderdetailinsert",vo);
	}
	public void mileageupdate(OrderVO vo) throws Exception{
		sqlSession.update(om+"mileage",vo);
	}
	public List<OrderVO> addr_select(int midx) throws Exception {
		return sqlSession.selectList(om+"addr_select",midx);
	}
}
