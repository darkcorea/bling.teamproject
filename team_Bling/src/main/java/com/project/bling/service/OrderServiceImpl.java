package com.project.bling.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.OrderDAO;
import com.project.bling.vo.NonorderVO;

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
	
	
	
}
