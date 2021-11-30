package com.project.bling.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.ImageVO;
import com.project.bling.vo.OptionVO;
import com.project.bling.vo.ProductVO;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String ps = "com.project.bling.mapper.productMapper.";
	
	/* 제품 리스트에서 쓰는 */
	
	//상품 총 개수
	public int productCount(String kind) throws Exception{
		return sqlSession.selectOne(ps+"productCount",kind);
	}
	//스크롤페이징 
	public List<CombineVO> scrollnew(PageMaker pm) throws Exception{
		return sqlSession.selectList(ps+"Scroll_newList",pm);
	}
	public List<CombineVO> scrollbest(PageMaker pm) throws Exception{
		return sqlSession.selectList(ps+"Scroll_bestList",pm);
	}
	public List<CombineVO> scrollhigh(PageMaker pm) throws Exception{
		return sqlSession.selectList(ps+"Scroll_highPriceList",pm);
	}
	public List<CombineVO> scrollrow(PageMaker pm) throws Exception{
		return sqlSession.selectList(ps+"Scroll_rowPriceList",pm);
	}
	
	
	/* 홈, 상품 리스트에서 같이 쓰는 */
	// 베스트 상품 정보 가지고 오기
	public List<CombineVO> prodBest(PageMaker pm) throws Exception{
		return sqlSession.selectList(ps+"prodBest",pm);
	}
	// 새로 올라온 상품 정보 가져오기
	public List<CombineVO> prodNew(PageMaker pm) throws Exception{
		return sqlSession.selectList(ps+"prodNew",pm);
	}
	
	
	// 새로 올라온 상품 리스트 종류 별로 가져오기
	public List<CombineVO> newList(PageMaker pm) throws Exception{
		return sqlSession.selectList(ps+"newList", pm);
	}
		
	// 많이 팔린 상품 리스트 종류별로 가져오기
	public List<CombineVO> bestList(String kind) throws Exception{
		return sqlSession.selectList(ps+"bestList",kind);
	}

	
	
	
	/* 제품 디테일에서 쓰는 */
	// 상품 pidx로 상품 정보 가지고 오기
	public ProductVO detail(int pidx) throws Exception{
		return sqlSession.selectOne(ps+"detailProduct", pidx);
	}
	// 상품 pidx로 상품 옵션 정보 가지고 오기
	public List<OptionVO> options(int pidx) throws Exception{
		return sqlSession.selectList(ps+"optionsProduct", pidx);
	}
	// 상품 pidx로 상품 이미지 정보 가지고 오기
	public ImageVO image(int pidx) throws Exception{
		return sqlSession.selectOne(ps+"imageProduct", pidx);
	}
	
	
	
	/*상품 검색*/
	public List<CombineVO> search_Product(PageMaker pm) throws Exception {
		return sqlSession.selectList(ps+"search_Product", pm);
	}
	
}
