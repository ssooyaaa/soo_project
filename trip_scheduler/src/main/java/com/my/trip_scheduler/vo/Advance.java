package com.my.trip_scheduler.vo;

public class Advance {
	
	private int ad_idx=0;
	private int sm_idx=0;
	private String item=null;
	private String price_type=null;
	private int price=0;
	
	
	public int getAd_idx() {
		return ad_idx;
	}
	public void setAd_idx(int ad_idx) {
		this.ad_idx = ad_idx;
	}
	public int getSm_idx() {
		return sm_idx;
	}
	public void setSm_idx(int sm_idx) {
		this.sm_idx = sm_idx;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	
	public String getPrice_type() {
		return price_type;
	}
	public void setPrice_type(String price_type) {
		this.price_type = price_type;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	

}
