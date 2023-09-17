package com.my.trip_scheduler.vo;

public class TotalPrice {

	private int totalPrice_idx=0;
	private int sm_idx=0;
	private String total="환율 정보를 입력해주세요";
	
	public int getTotalPrice_idx() {
		return totalPrice_idx;
	}
	public void setTotalPrice_idx(int totalPrice_idx) {
		this.totalPrice_idx = totalPrice_idx;
	}
	public int getSm_idx() {
		return sm_idx;
	}
	public void setSm_idx(int sm_idx) {
		this.sm_idx = sm_idx;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	
	
}
