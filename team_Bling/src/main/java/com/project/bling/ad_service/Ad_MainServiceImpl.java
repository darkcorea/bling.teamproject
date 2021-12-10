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

	//기간별 매출현황
	//최근 일주일
	@Override
	public int seventot() throws Exception {
		return ad_mainDAO.seventot();
	}
	//최근 15일
	@Override
	public int fifteentot() throws Exception {
		return ad_mainDAO.fifteentot();
	}
	//최근 30일
	@Override
	public int thirtytot() throws Exception {
		return ad_mainDAO.thirtytot();
	}
	//오늘 기준 7일간 데이터
	@Override
	public int recenttot(int day) throws Exception {
		return ad_mainDAO.recenttot(day);
	}
	
	
	//환불
	//최근 일주일
	@Override
	public int sevenref() throws Exception {
		return ad_mainDAO.sevenref();
	}
	//최근 15일
	@Override
	public int fifteenref() throws Exception {
		return ad_mainDAO.fifteenref();
	}
	//최근 30일
	@Override
	public int thirtyref() throws Exception {
		return ad_mainDAO.thirtyref();
	}
	//오늘 기준 7일간 데이터
	@Override
	public int recentref(int day) throws Exception {
		return ad_mainDAO.recentref(day);
	}	
	
	
	
}
