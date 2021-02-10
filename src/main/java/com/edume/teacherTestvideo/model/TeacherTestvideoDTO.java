package com.edume.teacherTestvideo.model;

import java.sql.*;

public class TeacherTestvideoDTO {
	
	private int tvidx;
	private int midx;
	private String tvsubject;
	private String tvvideopath;
	private Date tvwritedate;
	private String tvcomment;
	public TeacherTestvideoDTO() {
		super();
	}
	public TeacherTestvideoDTO(int tvidx, int midx, String tvsubject, String tvvideopath, Date tvwritedate,
			String tvcomment) {
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
