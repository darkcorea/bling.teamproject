package com.project.bling.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.DeliveryDAO;

@Service("DeliveryService")
public class deliveryServiceImpl implements DeliveryService {

	@Autowired
	DeliveryDAO deliveryDAO;
	
	
	
}
