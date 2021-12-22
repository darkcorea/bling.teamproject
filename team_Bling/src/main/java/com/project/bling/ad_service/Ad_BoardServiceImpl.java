package com.project.bling.ad_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.ad_dao.Ad_BoardDAO;
import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.EventVO;
import com.project.bling.vo.NoticeVO;
import com.project.bling.vo.Order_detailVO;
import com.project.bling.vo.Product_QuestionVO;
import com.project.bling.vo.QuestionVO;
import com.project.bling.vo.ReviewVO;

@Service("Ad_BoardService")
public class Ad_BoardServiceImpl implements Ad_BoardService{
	@Autowired
	Ad_BoardDAO ad_boardDAO;

	@Override
	public int listcount() throws Exception {
		return ad_boardDAO.listcount();
	}

	@Override
	public int listoptioncount(String type) throws Exception {
		return ad_boardDAO.listoptioncount(type);
	}
	
	@Override
	public int searchcount(String keyword) throws Exception {
		return ad_boardDAO.searchcount(keyword);
	}
	
	@Override
	public List<NoticeVO> totalList(PageMaker pm) throws Exception {
		return ad_boardDAO.totalList(pm);
	}

	@Override
	public List<NoticeVO> optionList(PageMaker pm) throws Exception {
		return ad_boardDAO.optionList(pm);
	}
	
	@Override
	public void deleteArr(int nidx) throws Exception {
		ad_boardDAO.deleteArr(nidx);
	}
	
	@Override
	public void insert(NoticeVO vo) throws Exception {
		ad_boardDAO.insert(vo);
	}

	@Override
	public NoticeVO detail(int nidx) throws Exception {
		return ad_boardDAO.detail(nidx);
	}

	@Override
	public void modify(NoticeVO vo) throws Exception {
		ad_boardDAO.modify(vo);
	}

	@Override
	public void event_insert(EventVO vo) throws Exception {
		ad_boardDAO.event_insert(vo);
	}
	
	@Override
	public void deleteArrEvent(int eidx) throws Exception {
		ad_boardDAO.deleteArrEvent(eidx);
	}
	

	
	/*		문의 사항		 */
	
	// 문의 사항 총 갯수
	@Override
	public int question_count(PageMaker pm) throws Exception {
		return ad_boardDAO.question_count(pm);
	}
	
	// 문의사항 리스트
	@Override
	public List<QuestionVO> question_list(PageMaker pm) throws Exception {
		return ad_boardDAO.question_list(pm);
	}
	
	// 문의사항 상품정보 가져오기
	@Override
	public List<CombineVO> question_detail(Order_detailVO ov) throws Exception {
		return ad_boardDAO.question_detail(ov);
	}
	
	// 문의사항 답글 작성과 업데이트 원글 답변완료 달기
	@Override
	public void question_write(QuestionVO qv) throws Exception {
		ad_boardDAO.question_write(qv);
	}

	// 작성한 답글 가져 오기 수정
	@Override
	public QuestionVO question_modify(int qidx) throws Exception {
		return ad_boardDAO.question_modify(qidx);
	}
	
	// 답글 수정하기
	@Override
	public void question_modify1(QuestionVO qv) throws Exception {
		ad_boardDAO.question_modify1(qv);
	}
	
	// 제품 문의 사항 총 갯수
	@Override
	public int question_product_count(PageMaker pm) throws Exception {
		return ad_boardDAO.question_product_count(pm);
	}
		
	// 제품 문의 사항 리스트
	@Override
	public List<Product_QuestionVO> question_product_list(PageMaker pm)throws Exception {
		return ad_boardDAO.question_product_list(pm);
	}
	
	// 문의한 상품에 대한 정보 가져오기
	@Override
	public List<CombineVO> product_detail(int pidx) throws Exception {
		return ad_boardDAO.product_detail(pidx);
	}
	
	// 제품 문의사항 답글 작성과 업데이트 원글 답변완료 달기
	@Override
	public void question_product_write(Product_QuestionVO pv) throws Exception {
		ad_boardDAO.question_product_write(pv);
	}
	
	// 제품 문의사항 답글 수정하기
	@Override
	public void question_product_modify(Product_QuestionVO pv) throws Exception {
		ad_boardDAO.question_product_modify(pv);		
	}

	// 리뷰 총 갯수
	@Override
	public int review_count(PageMaker pm) throws Exception {
		return ad_boardDAO.review_count(pm);
	}
	// 리뷰 리스트
	@Override
	public List<ReviewVO> review_list(PageMaker pm) throws Exception {
		return ad_boardDAO.review_list(pm);
	}
	
	// 리뷰삭제
	@Override
	public void review_delete(int ridx) throws Exception {
		ad_boardDAO.review_delete(ridx);
	}
	
	// 사용한 마일리지 돌려주고 payed_mileage는 0으로 변경
	@Override
	public void payed_mileage_add(CombineVO cv)throws Exception{
		ad_boardDAO.payed_mileage_add(cv);
	}

	
	
	
	
}
