package com.project.bling.ad_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.ad_dao.Ad_UserDAO;
import com.project.bling.domain.PageMaker;
import com.project.bling.vo.UserVO;

@Service("Ad_UserService")
public class Ad_UserServiceImpl implements Ad_UserService{
	@Autowired
	Ad_UserDAO ad_userDAO;

	@Override
	public int userCount(String grade) throws Exception {
		
		return ad_userDAO.userCount(grade);
	}

	@Override
	public List<UserVO> user_list(PageMaker pm) throws Exception {
		
		return ad_userDAO.user_list(pm);
	}

	@Override
	public void update_grade() throws Exception {
		ad_userDAO.update_grade();
		
	}

	@Override
	public List<UserVO> secession_list() throws Exception {
		return ad_userDAO.secession_list();
	}

}
