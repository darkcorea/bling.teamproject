package com.project.bling.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.NonorderVO;
import com.project.bling.vo.QuestionVO;

@Repository
public class DeliveryDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String dm = "com.project.bling.mapper.deliveryMapper.";
	
	// midx와 pageMaker로 주문 총 갯수 가져 오기
	public int delivery_count(PageMaker pm) throws Exception {
		return sqlSession.selectOne(dm +"delivery_count", pm);
	}

	// midx로 배송주문 상태 리스트 가져오기 
	public List<CombineVO> deivery_list(PageMaker pm) throws Exception {	
		return sqlSession.selectList(dm + "deivery_list", pm);
	}
	
	// midx와 pageMaker로 교환,반품,취소  총 갯수 가져 오기
	public int re_delivery_count(PageMaker pm) throws Exception {
		return sqlSession.selectOne(dm +"re_delivery_count", pm);
	}
	// midx로 배pageMaker로 교환,반품,취소 리스트 가져오기
	public List<CombineVO> re_deivery_list(PageMaker pm) throws Exception {	
		return sqlSession.selectList(dm + "re_deivery_list", pm);
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
	
	// 구매한 제품 취소, 환불, 교환 하기
	public void return_delivery_question(QuestionVO qv) throws Exception {
		sqlSession.insert(dm +"return_delivery_question", qv);
	}
	
	// 구매한 제품 취소, 환불, 교환에 대한 배송정보 변경
	public void return_delivery(CombineVO cv) throws Exception {
		sqlSession.update(dm +"return_delivery", cv);
	}

	// 이름과 주문번호로 비회원 주문이 있는지 조회
	public String nonDel_check(NonorderVO nv) throws Exception {
		return ( sqlSession.selectOne(dm +"nonDel_check", nv));
	}
	
	// orderid로 구매한 상품 정보 뿌려주기
	public List<CombineVO> nonDel_list(String order_idx) throws Exception{
		return sqlSession.selectList(dm + "nonDel_list", order_idx);
	}
	
	
}
