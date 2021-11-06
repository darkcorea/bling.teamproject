package com.project.bling.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.OrderDAO;

@Service("OrderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDAO orderDAO;
	
	
	
}
