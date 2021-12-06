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
	
	// myPage reviewList
	public List<CombineVO> reviewList(CombineVO vo) throws Exception {
		//System.out.println("마이페이지 DAO-rdate1 : "+vo.getRdate1());
		//System.out.println("마이페이지 DAO-rdate2 : "+vo.getRdate2());
		
		List<CombineVO> reviewList = sqlSession.selectList(rm+"reviewList", vo);
		
		//System.out.println("마이페이지 DAO-reviewList : "+reviewList);
		//System.out.println("마이페이지 DAO-인덱스0 제품이름 : "+reviewList.get(0).getPname());
		return reviewList;
	}
	
	public List<CombineVO> reviewPaging(PageMaker pm) throws Exception {
		
		List<CombineVO> reviewPaging = sqlSession.selectList(rm+"reviewPaging", pm);
		
		return reviewPaging;
	}
	
	// midx로 리뷰 총 개수 가져오기
	public int reviewCnt(int midx) throws Exception{
		return sqlSession.selectOne(rm+"reviewCnt", midx);
	}
	
}
