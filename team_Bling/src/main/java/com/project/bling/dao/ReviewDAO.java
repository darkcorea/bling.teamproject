package com.project.bling.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.ReviewVO;



@Repository
public class ReviewDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String rm = "com.project.bling.mapper.reviewMapper.";

	// 상품 pidx로 상품의 리뷰 총 갯수 가져오기
	public int reviewCount(int pidx) throws Exception{
		return sqlSession.selectOne(rm+"reviewCount", pidx);
	}
	
	// 상품 pidx로 상품 리뷰들의 평점, 이미지 가져오기
	public List<ReviewVO> Product_review_count(int pidx) throws Exception{
		return sqlSession.selectList(rm+"Product_review_count", pidx);
	}
	
	// 페이징된 리뷰들  최신순 가져오기
	public List<CombineVO> reviewProduct_1(PageMaker pm)throws Exception{
		return sqlSession.selectList(rm + "reviewProduct_1", pm);
	}
	
	// 페이징된 리뷰들  평점순 가져오기
	public List<CombineVO> reviewProduct_2(PageMaker pm)throws Exception{
		return sqlSession.selectList(rm + "reviewProduct_2", pm);
	}
	
}
