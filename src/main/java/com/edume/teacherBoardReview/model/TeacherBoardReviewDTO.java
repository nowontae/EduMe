package com.edume.teacherBoardReview.model;

import java.util.Date;

public class TeacherBoardReviewDTO {

	/*후기 리스트*/
	private int ridx;
	private int midx;
	private int lidx;
	private int rscore;
	private String rcomment;
	private String ropen;
	private Date rwritedate;
	
	public TeacherBoardReviewDTO() {
		super();
	}


	public TeacherBoardReviewDTO(int ridx, int midx, int lidx, int rscore, String rcomment, String ropen,
			Date rwritedate) {
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

	public int getRscore() {
		return rscore;
	}

	public void setRscore(int rscore) {
		this.rscore = rscore;
	}

	public String getRcomment() {
		return rcomment;
	}

	public void setRcomment(String rcomment) {
		this.rcomment = rcomment;
	}

	public String getRopen() {
		return ropen;
	}

	public void setRopen(String ropen) {
		this.ropen = ropen;
	}

	public Date getRwritedate() {
		return rwritedate;
	}

	public void setRwritedate(Date rwritedate) {
		this.rwritedate = rwritedate;
	}
	
}
