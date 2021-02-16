package com.edume.student.model;

import java.sql.Date;

public class CartDTO {
	//장바구니
	private int midx; 			//member 테이블의 회원 고유 번호
	private String mname; 		//member 테이블의 회원 이름
	private int lidx;			//lecture 테이블의 강의 고유 번호
	private String ltitle;		//lecture 테이블의 강의 제목
	private String lsubtitle; 	//lecture 테이블의 부제목
	private String lthumnail;   //lecture 테이블의  썸네일 경로
	private int lorignprice; //lecture 테이블 기본 가격
	private int llastprice;   // 최종할인가격
	private int lteacherdiscount; // lteacherdiscount 강사 할인율
	private Date lteacherstartdiscount; // lteacherdiscount 강사 할인율
	private Date lteacherenddiscount; // lteacherdiscount 강사 할인율
	private int ladmindiscount;   // ladmindiscount 관리자 할인율
	private Date ladminstartdiscount;   // ladmindiscount 관리자 할인율
	private Date ladminenddiscount;   // ladmindiscount 관리자 할인율
	
	public CartDTO() {
		// TODO Auto-generated constructor stub
	}






	public CartDTO(int midx, String mname, int lidx, String ltitle, String lsubtitle, String lthumnail, int lorignprice,
			int llastprice, int lteacherdiscount, Date lteacherstartdiscount, Date lteacherenddiscount,
			int ladmindiscount, Date ladminstartdiscount, Date ladminenddiscount) {
		super();
		this.midx = midx;
		this.mname = mname;
		this.lidx = lidx;
		this.ltitle = ltitle;
		this.lsubtitle = lsubtitle;
		this.lthumnail = lthumnail;
		this.lorignprice = lorignprice;
		this.llastprice = llastprice;
		this.lteacherdiscount = lteacherdiscount;
		this.lteacherstartdiscount = lteacherstartdiscount;
		this.lteacherenddiscount = lteacherenddiscount;
		this.ladmindiscount = ladmindiscount;
		this.ladminstartdiscount = ladminstartdiscount;
		this.ladminenddiscount = ladminenddiscount;
	}






	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
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

	public String getLsubtitle() {
		return lsubtitle;
	}

	public void setLsubtitle(String lsubtitle) {
		this.lsubtitle = lsubtitle;
	}

	public String getLthumnail() {
		return lthumnail;
	}

	public void setLthumnail(String lthumnail) {
		this.lthumnail = lthumnail;
	}


	public int getLorignprice() {
		return lorignprice;
	}


	public void setLorignprice(int lorignprice) {
		this.lorignprice = lorignprice;
	}

	public int getLidx() {
		return lidx;
	}

	public void setLidx(int lidx) {
		this.lidx = lidx;
	}




	public int getLteacherdiscount() {
		return lteacherdiscount;
	}




	public void setLteacherdiscount(int lteacherdiscount) {
		this.lteacherdiscount = lteacherdiscount;
	}

	public int getLadmindiscount() {
		return ladmindiscount;
	}

	public void setLadmindiscount(int ladmindiscount) {
		this.ladmindiscount = ladmindiscount;
	}

	public Date getLteacherstartdiscount() {
		return lteacherstartdiscount;
	}

	public void setLteacherstartdiscount(Date lteacherstartdiscount) {
		this.lteacherstartdiscount = lteacherstartdiscount;
	}

	public Date getLteacherenddiscount() {
		return lteacherenddiscount;
	}


	public void setLteacherenddiscount(Date lteacherenddiscount) {
		this.lteacherenddiscount = lteacherenddiscount;
	}


	public Date getLadminstartdiscount() {
		return ladminstartdiscount;
	}


	public void setLadminstartdiscount(Date ladminstartdiscount) {
		this.ladminstartdiscount = ladminstartdiscount;
	}


	public Date getLadminenddiscount() {
		return ladminenddiscount;
	}








	public void setLadminenddiscount(Date ladminenddiscount) {
		this.ladminenddiscount = ladminenddiscount;
	}



	public int getLlastprice() {
		return llastprice;
	}



	public void setLlastprice(int llastprice) {
		this.llastprice = llastprice;
	}
	
	
	
	
}
