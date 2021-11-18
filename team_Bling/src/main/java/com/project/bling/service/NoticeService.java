package com.project.bling.service;

import java.util.List;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.NoticeVO;

public interface NoticeService {
	
	int Question_Count() throws Exception;
	List<NoticeVO> Question_page(PageMaker pm) throws Exception;

}
