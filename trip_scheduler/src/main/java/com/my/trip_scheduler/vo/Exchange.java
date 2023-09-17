package com.my.trip_scheduler.vo;

import org.springframework.stereotype.Repository;

public class Exchange {

	private int exchange_idx=0;
	private int sm_idx=0;
	private String exchange_type=null;
	private int exchange_rate=0;
	
	public int getExchange_idx() {
		return exchange_idx;
	}
	public void setExchange_idx(int exchange_idx) {
		this.exchange_idx = exchange_idx;
	}
	public int getSm_idx() {
		return sm_idx;
	}
	public void setSm_idx(int sm_idx) {
		this.sm_idx = sm_idx;
	}
	public String getExchange_type() {
		return exchange_type;
	}
	public void setExchange_type(String exchange_type) {
		this.exchange_type = exchange_type;
	}
	public int getExchange_rate() {
		return exchange_rate;
	}
	public void setExchange_rate(int exchange_rate) {
		this.exchange_rate = exchange_rate;
	}
	
	
}
