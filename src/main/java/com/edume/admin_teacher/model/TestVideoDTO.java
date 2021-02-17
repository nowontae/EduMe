package com.edume.admin_teacher.model;

import java.util.Date;

public class TestVideoDTO {
	//강사 피드백용 동영상 관리 DB
	private int tvidx; //게시글고유번호
	private int midx; //강사고유번호
	private String tvsubject;//제목
	private String tvvideopath; //동영상주소
	private Date tvwritedate; //등록일자
	private String tvcomment;//관리자 답변
	
	public TestVideoDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	//코멘트 달기 부분
	public TestVideoDTO(int tvidx, String tvcomment) {
		super();
		this.tvidx = tvidx;
		this.tvcomment = tvcomment;
	}



	public TestVideoDTO(int tvidx, int midx, String tvsubject, String tvvideopath, Date tvwritedate, String tvcomment) {
		super();
		this.tvidx = tvidx;
		this.midx = midx;
		this.tvsubject = tvsubject;
		this.tvvideopath = tvvideopath;
		this.tvwritedate = tvwritedate;
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

	public String getTvvideopath() {
		return tvvideopath;
	}

	public void setTvvideopath(String tvvideopath) {
		this.tvvideopath = tvvideopath;
	}

	public Date getTvwritedate() {
		return tvwritedate;
	}

	public void setTvwritedate(Date tvwritedate) {
		this.tvwritedate = tvwritedate;
	}

	public String getTvcomment() {
		return tvcomment;
	}

	public void setTvcomment(String tvcomment) {
		this.tvcomment = tvcomment;
	}

	
}
