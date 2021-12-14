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
	
	//버튼1번
	List<CombineVO> recenttot() throws Exception;
	List<CombineVO> recentref() throws Exception;
	
	//버튼2번
	List<CombineVO> ordertot() throws Exception;
	List<CombineVO> ordercount() throws Exception;

	//버튼4번
	List<CombineVO> recentmem() throws Exception;
	List<CombineVO> newmem() throws Exception;
	List<CombineVO> delmem() throws Exception;
	
	//페이지별 방문수
	void pagevisit() throws Exception;
}
