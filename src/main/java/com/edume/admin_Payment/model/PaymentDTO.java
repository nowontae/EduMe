package com.edume.admin_Payment.model;

import java.sql.*;

public class PaymentDTO {
	
	private int cidx;
	private int midx;
	private int ccode;
	private int camount;
	private String ccoment;
	private Date cpaydate;
	private	int pay_idx;
	private int pay_amount;
	private Date pay_reqDate;
	private Date pay_date;
	private	String tbank;
	private String tacctname;
	private String tacctnum;
	public PaymentDTO() {
		super();
	}
	public PaymentDTO(int cidx, int midx, int ccode, int camount, String ccoment, Date cpaydate, int pay_idx,
			int pay_amount, Date pay_reqDate, Date pay_date, String tbank, String tacctname, String tacctnum) {
		super();
		this.cidx = cidx;
		this.midx = midx;
		this.ccode = ccode;
		this.camount = camount;
		this.ccoment = ccoment;
		this.cpaydate = cpaydate;
		this.pay_idx = pay_idx;
		this.pay_amount = pay_amount;
		this.pay_reqDate = pay_reqDate;
		this.pay_date = pay_date;
		this.tbank = tbank;
		this.tacctname = tacctname;
		this.tacctnum = tacctnum;
	}
	public int getCidx() {
		return cidx;
	}
	public void setCidx(int cidx) {
		this.cidx = cidx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getCcode() {
		return ccode;
	}
	public void setCcode(int ccode) {
		this.ccode = ccode;
	}
	public int getCamount() {
		return camount;
	}
	public void setCamount(int camount) {
		this.camount = camount;
	}
	public String getCcoment() {
		return ccoment;
	}
	public void setCcoment(String ccoment) {
		this.ccoment = ccoment;
	}
	public Date getCpaydate() {
		return cpaydate;
	}
	public void setCpaydate(Date cpaydate) {
		this.cpaydate = cpaydate;
	}
	public int getPay_idx() {
		return pay_idx;
	}
	public void setPay_idx(int pay_idx) {
		this.pay_idx = pay_idx;
	}
	public int getPay_amount() {
		return pay_amount;
	}
	public void setPay_amount(int pay_amount) {
		this.pay_amount = pay_amount;
	}
	public Date getPay_reqDate() {
		return pay_reqDate;
	}
	public void setPay_reqDate(Date pay_reqDate) {
		this.pay_reqDate = pay_reqDate;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public String getTbank() {
		return tbank;
	}
	public void setTbank(String tbank) {
		this.tbank = tbank;
	}
	public String getTacctname() {
		return tacctname;
	}
	public void setTacctname(String tacctname) {
		this.tacctname = tacctname;
	}
	public String getTacctnum() {
		return tacctnum;
	}
	public void setTacctnum(String tacctnum) {
		this.tacctnum = tacctnum;
	}
	
	
	
}
