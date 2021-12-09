package com.project.bling.ad_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.ad_dao.Ad_Order_deliveryDAO;
import com.project.bling.vo.CombineVO;

@Service("Ad_Order_deliveryService")
public class Ad_Order_deliveryServiceImpl implements Ad_Order_deliveryService{
	@Autowired
	Ad_Order_deliveryDAO ad_order_deliveryDAO;

	@Override
	public List<CombineVO> orderList() throws Exception {
		return ad_order_deliveryDAO.orderList();
	}
	
	
}
