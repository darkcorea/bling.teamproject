package com.project.bling.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.MyPageDAO;

@Service("MyPageService")
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	MyPageDAO myPageDAO;
	
	
	
}
