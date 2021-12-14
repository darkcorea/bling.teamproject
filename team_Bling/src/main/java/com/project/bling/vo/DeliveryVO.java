package com.project.bling.vo;

public class DeliveryVO {
	private int didx;
	private String invoice_num;
	private int order_idx;
	private String cancel;
	private String refund;
	private String exchange;
	private String deli_com;
	private String deli_stat;
	private String send_day;
	private String order_yn;
	private String confirm_yn;
	
	//어드민 메인에 뿌려줄때 사용할 그릇
	private int deli_stat_n;
	private int deli_stat_y;
	private int deli_stat_a;
	private int deli_stat_b;
	private int deli_stat_c;
	
	
	
	public int getDeli_stat_n() {
		return deli_stat_n;
	}

	public void setDeli_stat_n(int deli_stat_n) {
		this.deli_stat_n = deli_stat_n;
	}

	public int getDeli_stat_y() {
		return deli_stat_y;
	}

	public void setDeli_stat_y(int deli_stat_y) {
		this.deli_stat_y = deli_stat_y;
	}

	public int getDeli_stat_a() {
		return deli_stat_a;
	}

	public void setDeli_stat_a(int deli_stat_a) {
		this.deli_stat_a = deli_stat_a;
	}

	public int getDeli_stat_b() {
		return deli_stat_b;
	}

	public void setDeli_stat_b(int deli_stat_b) {
		this.deli_stat_b = deli_stat_b;
	}

	public int getDeli_stat_c() {
		return deli_stat_c;
	}

	public void setDeli_stat_c(int deli_stat_c) {
		this.deli_stat_c = deli_stat_c;
	}

	public String getConfirm_yn() {
		return confirm_yn;
	}

	public void setConfirm_yn(String confirm_yn) {
		this.confirm_yn = confirm_yn;
	}

	public DeliveryVO() {
		
	}
	
	public int getDidx() {
		return didx;
	}
	public void setDidx(int didx) {
		this.didx = didx;
	}
	public String getInvoice_num() {
		return invoice_num;
	}
	public void setInvoice_num(String invoice_num) {
		this.invoice_num = invoice_num;
	}
	public int getOrder_idx() {
		return order_idx;
	}
	public void setOrder_idx(int order_idx) {
		this.order_idx = order_idx;
	}
	public String getCancel() {
		return cancel;
	}
	public void setCancel(String cancel) {
		this.cancel = cancel;
	}
	public String getRefund() {
		return refund;
	}
	public void setRefund(String refund) {
		this.refund = refund;
	}
	public String getExchange() {
		return exchange;
	}
	public void setExchange(String exchange) {
		this.exchange = exchange;
	}
	public String getDeli_com() {
		return deli_com;
	}
	public void setDeli_com(String deli_com) {
		this.deli_com = deli_com;
	}
	public String getDeli_stat() {
		return deli_stat;
	}
	public void setDeli_stat(String deli_stat) {
		this.deli_stat = deli_stat;
	}
	public String getSend_day() {
		return send_day;
	}
	public void setSend_day(String send_day) {
		this.send_day = send_day;
	}

	public String getOrder_yn() {
		return order_yn;
	}

	public void setOrder_yn(String order_yn) {
		this.order_yn = order_yn;
	}
	
	
}
