package com.my.trip_scheduler.dao;

import java.util.List;

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
	
	public List<Memo> getMemo(Memo m){
		return s.selectList("memo.getMemo",m);
	}
	
	public int delMemo(int idx) {
		return s.delete("memo.delMemo", idx);
	}
}
