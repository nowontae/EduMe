package com.edume.student.model;

import java.sql.Date;

public class CreditDTO {

	
	private int cidx;
	private int midx;
	private int ccode;
	private int camount;
	private String ccoment;
	private Date cpaydate;
	public CreditDTO() {
		super();
	}
	public CreditDTO(int cidx, int midx, int ccode, int camount, String ccoment, Date cpaydate) {
		super();
		this.cidx = cidx;
		this.midx = midx;
		this.ccode = ccode;
		this.camount = camount;
		this.ccoment = ccoment;
		this.cpaydate = cpaydate;
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
	
	
}
