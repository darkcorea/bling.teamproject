package com.project.bling.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.vo.CombineVO;
import com.project.bling.vo.ImageVO;
import com.project.bling.vo.OptionVO;
import com.project.bling.vo.ProductVO;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String pm = "com.project.bling.mapper.productMapper.";
	
	/* 홈, 상품 리스트에서 같이 쓰는 */
	// 베스트 상품 정보 가지고 오기
	public List<CombineVO> prodBest() throws Exception{
		return sqlSession.selectList(pm+"prodBest");
	}
	// 새로 올라온 상품 정보 가져오기
	public List<CombineVO> prodNew() throws Exception{
		return sqlSession.selectList(pm+"prodNew");
	}
	// 새로 올라온 상품 리스트 종류 별로 가져오기
	public List<CombineVO> newList(String kind) throws Exception{
		return sqlSession.selectList(pm+"newList", kind);
	}
	
	
	/* 제품 리스트에서 쓰는 */
	// 많이 팔린 상품 리스트 종류별로 가져오기
	public List<CombineVO> bestList(String kind) throws Exception{
		return sqlSession.selectList(pm+"bestList",kind);
	}
	// 가격이 높은 상품 리스트 종류별로 가져오기
	public List<CombineVO> highPrice(String kind) throws Exception{
		return sqlSession.selectList(pm+"highPrice",kind);
	}
	// 가격이 낮은 상품 리스트 종류별로 가져오기
	public List<CombineVO> rowPrice(String kind) throws Exception{
		return sqlSession.selectList(pm+"rowPrice",kind);
	}

	
	
	
	
	
	
	
	
	/* 제품 디테일에서 쓰는 */
	// 상품 pidx로 상품 정보 가지고 오기
	public ProductVO detail(int pidx) throws Exception{
		return sqlSession.selectOne(pm+"detailProduct", pidx);
	}
	// 상품 pidx로 상품 옵션 정보 가지고 오기
	public List<OptionVO> options(int pidx) throws Exception{
		return sqlSession.selectList(pm+"optionsProduct", pidx);
	}
	// 상품 pidx로 상품 이미지 정보 가지고 오기
	public ImageVO image(int pidx) throws Exception{
		return sqlSession.selectOne(pm+"imageProduct", pidx);
	}
	
	
}
