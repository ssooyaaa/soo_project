package com.my.trip_scheduler.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.trip_scheduler.dao.MemoDao;
import com.my.trip_scheduler.vo.Memo;

@Service
public class MemoService {

	@Autowired
	MemoDao memoDao;
	
	public int addMemo(Memo m) {
		return memoDao.addMemo(m);
	}
	
	public List<Memo> getMemo(Memo m){
		return memoDao.getMemo(m);
	}
	
	public int delMemo(int idx) {
		return memoDao.delMemo(idx);
	}
}
