package com.project.bling.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.vo.CartVO;
import com.project.bling.vo.LikeVO;
import com.project.bling.vo.OrderVO;

@Repository
public class BasketDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String bm = "com.project.bling.mapper.basketMapper.";
	
	//관심상품 존재여부확인
	public Integer likeyn(LikeVO vo) {
		Integer m = sqlSession.selectOne(bm+"likeyn",vo);
		return m;
	}
	
	//관심상품 등록
	public void likeInsert(LikeVO vo) {
		sqlSession.insert(bm+"likeInsert",vo);
	}
	
	//관심상품 삭제
	public void likeDelete(LikeVO vo) {
		sqlSession.delete(bm+"likeDelete",vo);
	}
	
	public void cartinsert(OrderVO vo) throws Exception{
		sqlSession.insert(bm+"cartinsert",vo);
		
	}
	public int cartdouble_check(OrderVO vo) throws Exception{
		return sqlSession.selectOne(bm+"double_check",vo);
		
	}
	public List<CartVO> cartlist(int midx) throws Exception{
		return sqlSession.selectList(bm+"cartlist", midx);
	}
}
