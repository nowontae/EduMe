package com.edume.admin_teacher.model;

import java.util.Date;

public class TestVideoDTO {
	//강사 피드백용 동영상 관리 DB
	private int tvidx; //게시글고유번호
	private int midx; //강사고유번호
	private String tvsubject;//제목
	private Date tvvideopath; //등록일자
	private String tvcomment;//관리자 답변
	
	public TestVideoDTO() {
		// TODO Auto-generated constructor stub
	}

	public TestVideoDTO(int tvidx, int midx, String tvsubject, Date tvvideopath, String tvcomment) {
		super();
		this.tvidx = tvidx;
		this.midx = midx;
		this.tvsubject = tvsubject;
		this.tvvideopath = tvvideopath;
		this.tvcomment = tvcomment;
	}

	public int getTvidx() {
		return tvidx;
	}

	public void setTvidx(int tvidx) {
		this.tvidx = tvidx;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public String getTvsubject() {
		return tvsubject;
	}

	public void setTvsubject(String tvsubject) {
		this.tvsubject = tvsubject;
	}

	public Date getTvvideopath() {
		return tvvideopath;
	}

	public void setTvvideopath(Date tvvideopath) {
		this.tvvideopath = tvvideopath;
	}

	public String getTvcomment() {
		return tvcomment;
	}

	public void setTvcomment(String tvcomment) {
		this.tvcomment = tvcomment;
	}
	
}
