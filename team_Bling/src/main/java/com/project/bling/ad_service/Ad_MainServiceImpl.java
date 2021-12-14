package com.project.bling.ad_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.ad_dao.Ad_MainDAO;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.DeliveryVO;

@Service("Ad_MainService")
public class Ad_MainServiceImpl implements Ad_MainService{
	@Autowired
	Ad_MainDAO ad_mainDAO;

	//주문관리
	@Override
	public DeliveryVO order() throws Exception {
		return ad_mainDAO.order();
	}
	
	//문의답변
	//상품문의
	@Override
	public int productq() throws Exception {
		return ad_mainDAO.productq();
	}

	//1:1문의
	@Override
	public int privateq() throws Exception {
		return ad_mainDAO.privateq();
	}

	//버튼1번
	@Override
	public List<CombineVO> recenttot() throws Exception {
		return ad_mainDAO.recenttot();
	}
	@Override
	public List<CombineVO> recentref() throws Exception {
		return ad_mainDAO.recentref();
	}

	//버튼2번
	@Override
	public List<CombineVO> ordertot() throws Exception {
		return ad_mainDAO.ordertot();
	}
	@Override
	public List<CombineVO> ordercount() throws Exception {
		return ad_mainDAO.ordercount();
	}	
	
	//버튼3번
	@Override
	public List<CombineVO> visit() throws Exception {
		return ad_mainDAO.visit();
	}

	@Override
	public List<CombineVO> pageview() throws Exception {
		return ad_mainDAO.pageview();
	}

	@Override
	public List<CombineVO> attention() throws Exception {
		return ad_mainDAO.attention();
	}
	
	//버튼4번
	@Override
	public List<CombineVO> recentmem() throws Exception {
		return ad_mainDAO.recentmem();
	}
	@Override
	public List<CombineVO> newmem() throws Exception {
		return ad_mainDAO.newmem();
	}
	@Override
	public List<CombineVO> delmem() throws Exception {
		return ad_mainDAO.delmem();
	}

	
	//페이지별 방문자수 카운트
	@Override
	public void pagevisit() throws Exception {
		ad_mainDAO.pagevisit();
	}

	
	
}
