package com.project.bling.ad_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.EventVO;
import com.project.bling.vo.NoticeVO;
import com.project.bling.vo.Order_detailVO;
import com.project.bling.vo.Product_QuestionVO;
import com.project.bling.vo.QuestionVO;

@Repository
public class Ad_BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private String ps = "com.project.bling.mapper.adminmapper.ad_boardMapper.";
	
	//공지사항 총 개수
	public int listcount() throws Exception{
		return sqlSession.selectOne(ps+"listCount");
	}
	
	//공지사항 옵션선택 총 개수
	public int listoptioncount(String type) throws Exception{
		return sqlSession.selectOne(ps+"listOptionCount",type);
	}
	
	//공지사항 검색 총 개수
	public int searchcount(String keyword) throws Exception{
		return sqlSession.selectOne(ps+"searchcount",keyword);
	}
	
	//공지사항 총 페이징
	public List<NoticeVO> totalList(PageMaker pm)throws Exception{
		return sqlSession.selectList(ps+"totalList",pm);
	}
	
	//공지사항 옵션선택 페이징
	public List<NoticeVO> optionList(PageMaker pm)throws Exception{
		return sqlSession.selectList(ps+"optionList",pm);
	}
	
	//공지사항 삭제
	public void deleteArr(int nidx)throws Exception{
		sqlSession.delete(ps+"deleteArr",nidx);
	}
	
	//공지사항 db에 저장
	public void insert(NoticeVO vo) throws Exception{
		sqlSession.insert(ps+"confirm",vo);
	}
	
	//공지사항 수정 전 불러오기(detail 포함)
	public NoticeVO detail(int nidx) throws Exception{
		return sqlSession.selectOne(ps+"sp_detail",nidx);
	}
	
	//공지사항 수정
	public void modify(NoticeVO vo) throws Exception{
		sqlSession.update(ps+"modify",vo);
	}
	
	//이벤트 db에 저장
	public void event_insert(EventVO vo)throws Exception{
		sqlSession.insert(ps+"event_regist",vo);
	}
	
	//이벤트 삭제
	public void deleteArrEvent(int eidx)throws Exception{
		sqlSession.delete(ps+"deleteArrEvent",eidx);
	}
	
	/*            문의 사항          */
	
	//문의 사항 갯수
	public int question_count(PageMaker pm)throws Exception{
		return sqlSession.selectOne(ps+"question_count", pm);
	}
	
	//문의 사항 리스트
	public List<QuestionVO> question_list(PageMaker pm)throws Exception{
		return sqlSession.selectList(ps+"question_list", pm);
	}
	
	// 문의 사항 상품 정보 가져오기
	public List<CombineVO> question_detail(Order_detailVO ov)throws Exception{
		return sqlSession.selectList(ps+"question_detail", ov);
	}
	
	// 문의사항 답글 작성과 업데이트 원글 답변완료 달기
	public void question_write(QuestionVO qv) throws Exception {
		sqlSession.insert(ps+"question_write",qv);
		sqlSession.update(ps+"question_state",qv);
	}
	
	// 작성한 답글 가져 오기 수정
	public QuestionVO question_modify(int qidx)throws Exception{
		return sqlSession.selectOne(ps+"question_modify", qidx);
	}
	
	// 답글 수정 하기
	public void question_modify1(QuestionVO qv)throws Exception{
		sqlSession.update(ps+"question_modify1", qv);
	}
	
	//제품 문의 사항 갯수
	public int question_product_count(PageMaker pm)throws Exception{
		return sqlSession.selectOne(ps+"question_product_count", pm);
	}
	
	// 제품 문의 사항 리스트
	public List<Product_QuestionVO> question_product_list(PageMaker pm)throws Exception{
		return sqlSession.selectList(ps+"question_product_list", pm);
	}
	
	// 문의한 상품에 대한 정보 가져오기
	public List<CombineVO> product_detail(int pidx)throws Exception{
		return sqlSession.selectList(ps+"product_detail", pidx);
	}
	
	// 제품 문의사항 답글 작성과 업데이트 원글 답변완료 달기
	public void question_product_write(Product_QuestionVO pv) throws Exception {
		sqlSession.insert(ps+"question_product_write", pv);
		sqlSession.update(ps+"question_product_state", pv);
	}
	
	// 제품 문의 사항 답글 수정하기
	public void question_product_modify(Product_QuestionVO pv)throws Exception{
		sqlSession.update(ps+"question_product_modify", pv);
	}
	
}
