package com.project.bling.ad_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;

@Repository
public class Ad_Order_deliveryDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private String ps = "com.project.bling.mapper.adminmapper.ad_order_deliveryMapper.";

	public int orderCnt() throws Exception {
		return sqlSession.selectOne(ps+"orderCnt");
	}
	
	public List<CombineVO> orderList(PageMaker pm) throws Exception {
		return sqlSession.selectList(ps+"orderList", pm);
	}
	
	public void prodStat(CombineVO vo) throws Exception {
		sqlSession.update(ps+"prodStat", vo);
	}
}
