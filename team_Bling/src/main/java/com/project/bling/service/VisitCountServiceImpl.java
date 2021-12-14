package com.project.bling.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.VisitCountDAO;

@Service("VisitCountService")
public class VisitCountServiceImpl implements VisitCountService{
	@Autowired
	VisitCountDAO visitcountDAO;

	@Override
	public void visiter() throws Exception {
		visitcountDAO.visiter();
	}

}
