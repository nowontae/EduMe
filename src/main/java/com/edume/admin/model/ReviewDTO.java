package com.edume.admin.model;

import java.util.*;

public class ReviewDTO {
    
    private int ridx; 		 //리뷰 고유 번호
	private int midx;		 //회원 고유 번호
	private int lidx; 		 //강의 고유 번호
	private String rscore;	 //별점
	private String rcomment; //내용
	private char ropen;		 //공개여부
	private Date rwritedate; //작성일자 

	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReviewDTO(int ridx, int midx, int lidx, String rscore, String rcomment, char ropen, Date rwritedate) {
		super();
		this.ridx = ridx;
		this.midx = midx;
		this.lidx = lidx;
		this.rscore = rscore;
		this.rcomment = rcomment;
		this.ropen = ropen;
		this.rwritedate = rwritedate;
	}

	public int getRidx() {
		return ridx;
	}

	public void setRidx(int ridx) {
		this.ridx = ridx;
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

	public String getRscore() {
		return rscore;
	}

	public void setRscore(String rscore) {
		this.rscore = rscore;
	}

	public String getRcomment() {
		return rcomment;
	}

	public void setRcomment(String rcomment) {
		this.rcomment = rcomment;
	}

	public char getRopen() {
		return ropen;
	}

	public void setRopen(char ropen) {
		this.ropen = ropen;
	}

	public Date getRwritedate() {
		return rwritedate;
	}

	public void setRwritedate(Date rwritedate) {
		this.rwritedate = rwritedate;
	}
	
}
