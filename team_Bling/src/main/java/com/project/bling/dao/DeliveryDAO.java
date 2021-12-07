package com.project.bling.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.vo.CombineVO;

@Repository
public class DeliveryDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String dm = "com.project.bling.mapper.deliveryMapper.";
	
	// midx로 배송주문 상태 가져오기 
	public List<CombineVO> deivery_list(int midx) throws Exception {	
		return sqlSession.selectList(dm + "deivery_list", midx);
	}
	
	// order_idx로 구매확정 하기
	public void confirm_fn(int order_idx) throws Exception {
		sqlSession.update(dm +"confirm_fn", order_idx);
		}
	
}
