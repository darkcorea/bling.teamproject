package com.project.bling.service;

import com.project.bling.vo.LikeVO;

public interface BasketService {
	
	//관심상품 등록
	void likeInsert(LikeVO vo);
	
	//관심상품 삭제
	void likeDelete(LikeVO vo);
}
