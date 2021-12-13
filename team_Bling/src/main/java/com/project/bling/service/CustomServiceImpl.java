package com.project.bling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.CustomDAO;
import com.project.bling.vo.CustomVO;

@Service("CustomService")
public class CustomServiceImpl implements CustomService{

	@Autowired
	CustomDAO customDAO;

	@Override
	public List<CustomVO> shape(int type) throws Exception {
		return customDAO.shape(type);
	}

	@Override
	public List<CustomVO> shapes(CustomVO co) throws Exception {
		return customDAO.shapes(co);
	}
}
