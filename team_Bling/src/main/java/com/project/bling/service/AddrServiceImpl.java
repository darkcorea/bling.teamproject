package com.project.bling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.AddrDAO;
import com.project.bling.domain.PageMaker;
import com.project.bling.vo.Address_listVO;

@Service("AddrService")
public class AddrServiceImpl implements AddrService {

	@Autowired
	AddrDAO addrDAO;
	
	/*       주소록 리스트          */
	//주소록 갯수
	@Override
	public int count(int midx) throws Exception {
		return addrDAO.count(midx);
	}
	
	//주소록 리스트 중 기본 배송지
	@Override
	public List<Address_listVO> one(int midx) throws Exception {
		return addrDAO.one(midx);
	}
	
	//주소록 리스트
	@Override
	public List<Address_listVO> list(PageMaker pm) throws Exception {
		return addrDAO.list(pm);
	}

	/*       주소록 저장          */
	//기본배송지 여부 확인
	@Override
	public void basic(int midx) throws Exception {
		addrDAO.basic(midx);
	}
	
	//주소록저장
	@Override
	public void insert(Address_listVO al) throws Exception {
		addrDAO.insert(al);
	}
	
	/*       주소록 수정 및 삭제          */
	//주소록 정보 가져오기
	@Override
	public Address_listVO modify(int addr_idx) throws Exception {
		return addrDAO.modify(addr_idx);
	}
	//주소록 수정
	@Override
	public void Remodify(Address_listVO al) throws Exception {
		addrDAO.Remodify(al);
	}
	//주소록 삭제
	@Override
	public void delete(int addr_idx) throws Exception {
		addrDAO.delete(addr_idx);
	}
	
}
