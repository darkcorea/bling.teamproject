package com.project.bling.ad_service;

import java.util.List;

import com.project.bling.vo.CombineVO;
import com.project.bling.vo.DeliveryVO;

public interface Ad_MainService {
	
	//주문관리
	DeliveryVO order()throws Exception;
	
	//문의답변
	//상품문의
	int productq() throws Exception;
	//1:1문의
	int privateq() throws Exception;
	
	//기간별 매출현황
	//최근 일주일
	int seventot() throws Exception;
	//최근 15일
	int fifteentot() throws Exception;
	//최근 30일
	int thirtytot() throws Exception;
	//오늘 기준 7일간 데이터
	int recenttot(int day) throws Exception;
	
	//환불
	//최근 일주일
	int sevenref() throws Exception;
	//최근 15일
	int fifteenref() throws Exception;
	//최근 30일
	int thirtyref() throws Exception;
	//오늘 기준 7일간 데이터
	int recentref(int day) throws Exception;
}
