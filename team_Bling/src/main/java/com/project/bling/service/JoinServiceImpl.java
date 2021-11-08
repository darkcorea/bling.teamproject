package com.project.bling.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.JoinDAO;

@Service("JoinService")
public class JoinServiceImpl implements JoinService {

	@Autowired
	JoinDAO joinDAO;
	
	
	
}
