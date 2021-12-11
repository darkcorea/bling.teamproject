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
	
	// order_idx로 적립금이 있는지 없는지 확인
	public int addmileage_check(int order_idx) throws Exception {
		return sqlSession.selectOne(dm +"addmileage_check", order_idx);
	}
	
	// order_idx로 구매확정 하기
	public void confirm_fn(int order_idx) throws Exception {
		sqlSession.update(dm +"confirm_fn", order_idx);
	}
	
	// order_idx로 적립금 0원으로 만들기
	public void addmileage_zero(int order_idx) throws Exception {
		sqlSession.update(dm +"addmileage_zero", order_idx);
	}
				
	// 회원 마일리지에 적립금 추가
	public void addmileage_user(CombineVO cv) throws Exception {
		sqlSession.update(dm +"addmileage_user", cv);
	}
	
		
	// order_idx로 구매한 상품 정보 뿌려주기
	public List<CombineVO> order_list(int order_idx) throws Exception{
		return sqlSession.selectList(dm + "order_list", order_idx);
	}
	
	

}
