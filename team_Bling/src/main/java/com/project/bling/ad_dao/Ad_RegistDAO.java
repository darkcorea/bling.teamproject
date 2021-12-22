package com.project.bling.ad_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.CustomVO;
import com.project.bling.vo.ImageVO;
import com.project.bling.vo.OptionVO;
import com.project.bling.vo.ProductVO;

@Repository
public class Ad_RegistDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private String am = "com.project.bling.mapper.adminmapper.ad_registMapper.";
	
	// 제품 등록하기
	public void insert(ProductVO vo) throws Exception{
		sqlSession.insert(am+"productInsert", vo);
	}
	
	// 옵션 등록	
	public void insertOpt(OptionVO vo) throws Exception{
		sqlSession.insert(am+"optionInsert", vo);
	}
	
	// 제품 이미지 등록
	public void insertImg(ImageVO vo) throws Exception{
		sqlSession.insert(am+"imageInsert", vo);
		 
	}
	
	// 제품 총 갯수
	public int product_count(String kind) throws Exception {
		return sqlSession.selectOne(am+"product_count", kind);
	}
	
	// 제품 총 갯수
	public int product_count1(String kind) throws Exception {
		return sqlSession.selectOne(am+"product_count1", kind);
	}
	// 제품 정보 불러오기 
	public List<CombineVO> list(PageMaker pm) throws Exception{
		return sqlSession.selectList(am+"list", pm);
	}
	

	// 상품 옵션 불러오기
	public List<OptionVO> oblist() throws Exception {
		return sqlSession.selectList(am+"oblist");
	}
	
	//pidx로 제품정보 불러오기
	public ProductVO product(int pidx) throws Exception {
		return sqlSession.selectOne(am+"product", pidx);
	}
	
	// 제품 수정하기
	public void updatePro(ProductVO vo) throws Exception{
		sqlSession.update(am+"updatePro", vo);
	}
	
	// pidx로 옵션 정보 불러오기
	public List<OptionVO> oblist(int pidx) throws Exception {
		return sqlSession.selectList(am+"oblist", pidx);
	}
	
	// 제품 옵션 수정하기
	public void updateOpt(OptionVO ov) throws Exception{
		sqlSession.update(am+"updateOpt", ov);
	}
	
	//제품 옵션 삭제하기
	public void deleteOpt(int oidx) throws Exception{
		sqlSession.update(am+"deleteOpt", oidx);
	}
	
	// pidx로 제품 이미지 가져오기
	public ImageVO image(int pidx) throws Exception {
		return sqlSession.selectOne(am+"image", pidx);
	}
	
	// 제품 이미지 칼럼에 있는 파일명 지우기
	public void deleteImg(CombineVO cv) throws Exception {
		sqlSession.update(am+"deleteImg", cv);
	}
	
	// 제품 이미지 수정
	public void updateImg(ImageVO vo) throws Exception {
		sqlSession.update(am+"updateImg", vo);
	}
	// 옵션이 20개 미만 제품
	public int sold_out_count() throws Exception {
		return sqlSession.selectOne(am+"sold_out_count");
	}
	// 옵션이 20개 미만 제품
	public List<CombineVO> sold_out_list(PageMaker pm) throws Exception{
		return sqlSession.selectList(am+"sold_out_list", pm);
	}
	
	//커스텀 추가
	public void customregist(CustomVO vo) throws Exception{
		sqlSession.insert(am+"customregist",vo);
	}
}
