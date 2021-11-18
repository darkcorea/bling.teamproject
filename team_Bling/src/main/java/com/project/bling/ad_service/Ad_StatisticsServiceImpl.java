package com.project.bling.ad_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.ad_dao.Ad_StatisticsDAO;

@Service("Ad_StatisticsService")
public class Ad_StatisticsServiceImpl implements Ad_StatisticsService{
	@Autowired
	Ad_StatisticsDAO ad_statisticsDAO;
}
