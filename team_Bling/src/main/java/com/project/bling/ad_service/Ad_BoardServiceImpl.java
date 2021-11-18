package com.project.bling.ad_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.ad_dao.Ad_BoardDAO;

@Service("Ad_BoardService")
public class Ad_BoardServiceImpl implements Ad_BoardService{
	@Autowired
	Ad_BoardDAO ad_boardDAO;
	
}
