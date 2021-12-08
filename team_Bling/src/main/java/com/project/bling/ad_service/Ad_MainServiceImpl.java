package com.project.bling.ad_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.ad_dao.Ad_MainDAO;
import com.project.bling.vo.DeliveryVO;

@Service("Ad_MainService")
public class Ad_MainServiceImpl implements Ad_MainService{
	@Autowired
	Ad_MainDAO ad_mainDAO;

	@Override
	public List<DeliveryVO> order() throws Exception {
		return ad_mainDAO.order();
	}
}
