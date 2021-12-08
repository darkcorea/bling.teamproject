package com.project.bling.service;

import java.util.List;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.UserVO;

public interface MyPageService {

	public CombineVO orderComp(CombineVO vo) throws Exception;
	public CombineVO deliveryStat(CombineVO vo) throws Exception;
	public List<CombineVO> recentOrder(PageMaker pm) throws Exception;
	public void reviewWrite(CombineVO vo) throws Exception;
	public void reviewWrite1(CombineVO vo) throws Exception;
	public void reviewWrite2(CombineVO vo) throws Exception;
	public CombineVO reviewDetail(int ridx) throws Exception;
	public void reviewDelete(int ridx) throws Exception;
	public int orderCount(int midx) throws Exception;
	
	//회원정보수정 첫번째 비밀번호 확인시 갖고오는 이름정보
	public UserVO confirm(int midx)throws Exception;
	//회원정보 수정
	public void remodify(UserVO uv)throws Exception;
	//탈퇴
	public void del(int midx)throws Exception;
}
