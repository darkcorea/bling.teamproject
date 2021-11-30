package com.project.bling.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.NoticeVO;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String ps = "com.project.bling.mapper.noticeMapper.";
	
	//첫페이지 중요공지(S)3개 리스트
	public List<NoticeVO> special() throws Exception{
		return sqlSession.selectList(ps+"special");
	}
	
	//첫페이지 S,N섞은 시간순 7개 리스트
	public List<NoticeVO> firstpage() throws Exception{
		return sqlSession.selectList(ps+"firstpage");
	}
	//2번째 페이지부터 쭉
	//공지사항 총 개수
	public int listcount() throws Exception{
		return sqlSession.selectOne(ps+"listCount");
	}
	
	//공지사항 총 페이징
	public List<NoticeVO> totalList(PageMaker pm)throws Exception{
		return sqlSession.selectList(ps+"totalList",pm);
	}
	
	//공지사항 검색 총 개수
	public int searchcount(String keyword) throws Exception{
		return sqlSession.selectOne(ps+"searchcount",keyword);
	}
		
	
	//검색리스트
	public List<NoticeVO> searchList(PageMaker pm)throws Exception{
		return sqlSession.selectList(ps+"totalList",pm);
	}
	
	//공지사항 detail
	public NoticeVO detail(int nidx) throws Exception{
		return sqlSession.selectOne(ps+"sp_detail",nidx);
	}
}
