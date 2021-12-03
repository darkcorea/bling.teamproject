package com.project.bling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.DeliveryDAO;
import com.project.bling.vo.CombineVO;

@Service("DeliveryService")
public class deliveryServiceImpl implements DeliveryService {

	@Autowired
	DeliveryDAO deliveryDAO;

	// midx로 배송주문 상태 가져오기 
	@Override
	public List<CombineVO> deivery_list(int midx) throws Exception {
		return deliveryDAO.deivery_list(midx);
	}
	
	
	
}
