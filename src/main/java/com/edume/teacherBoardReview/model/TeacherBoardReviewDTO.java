package com.edume.teacherBoardReview.model;

import java.util.Date;

public class TeacherBoardReviewDTO {

	private int ridx;
	private int midx;
	private int lidx;
	private int rscore;
	private String rcomment;
	private String ropen;
	private Date rwritedate;
	private String mid;
	private String ltitle;
	private Date lwritedate;
	private int avggrade;
	
	public TeacherBoardReviewDTO() {
		super();
	}

	public TeacherBoardReviewDTO(int ridx, int midx, int lidx, int rscore, String rcomment, String ropen,
			Date rwritedate, String mid, String ltitle, Date lwritedate, int avggrade) {
		super();
		this.ridx = ridx;
		this.midx = midx;
		this.lidx = lidx;
		this.rscore = rscore;
		this.rcomment = rcomment;
		this.ropen = ropen;
		this.rwritedate = rwritedate;
		this.mid = mid;
		this.ltitle = ltitle;
		this.lwritedate = lwritedate;
		this.avggrade = avggrade;
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

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getLtitle() {
		return ltitle;
	}

	public void setLtitle(String ltitle) {
		this.ltitle = ltitle;
	}

	public Date getLwritedate() {
		return lwritedate;
	}

	public void setLwritedate(Date lwritedate) {
		this.lwritedate = lwritedate;
	}

	public int getAvggrade() {
		return avggrade;
	}

	public void setAvggrade(int avggrade) {
		this.avggrade = avggrade;
	}
	
}
