package com.project.bling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.MyPageDAO;
import com.project.bling.vo.CombineVO;

@Service("MyPageService")
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	MyPageDAO myPageDAO;

	@Override
	public CombineVO orderComp(CombineVO vo) throws Exception {
		
		return myPageDAO.orderComp(vo);
	}

	@Override
	public CombineVO deliveryStat(CombineVO vo) throws Exception {
		
		return myPageDAO.deliveryStat(vo);
	}

	@Override
	public List<CombineVO> recentOrder(CombineVO vo) throws Exception {
		
		return myPageDAO.recentOrder(vo);
	}

	@Override
	public void reviewWrite(CombineVO vo) throws Exception {
		System.out.println("마이페이지 서비스-image2 : "+vo.getImage2());
		myPageDAO.reviewWrite(vo);
		
	}

	@Override
	public void reviewWrite1(CombineVO vo) throws Exception {
		myPageDAO.reviewWrite1(vo);
		
	}

	@Override
	public void reviewWrite2(CombineVO vo) throws Exception {
		myPageDAO.reviewWrite2(vo);
		
	}
	
	

	
}
