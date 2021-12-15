package com.project.bling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.MyPageDAO;
import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.UserVO;

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
	public List<CombineVO> recentOrder(PageMaker pm) throws Exception {
		
		return myPageDAO.recentOrder(pm);
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

	@Override
	public CombineVO reviewDetail(int ridx) throws Exception {
		
		return myPageDAO.reviewDetail(ridx);
	}

	@Override
	public void reviewDelete(int ridx) throws Exception {
		myPageDAO.reviewDelete(ridx);
	}
	
	// midx에 따른 리뷰 갯수
	@Override
	public int orderCount(int midx) throws Exception {
		return myPageDAO.orderCount(midx);
	}
	
	//회원정보수정 첫번째 비밀번호 확인시 갖고오는 이름정보
	@Override
	public UserVO confirm(int midx) throws Exception {
		return myPageDAO.confirm(midx);
	}
	
	//회원정보 수정
	@Override
	public void remodify(UserVO uv) throws Exception {
		myPageDAO.remodify(uv);
	}

	//탈퇴비번확인
	@Override
	public String delconfirm(int midx) throws Exception {
		return myPageDAO.delconfirm(midx);
	}
	
	//탈퇴
	@Override
	public void del(CombineVO vo) throws Exception {
		myPageDAO.del(vo);
	}
	
}
