package com.edume.student.model;

import java.sql.Date;

public class CommonQnaDTO {

	private int cqidx;
	private int midx;
	private String cqsubject;
	private String cqcontent;
	private Date cqwritedate;
	private char cqreply;
	
	
	public CommonQnaDTO() {
		super();
	}
	public CommonQnaDTO(int cqidx, int midx, String cqsubject, String cqcontent, Date cqwritedate, char cqreply) {
		super();
		this.cqidx = cqidx;
		this.midx = midx;
		this.cqsubject = cqsubject;
		this.cqcontent = cqcontent;
		this.cqwritedate = cqwritedate;
		this.cqreply = cqreply;
	}
	public int getCqidx() {
		return cqidx;
	}
	public void setCqidx(int cqidx) {
		this.cqidx = cqidx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getCqsubject() {
		return cqsubject;
	}
	public void setCqsubject(String cqsubject) {
		this.cqsubject = cqsubject;
	}
	public String getCqcontent() {
		return cqcontent;
	}
	public void setCqcontent(String cqcontent) {
		this.cqcontent = cqcontent;
	}
	public Date getCqwritedate() {
		return cqwritedate;
	}
	public void setCqwritedate(Date cqwritedate) {
		this.cqwritedate = cqwritedate;
	}
	public char getCqreply() {
		return cqreply;
	}
	public void setCqreply(char cqreply) {
		this.cqreply = cqreply;
	}
	
	
}
