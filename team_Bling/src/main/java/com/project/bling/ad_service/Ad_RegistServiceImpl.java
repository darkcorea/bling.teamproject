package com.project.bling.ad_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.ad_dao.Ad_RegistDAO;
import com.project.bling.vo.ImageVO;
import com.project.bling.vo.OptionVO;
import com.project.bling.vo.ProductVO;

@Service("Ad_RegistService")
public class Ad_RegistServiceImpl implements Ad_RegistService{
	
	@Autowired
	Ad_RegistDAO ad_registDAO;
	
	@Override
	public void insert(ProductVO vo) throws Exception {
		ad_registDAO.insert(vo);
	}

	@Override
	public void insertOpt(OptionVO vo) throws Exception {
		ad_registDAO.insertOpt(vo);
		
	}

	@Override
	public void insertImg(ImageVO vo) throws Exception {
		ad_registDAO.insertImg(vo);
		
	}

	@Override
	public List<ProductVO> list() throws Exception {
		return ad_registDAO.list();
	}
}
