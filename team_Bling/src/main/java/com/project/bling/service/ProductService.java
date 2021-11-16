package com.project.bling.service;

import java.util.List;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.ImageVO;
import com.project.bling.vo.OptionVO;
import com.project.bling.vo.ProductVO;

public interface ProductService {

	
	//상품 총 개수
	int productCount(String kind) throws Exception;
	
	// 홈, 상품 리스트에서 같이 쓰는 서비스
	List<CombineVO> prodBest(PageMaker pm) throws Exception;
	List<CombineVO> prodNew(PageMaker pm) throws Exception;
	
	//스크롤페이징
	List<CombineVO> scrollnew(PageMaker pm) throws Exception;
	List<CombineVO> scrollbest(PageMaker pm) throws Exception;
	List<CombineVO> scrollhigh(PageMaker pm) throws Exception;
	List<CombineVO> scrollrow(PageMaker pm) throws Exception;
	
	
	// 상품 디테일에에서 쓰는 서비스
	ProductVO detail(int pidx) throws Exception;
	List<OptionVO> options(int pidx) throws Exception;
	ImageVO image(int pidx) throws Exception;

}
