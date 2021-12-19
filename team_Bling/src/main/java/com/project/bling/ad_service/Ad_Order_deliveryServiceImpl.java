package com.project.bling.ad_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.ad_dao.Ad_Order_deliveryDAO;
import com.project.bling.domain.Criteria;
import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;

@Service("Ad_Order_deliveryService")
public class Ad_Order_deliveryServiceImpl implements Ad_Order_deliveryService {
	@Autowired
	Ad_Order_deliveryDAO ad_order_deliveryDAO;

	
	@Override
	public int orderCnt(PageMaker pm) throws Exception {
		return ad_order_deliveryDAO.orderCnt(pm);
	}

	@Override
	public List<CombineVO> orderList(PageMaker pm) throws Exception {
		return ad_order_deliveryDAO.orderList(pm);
	}

	@Override
	public void prodStat(CombineVO vo) throws Exception {
		ad_order_deliveryDAO.prodStat(vo);
	}
	

	@Override
	public void invoice(CombineVO vo) throws Exception {
		ad_order_deliveryDAO.invoice(vo);;
	}

	@Override
	public int deliveryCnt(Criteria sc) throws Exception {
		return ad_order_deliveryDAO.deliveryCnt(sc);
	}

	@Override
	public List<CombineVO> deliveryList(PageMaker pm) throws Exception {
		return ad_order_deliveryDAO.deliveryList(pm);
	}

	@Override
	public int returnCnt(Criteria sc) throws Exception {
		return ad_order_deliveryDAO.returnCnt(sc);
	}

	@Override
	public List<CombineVO> returnList(PageMaker pm) throws Exception {
		return ad_order_deliveryDAO.returnList(pm);
	}
	
}
