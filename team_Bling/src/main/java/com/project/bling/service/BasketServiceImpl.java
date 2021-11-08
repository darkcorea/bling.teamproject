package com.project.bling.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.BasketDAO;

@Service("BasketService")
public class BasketServiceImpl implements BasketService {

	@Autowired
	BasketDAO basketDAO;
	
	
	
}
