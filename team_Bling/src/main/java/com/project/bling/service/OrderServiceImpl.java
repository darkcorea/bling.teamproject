package com.project.bling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.OrderDAO;
import com.project.bling.vo.NonorderVO;
import com.project.bling.vo.OrderVO;

@Service("OrderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDAO orderDAO;

	@Override
	public void insert(NonorderVO vo) throws Exception {
		
		orderDAO.insert(vo);
	}

	@Override
	public void detailInsert(NonorderVO vo) throws Exception {
		
		orderDAO.detailInsert(vo);
	}

	@Override
	public void memberinsert(OrderVO vo) throws Exception {
		orderDAO.memberinsert(vo);
		
	}

	@Override
	public void memberdetailInsert(OrderVO vo) throws Exception {
		
		orderDAO.memberdetailInsert(vo);
	}

	@Override
	public void mileageupdate(OrderVO vo) throws Exception {
		
		orderDAO.mileageupdate(vo);
	}

	@Override
	public List<OrderVO> addr_select(int midx) throws Exception {
		
		return orderDAO.addr_select(midx);
	}
	
	
	
}
