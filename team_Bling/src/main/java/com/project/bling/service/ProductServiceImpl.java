package com.project.bling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.ProductDAO;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.ImageVO;
import com.project.bling.vo.OptionVO;
import com.project.bling.vo.ProductVO;

@Service("ProductService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDAO productDAO;
	
	
		/* 홈에서 쓰는 각각 상품에 대한 서비스 */
		// 베스트 상품가지고 오기
		@Override
		public List<CombineVO> prodBest() throws Exception {
		return productDAO.prodBest();
		}
		// 새로 올라온 상품 가져오기
		@Override
		public List<CombineVO> prodNew() throws Exception {
			return productDAO.prodNew();
		}
		// 새로 올라온 상품 리스트 종류 별로 가져오기
		@Override
		public List<CombineVO> newList(String kind) throws Exception{
			return productDAO.newList(kind);	
		}
		
		

		/* 상품 리스트에서 쓰는 서비스 */
		// 판매량이 많은 상품 종류별로 가져오기
		@Override
		public List<CombineVO> bestList(String kind) throws Exception{
			return productDAO.bestList(kind);
		}
		// 판매 가격이 높은 상품 종류별로 가져오기
		public List<CombineVO> highPrice(String kind) throws Exception{
			return productDAO.highPrice(kind);
		};
		// 판매 가격이 낮은 상품 종류별로 가져오기
		public List<CombineVO> rowPrice(String kind) throws Exception{
			return productDAO.rowPrice(kind);
		};
		
		
		
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
		// 상품에 대한 리뷰 갯수 최신순 
		@Override
		public List<CombineVO> reviewProduct_1(int pidx) throws Exception {
			return productDAO.reviewProduct_1(pidx);
		}
		
		// 상품에 대한 리뷰 갯수 평점순
		@Override
		public List<CombineVO> reviewProduct_2(int pidx) throws Exception {
			return productDAO.reviewProduct_2(pidx);
		}


	
}
