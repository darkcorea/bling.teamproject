package com.project.bling.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CustomVO;

@Repository
public class CustomDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String cm = "com.project.bling.mapper.customMapper.";
	
	//이미지 가져오기
	public List<CustomVO> shape(int type) throws Exception{
		return sqlSession.selectList(cm+"shape",type);
	}
	public List<CustomVO> shapes(CustomVO co) throws Exception{
		return sqlSession.selectList(cm+"shapes",co);
	}
	
	//저장하기
	public void insertdb(CustomVO co) throws Exception{
		sqlSession.insert(cm+"insertdb",co);
	}
	
	//개수
	public int howmany(int midx) throws Exception{
		return sqlSession.selectOne(cm+"howmany",midx);
	}
	
	//리스트
	public List<CustomVO> listajax(PageMaker pm) throws Exception{	
		return sqlSession.selectList(cm+"listajax",pm);
	}
	
	//삭제
	public void dellist(int cuidx) throws Exception{
		sqlSession.update(cm+"dellist",cuidx);
	}
}
