package com.project.bling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.ReviewDAO;
import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.ReviewVO;

@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDAO reviewDAO;
	
	// 제품에 대한 리뷰 평점, 이미지 가져오기
	@Override
	public int reviewCount(int pidx) throws Exception {
		return reviewDAO.reviewCount(pidx);
	}
	
	
	// 제품에 대한 리뷰 평점, 이미지 가져오기
	@Override
	public List<ReviewVO> Product_review_count(int pidx) throws Exception {
		return reviewDAO.Product_review_count(pidx);
	}

	// 제품에 대한 리뷰 페이징 가져 오기, 최신순
	@Override
	public List<CombineVO> reviewProduct_1(PageMaker pm) throws Exception {
		return reviewDAO.reviewProduct_1(pm);
	}

	// 제품에 대한 리뷰 페이징 가져오기, 평점순
	@Override
	public List<CombineVO> reviewProduct_2(PageMaker pm) throws Exception {
		return reviewDAO.reviewProduct_2(pm);
	}
	
	
	//myPage reviewList
	@Override
	public List<CombineVO> reviewList(CombineVO vo) throws Exception {
		//System.out.println("마이페이지 서비스-구매일1 : "+vo.getRdate1());
		//System.out.println("마이페이지 서비스-구매일1 : "+vo.getRdate2());
		//System.out.println("마이페이지 서비스-midx : "+vo.getMidx());
		return reviewDAO.reviewList(vo);
	}


	@Override
	public List<CombineVO> reviewPaging(PageMaker pm) throws Exception {

		return reviewDAO.reviewPaging(pm);
	}


	@Override
	public int reviewCnt(int midx) throws Exception {

		return reviewDAO.reviewCnt(midx);
	}
	
	
	
}
