package com.project.bling.ad_service;

import java.util.List;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.UserVO;

public interface Ad_UserService {

	public int userCount(String grade) throws Exception;
	public List<UserVO> user_list(PageMaker pm) throws Exception;
	public void update_grade() throws Exception;
}
