package com.my.trip_scheduler.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.trip_scheduler.vo.Memo;

@Repository
public class MemoDao {

	@Autowired
	SqlSession s;
	
	public int addMemo(Memo m) {
		return s.insert("memo.addMemo",m);
	}
}
