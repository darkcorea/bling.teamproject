package com.project.bling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.DeliveryDAO;
import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.NonorderVO;
import com.project.bling.vo.QuestionVO;

@Service("DeliveryService")
public class deliveryServiceImpl implements DeliveryService {

	@Autowired
	DeliveryDAO deliveryDAO;
	
	// midx와 PageMaker로 주문 총갯수 가져오기
	@Override
	public int delivery_count(PageMaker pm) throws Exception {
		return deliveryDAO.delivery_count(pm);
	}
	
	// midx로 배송주문 상태 가져오기 
	@Override
	public List<CombineVO> deivery_list(PageMaker pm) throws Exception {
		return deliveryDAO.deivery_list(pm);
	}
	
	// midx와 pageMaker로 교환,반품,취소  총 갯수 가져 오기
	@Override
	public int re_delivery_count(PageMaker pm) throws Exception {
		return deliveryDAO.re_delivery_count(pm);
	}
	
	// midx로 배pageMaker로 교환,반품,취소 리스트 가져오기
	@Override
	public List<CombineVO> re_deivery_list(PageMaker pm) throws Exception {
		return deliveryDAO.re_deivery_list(pm);
	}
	
	// order_idx로 구매확정 하기
	@Override
	public void confirm_fn(int order_idx) throws Exception {
		deliveryDAO.confirm_fn(order_idx);
	}

	// order_idx로 구매한 상품정보 뿌려주기
	@Override
	public List<CombineVO> order_list(int order_idx) throws Exception {
		return deliveryDAO.order_list(order_idx);
	}
	
	// order_idx로 addmileage 가져오기
	@Override
	public int addmileage_check(int order_idx) throws Exception {
		return deliveryDAO.addmileage_check(order_idx);
	}

	// 회원 마일이지에 적립금 추가
	@Override
	public void addmileage_user(CombineVO cv) throws Exception {
		deliveryDAO.addmileage_user(cv);
	}
	
	// 적립금 0원으로 만들기
	@Override
	public void addmileage_zero(int order_idx) throws Exception {
		deliveryDAO.addmileage_zero(order_idx);	
	}
	
	// 구매한 체품 취소,환불,교환 하기
	@Override
	public void return_delivery_question(QuestionVO qv) throws Exception {
		deliveryDAO.return_delivery_question(qv);
	}
	
	// 구매한 체품 취소,환불,교환에 따른 배송 정보 변경
	@Override
	public void return_delivery(CombineVO cv) throws Exception {
		deliveryDAO.return_delivery(cv);
		
	}

	/// 이름과 주문번호로 비회원 주문이 있는지 조회
	@Override
	public String nonDel_check(NonorderVO nv) throws Exception {
		return deliveryDAO.nonDel_check(nv);
	}


	
}
