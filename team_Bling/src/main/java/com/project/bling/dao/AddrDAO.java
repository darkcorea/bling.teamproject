package com.project.bling.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.Address_listVO;

@Repository
public class AddrDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String am = "com.project.bling.mapper.addrMapper.";
	
	/*       주소록 리스트          */
	//주소록 갯수
	public int count(int midx) throws Exception{
		return sqlSession.selectOne(am+"count",midx);
	}
	//주소록 리스트 중 기본 배송지
	public List<Address_listVO> one(int midx) throws Exception{
		return sqlSession.selectList(am+"one",midx);
	}
	//주소록 리스트
	public List<Address_listVO> list(PageMaker pm) throws Exception{
		return sqlSession.selectList(am+"list",pm);
	}
	
	/*       주소록 저장          */
	//기본배송지 여부 확인
	public void basic(int midx) throws Exception{
		sqlSession.update(am+"basic",midx);
	}
	//주소록저장
	public void insert(Address_listVO al) throws Exception{
		sqlSession.insert(am+"insert",al);
	}
	
	/*       주소록 수정 및 삭제          */
	//주소록 정보 가져오기
	public Address_listVO modify(int addr_idx) throws Exception{
		return sqlSession.selectOne(am+"modify",addr_idx);
	}
	
	//주소록 수정
	public void Remodify(Address_listVO al) throws Exception{
		sqlSession.update(am+"Remodify",al);
	}
	
	//주소록 삭제
	public void delete(int addr_idx) throws Exception{
		sqlSession.delete(am+"delete",addr_idx);
	}
}
