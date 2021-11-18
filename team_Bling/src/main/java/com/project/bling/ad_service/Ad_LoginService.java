package com.project.bling.ad_service;

import javax.servlet.http.HttpSession;

import com.project.bling.vo.AdminVO;

public interface Ad_LoginService {
	boolean adminCheck1(AdminVO vo) throws Exception;
	boolean adminCheck2(AdminVO vo, HttpSession session) throws Exception;
	public void logout(HttpSession session);
	public AdminVO adminInfo(AdminVO vo) throws Exception;
}
