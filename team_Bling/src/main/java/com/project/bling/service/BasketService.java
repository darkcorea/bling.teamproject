package com.project.bling.service;

import java.util.List;

import com.project.bling.vo.CartVO;
import com.project.bling.vo.LikeVO;
import com.project.bling.vo.OrderVO;

public interface BasketService {
	
	
	//관심상품 존재여부확인
	Integer likeyn(LikeVO vo);
	
	//관심상품 등록
	void likeInsert(LikeVO vo);
	
	//관심상품 삭제
	void likeDelete(LikeVO vo);
	
	void cartinsert(OrderVO vo) throws Exception;
	
	int cartdouble_check(OrderVO vo) throws Exception;
	
	List<CartVO> cartlist(int midx) throws Exception;
	
	int cart_count(int midx) throws Exception;
}
