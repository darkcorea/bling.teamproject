package com.project.bling.service;

import java.util.List;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.ReviewVO;

public interface ReviewService {
	
	int reviewCount(int pidx) throws Exception;
	List<ReviewVO> Product_review_count(int pidx) throws Exception;
	List<CombineVO> reviewProduct_1(PageMaker pm) throws Exception;
	List<CombineVO> reviewProduct_2(PageMaker pm) throws Exception;
	//myPage reviewList
	public List<CombineVO> reviewPaging(PageMaker pm) throws Exception;
	public int reviewCnt(PageMaker pm) throws Exception;

}
