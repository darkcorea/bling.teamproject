package com.project.bling.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.BuyDAO;

@Service("BuyService")
public class BuyServiceImpl implements BuyService {

	@Autowired
	BuyDAO buyDAO;
	
	
	
}
