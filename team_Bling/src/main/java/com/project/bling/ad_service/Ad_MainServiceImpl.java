package com.project.bling.ad_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.ad_dao.Ad_MainDAO;

@Service("Ad_MainService")
public class Ad_MainServiceImpl implements Ad_MainService{
	@Autowired
	Ad_MainDAO ad_mainDAO;
}
