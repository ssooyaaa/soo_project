package com.my.trip_scheduler.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.trip_scheduler.dao.SummaryFollowDao;

@Service
public class SummaryFollowService {

	@Autowired
	SummaryFollowDao smflDao;
}
