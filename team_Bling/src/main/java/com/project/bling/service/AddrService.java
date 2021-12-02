package com.project.bling.service;

import java.util.List;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.Address_listVO;

public interface AddrService {
	
	/*       주소록 리스트          */
	//주소록 갯수
	int count(int midx) throws Exception;
	//주소록 리스트 중 기본 배송지
	List<Address_listVO> one(int midx) throws Exception;
	//주소록 리스트
	List<Address_listVO> list(PageMaker pm) throws Exception;
	
	
	/*       주소록 저장          */
	//기본배송지 여부 확인
	void basic(int midx) throws Exception;
	//주소록저장
	void insert(Address_listVO al) throws Exception;
	
	
	/*       주소록 수정 및 삭제          */
	//주소록 정보 가져오기
	Address_listVO modify(int addr_idx) throws Exception;
	//주소록 수정
	void Remodify(Address_listVO al) throws Exception;
	//주소록 삭제
	void delete(int addr_idx) throws Exception;
}
