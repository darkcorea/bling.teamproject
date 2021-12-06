package com.project.bling.service;

import java.util.List;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;

public interface MyPageService {

	public CombineVO orderComp(CombineVO vo) throws Exception;
	public CombineVO deliveryStat(CombineVO vo) throws Exception;
	public List<CombineVO> recentOrder(PageMaker pm) throws Exception;
	public void reviewWrite(CombineVO vo) throws Exception;
	public void reviewWrite1(CombineVO vo) throws Exception;
	public void reviewWrite2(CombineVO vo) throws Exception;
	public CombineVO reviewDetail(int ridx) throws Exception;
	public void reviewDelete(int ridx) throws Exception;
	public int reviewCount(int midx) throws Exception;
}
