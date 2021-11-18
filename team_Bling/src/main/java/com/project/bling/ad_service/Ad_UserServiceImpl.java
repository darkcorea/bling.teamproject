package com.project.bling.ad_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.ad_dao.Ad_UserDAO;

@Service("Ad_UserService")
public class Ad_UserServiceImpl implements Ad_UserService{
	@Autowired
	Ad_UserDAO ad_userDAO;

}
