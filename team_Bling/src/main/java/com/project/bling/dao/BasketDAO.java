package com.project.bling.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.vo.CartVO;
import com.project.bling.vo.CombineVO;
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
	
	public int cart_update(CartVO vo) throws Exception{
		return sqlSession.update(bm+"cart_update",vo);
	}
	public void cart_delete(int cart_idx) throws Exception{
		sqlSession.update(bm+"cart_delete",cart_idx);
	}
	public void cartcheck_del(List<Integer> list) throws Exception {
		sqlSession.delete(bm+"cartcheck_del",list);
	}
	
	
	//midx에 따른 관심상품 갯수
	public int cart_count(int midx) throws Exception {
		return sqlSession.selectOne(bm+"cart_count", midx);
	}
	
	//midx와 종류에 대한  관심상품 리스트
	public List<CombineVO> like_list(CombineVO cv) throws Exception {
		return sqlSession.selectList(bm+"like_list", cv);
	}

	//관심상품 삭제 interest_idx 사용
	public void likeDel(LikeVO vo) throws Exception {
		sqlSession.delete(bm+"likeDel",vo);
	}
	
	//관심상품 여러개 삭제 interest_idx 사용
	public void like_del_ch(List<Integer> list) throws Exception {
		sqlSession.delete(bm+"like_del_ch",list);
	}

	public void order_after_del(CartVO vo) throws Exception {
		sqlSession.delete(bm+"order_after_del",vo);
	}

	//midx가 선택한 관심 상품 pidx
	public List<LikeVO> checklike1(int midx) throws Exception {
		return sqlSession.selectList(bm+"checklike1", midx);
	}
	
	//커스텀 장바구니 등록을 위한 oidx찾기
	public int customoidx(int cuidx)throws Exception{
		return sqlSession.selectOne(bm+"customoidx",cuidx);
	}
	
	//커스텀 장바구니 등록
	public void custominsert(OrderVO vo)throws Exception{
		sqlSession.insert(bm+"custominsert",vo);
	}
	
}
