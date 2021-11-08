package com.project.bling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.AdminDAO;
import com.project.bling.vo.ImageVO;
import com.project.bling.vo.OptionVO;
import com.project.bling.vo.ProductVO;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO adminDAO;

	@Override
	public void insert(ProductVO vo) throws Exception {
		adminDAO.insert(vo);
	}

	@Override
	public void insertOpt(OptionVO vo) throws Exception {
		adminDAO.insertOpt(vo);
		
	}

	@Override
	public void insertImg(ImageVO vo) throws Exception {
		adminDAO.insertImg(vo);
		
	}

	@Override
	public List<ProductVO> list() throws Exception {
		return adminDAO.list();
	}
	
}
