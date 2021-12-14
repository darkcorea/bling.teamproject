package com.project.bling.ad_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.EventVO;
import com.project.bling.vo.NoticeVO;

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
}
