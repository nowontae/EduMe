package com.edume.student.model;

public class CartDTO {
	//장바구니
	private int midx; 			//member 테이블의 회원 고유 번호
	private String mname; 		//member 테이블의 회원 이름
	private int lidx;			//lecture 테이블의 강의 고유 번호
	private String ltitle;		//lecture 테이블의 강의 제목
	private String lsubtitle; 	//lecture 테이블의 부제목
	private String lthumnail;   //lecture 테이블의  썸네일 경로
	private String lorignprice; //lecture 테이블 기본 가격
	
	public CartDTO() {
		// TODO Auto-generated constructor stub
	}



	public CartDTO(int midx, String mname, int lidx, String ltitle, String lsubtitle, String lthumnail,
			String lorignprice) {
		super();
		this.midx = midx;
		this.mname = mname;
		this.lidx = lidx;
		this.ltitle = ltitle;
		this.lsubtitle = lsubtitle;
		this.lthumnail = lthumnail;
		this.lorignprice = lorignprice;
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

	public String getLorignprice() {
		return lorignprice;
	}

	public void setLorignprice(String lorignprice) {
		this.lorignprice = lorignprice;
	}

	public int getLidx() {
		return lidx;
	}

	public void setLidx(int lidx) {
		this.lidx = lidx;
	}
	
	
}
