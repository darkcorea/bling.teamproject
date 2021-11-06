package com.project.bling.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.AddrDAO;

@Service("AddrService")
public class AddrServiceImpl implements AddrService {

	@Autowired
	AddrDAO addrDAO;
	
	
	
}
