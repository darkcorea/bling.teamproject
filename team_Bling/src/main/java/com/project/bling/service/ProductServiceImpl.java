package com.project.bling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.ProductDAO;
import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.ImageVO;
import com.project.bling.vo.OptionVO;
import com.project.bling.vo.ProductVO;

@Service("ProductService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDAO productDAO;
	
	//상품 총 개수
	@Override
	public int productCount(String kind) throws Exception {
		return productDAO.productCount(kind);
	}
	
	//스크롤페이징 최신 반지
	@Override
	public List<CombineVO> scrollnew(PageMaker pm) throws Exception {
		return productDAO.scrollnew(pm);	
	}
	public List<CombineVO> scrollbest(PageMaker pm) throws Exception {
		return productDAO.scrollbest(pm);	
	}
	public List<CombineVO> scrollhigh(PageMaker pm) throws Exception {
		return productDAO.scrollhigh(pm);	
	}
	public List<CombineVO> scrollrow(PageMaker pm) throws Exception {
		return productDAO.scrollrow(pm);	
	}


	/* 홈에서 쓰는 각각 상품에 대한 서비스 */
	// 베스트 상품가지고 오기
	@Override
	public List<CombineVO> prodBest(PageMaker pm) throws Exception {
	return productDAO.prodBest(pm);
	}
	// 새로 올라온 상품 가져오기
	@Override
	public List<CombineVO> prodNew(PageMaker pm) throws Exception {
		return productDAO.prodNew(pm);
	}
		
		
		
	/*  상품 디테일에서 쓰는 */
	// 상품의 정보 가져 오기
	@Override
	public ProductVO detail(int pidx) throws Exception {
		return productDAO.detail(pidx);
	}
	// 상품의 옵션 정보들 가져오기
	@Override
	public List<OptionVO> options(int pidx) throws Exception {
		return productDAO.options(pidx);
	}
	// 상품의 이미지들 가져 오기
	@Override
	public ImageVO image(int pidx) throws Exception {
		return productDAO.image(pidx);
	}

	// 상품 검색
	@Override
	public List<CombineVO> search_Product(PageMaker pm) throws Exception {
		return productDAO.search_Product(pm);
	}

	
}
