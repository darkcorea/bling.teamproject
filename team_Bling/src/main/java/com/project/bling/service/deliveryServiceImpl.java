package com.project.bling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.DeliveryDAO;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.UserVO;

@Service("DeliveryService")
public class deliveryServiceImpl implements DeliveryService {

	@Autowired
	DeliveryDAO deliveryDAO;

	// midx로 배송주문 상태 가져오기 
	@Override
	public List<CombineVO> deivery_list(int midx) throws Exception {
		return deliveryDAO.deivery_list(midx);
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
	public void addmileage_user(UserVO uv) throws Exception {
		deliveryDAO.addmileage_user(uv);
	}
	
	// 적립금 0원으로 만들기
	@Override
	public void addmileage_zero(int order_idx) throws Exception {
		deliveryDAO.addmileage_zero(order_idx);	
	}
	
	
	
}
