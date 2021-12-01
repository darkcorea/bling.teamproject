package com.project.bling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.BasketDAO;
import com.project.bling.vo.CartVO;
import com.project.bling.vo.LikeVO;
import com.project.bling.vo.OrderVO;

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

	@Override
	public void cartinsert(OrderVO vo) throws Exception {
		basketDAO.cartinsert(vo);
	}

	@Override
	public int cartdouble_check(OrderVO vo) throws Exception {
		
		return basketDAO.cartdouble_check(vo);
		
	}

	@Override
	public List<CartVO> cartlist(int midx) throws Exception {
		
		return basketDAO.cartlist(midx);
	}

}
