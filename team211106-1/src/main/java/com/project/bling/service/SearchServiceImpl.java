package com.project.bling.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.SearchDAO;

@Service("SearchService")
public class SearchServiceImpl implements SearchService {

	@Autowired
	SearchDAO searchDAO;
	
	
	
}
