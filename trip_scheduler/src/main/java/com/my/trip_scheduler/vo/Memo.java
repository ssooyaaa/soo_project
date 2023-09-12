package com.my.trip_scheduler.vo;

public class Memo {

	private int memo_idx=0;
	private int sm_idx=0;
	private int day=0;
	private String id=null;
	private String content=null;
	
	public int getMemo_idx() {
		return memo_idx;
	}
	public void setMemo_idx(int memo_idx) {
		this.memo_idx = memo_idx;
	}
	public int getSm_idx() {
		return sm_idx;
	}
	public void setSm_idx(int sm_idx) {
		this.sm_idx = sm_idx;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
