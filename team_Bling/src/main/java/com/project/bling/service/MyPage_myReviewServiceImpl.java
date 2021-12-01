package com.project.bling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.MyPage_myReviewDAO;
import com.project.bling.vo.CombineVO;

@Service("MyPage_myReviewService")
public class MyPage_myReviewServiceImpl implements MyPage_myReviewService {

	@Autowired
	MyPage_myReviewDAO myPage_myReviewDAO;

	@Override
	public List<CombineVO> reviewList(CombineVO vo) throws Exception {
		//System.out.println("마이페이지 서비스-구매일1 : "+vo.getRdate1());
		//System.out.println("마이페이지 서비스-구매일1 : "+vo.getRdate2());
		//System.out.println("마이페이지 서비스-midx : "+vo.getMidx());
		return myPage_myReviewDAO.reviewList(vo);
	}

	
}
