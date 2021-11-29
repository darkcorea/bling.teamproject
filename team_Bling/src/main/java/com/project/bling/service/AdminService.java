package com.project.bling.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.bling.vo.AdminVO;
import com.project.bling.vo.ImageVO;
import com.project.bling.vo.OptionVO;
import com.project.bling.vo.ProductVO;

public interface AdminService {
	
	void insert(ProductVO vo) throws Exception;
	void insertOpt(OptionVO vo) throws Exception;
	void insertImg(ImageVO vo) throws Exception;
	List<ProductVO> list() throws Exception;
	boolean adminCheck1(AdminVO vo) throws Exception;
	boolean adminCheck2(AdminVO vo, HttpSession session) throws Exception;
	public AdminVO adminInfo(AdminVO vo) throws Exception;
	public void logout(HttpSession session);

}
