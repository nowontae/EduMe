package com.edume.student.model;

import java.sql.Date;

public class PurchaseDTO {

	private int pidx;
	private int midx;
	private int lidx;
	private int pprice;
	private int pteacherincome;
	private int padminincome;
	private Date pdate;
	private String ltitle;
	
	public PurchaseDTO() {
		super();
	}
	
	public PurchaseDTO(int pidx, int midx, int lidx, int pprice, int pteacherincome, int padminincome, Date pdate,
			String ltitle) {
		super();
		this.pidx = pidx;
		this.midx = midx;
		this.lidx = lidx;
		this.pprice = pprice;
		this.pteacherincome = pteacherincome;
		this.padminincome = padminincome;
		this.pdate = pdate;
		this.ltitle = ltitle;
	}

	public int getPidx() {
		return pidx;
	}
	public void setPidx(int pidx) {
		this.pidx = pidx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getLidx() {
		return lidx;
	}
	public void setLidx(int lidx) {
		this.lidx = lidx;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public int getPteacherincome() {
		return pteacherincome;
	}
	public void setPteacherincome(int pteacherincome) {
		this.pteacherincome = pteacherincome;
	}
	public int getPadminincome() {
		return padminincome;
	}
	public void setPadminincome(int padminincome) {
		this.padminincome = padminincome;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	public String getLtitle() {
		return ltitle;
	}

	public void setLtitle(String ltitle) {
		this.ltitle = ltitle;
	}

	

}
