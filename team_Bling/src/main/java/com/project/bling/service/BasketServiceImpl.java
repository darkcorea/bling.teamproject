package com.project.bling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.BasketDAO;
import com.project.bling.vo.CombineVO;
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
	
	//midx에 따른 관심상품 갯수
	@Override
	public int cart_count(int midx) throws Exception{
		return basketDAO.cart_count(midx);
	}
	
	//midx에 따른 관심상품 리스트
	public List<CombineVO> like_list(CombineVO cv) throws Exception {
		return basketDAO.like_list(cv);
	}
	
	//관심상품 삭제 interest_idx 사용
	@Override
	public void likeDel(LikeVO vo) throws Exception {
		basketDAO.likeDel(vo);
	}

	@Override
	public void like_del_ch(List<Integer> list) throws Exception {
		basketDAO.like_del_ch(list);
	}
	
	
}
