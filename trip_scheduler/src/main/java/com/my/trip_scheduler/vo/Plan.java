package com.my.trip_scheduler.vo;

public class Plan {

	private int plan_idx=0;
	private int sm_idx=0;
	private int day=0;
	private String start_time=null;
	private String end_time=null;
	private String todo=null;
	private String priceType=null;
	private int price=0;
	
	
	public int getPlan_idx() {
		return plan_idx;
	}
	public void setPlan_idx(int plan_idx) {
		this.plan_idx = plan_idx;
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
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getTodo() {
		return todo;
	}
	public void setTodo(String todo) {
		this.todo = todo;
	}
	public String getPriceType() {
		return priceType;
	}
	public void setPriceType(String priceType) {
		this.priceType = priceType;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
	
}
