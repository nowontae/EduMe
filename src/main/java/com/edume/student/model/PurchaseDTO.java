package com.edume.student.model;

import java.util.Date;

public class PurchaseDTO {
	
	private int pidx; 			//결제고유번호
	private int midx; 			//회원고유번호
	private int lidx; 			//강의고유번호
	private int pprice;			//결제금액
	private int pteacherincome; //강사 수익
	private int padminincome; 	//관리자 수익
	private Date pdate;			//결제일시
	private String mname;		//member 테이블 이름
	private String ltitle;		//lecture 테이블 강의명
	
	public PurchaseDTO() {
		// TODO Auto-generated constructor stub
	}

	public PurchaseDTO(int pidx, int midx, int lidx, int pprice, int pteacherincome, int padminincome, Date pdate,
			String mname, String ltitle) {
		super();
		this.pidx = pidx;
		this.midx = midx;
		this.lidx = lidx;
		this.pprice = pprice;
		this.pteacherincome = pteacherincome;
		this.padminincome = padminincome;
		this.pdate = pdate;
		this.mname = mname;
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

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getLtitle() {
		return ltitle;
	}

	public void setLtitle(String ltitle) {
		this.ltitle = ltitle;
	}
	
}
