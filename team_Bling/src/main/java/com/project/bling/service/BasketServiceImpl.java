package com.project.bling.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.BasketDAO;
import com.project.bling.vo.LikeVO;

@Service("BasketService")
public class BasketServiceImpl implements BasketService {

	@Autowired
	BasketDAO basketDAO;

	//관심상품 존재여부확인
	@Override
	public Integer likeyn(LikeVO vo) {
		return basketDAO.likeyn(vo);
	}
		
	//관심상품 등록
	@Override
	public void likeInsert(LikeVO vo) {
		basketDAO.likeInsert(vo);
	}
	
	//관심상품 삭제
	@Override
	public void likeDelete(LikeVO vo) {
		basketDAO.likeDelete(vo);
	}

}
