package com.project.bling.ad_service;

import java.util.List;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.EventVO;
import com.project.bling.vo.NoticeVO;
import com.project.bling.vo.Order_detailVO;
import com.project.bling.vo.Product_QuestionVO;
import com.project.bling.vo.QuestionVO;
import com.project.bling.vo.ReviewVO;

public interface Ad_BoardService {
	
	//공지사항 총 개수
	int listcount() throws Exception;
	
	//공지사항 옵션 총 개수
	int listoptioncount(String type) throws Exception;
	
	//공지사항 검색 총 개수
	int searchcount(String keyword) throws Exception;
	
	//공지사항  총 페이징
	List<NoticeVO> totalList(PageMaker pm)throws Exception;
	
	//공지사항 옵션 페이징
	List<NoticeVO> optionList(PageMaker pm)throws Exception;
	
	//공지사항 삭제
	void deleteArr(int nidx)throws Exception;
	
	//공지사항 db에 등록
	void insert(NoticeVO vo) throws Exception;
	
	//공지사항 수정 전 불러오기(detail)
	NoticeVO detail(int nidx) throws Exception;
	
	//공지사항 수정
	void modify(NoticeVO vo) throws Exception;
	
	//이벤트 db에 등록
	void event_insert(EventVO vo) throws Exception;
	
	//공지사항 삭제
	void deleteArrEvent(int eidx)throws Exception;
	
	/*---------------------------------------------------------*/
	// 문의사항 리스트
	int question_count(PageMaker pm)throws Exception;
	List<QuestionVO> question_list(PageMaker pm)throws Exception;
	List<CombineVO> question_detail(Order_detailVO ov)throws Exception;
	void question_write(QuestionVO qv)throws Exception;
	QuestionVO question_modify(int qidx)throws Exception;
	void question_modify1(QuestionVO qv)throws Exception;
	int question_product_count(PageMaker pm)throws Exception;
	List<Product_QuestionVO> question_product_list(PageMaker pm)throws Exception;
	List<CombineVO> product_detail(int pidx)throws Exception;
	void question_product_write(Product_QuestionVO pv)throws Exception;
	void question_product_modify(Product_QuestionVO pv)throws Exception;
	void payed_mileage_add(CombineVO cv)throws Exception;
	
	// 리뷰 리스트
	int review_count(PageMaker pm) throws Exception;
	List<ReviewVO> review_list(PageMaker pm)throws Exception;
	void review_delete(int ridx)throws Exception;
	
}
