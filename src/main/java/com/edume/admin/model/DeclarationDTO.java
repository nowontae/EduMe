package com.edume.admin.model;

import java.sql.Date;
import java.util.List;


public class DeclarationDTO {

	private int didx;       //신고고유번호
	private int midx_from;  //신고자
	private int midx_to;    //신고리뷰작성자
	private int ridx;       //리뷰고유번호
	private String dreason; //신고사유
	private Date ddate;	    //신고날짜
	private String dstatus;   //신고상태
	private String ltitle;	//lecture 테이블의 강의제목
	private String m_from_name; // member 테이블의 신고자이름
	private String m_to_name;   // member 테이블의 신고리뷰작성자
	private String rcomment;  	//review 테이블의 리뷰 내용
	private int mblack; 		//member 테이블의 블랙리스트컬럼으로 신고 된 횟수
	
	public DeclarationDTO() {
		// TODO Auto-generated constructor stub
	}
	//리스트 보기용
	public DeclarationDTO(int didx, int midx_from, int midx_to, int ridx, String dreason, Date ddate, String dstatus,
			String ltitle, String m_from_name, String m_to_name) {
		super();
		this.didx = didx;
		this.midx_from = midx_from;
		this.midx_to = midx_to;
		this.ridx = ridx;
		this.dreason = dreason;
		this.ddate = ddate;
		this.dstatus = dstatus;
		this.ltitle = ltitle;
		this.m_from_name = m_from_name;
		this.m_to_name = m_to_name;
	}
	// 본문 보기용
	

	public DeclarationDTO(int didx, int midx_from, int midx_to, int ridx, String dreason, Date ddate, String dstatus,
			String ltitle, String m_from_name, String m_to_name, String rcomment, int mblack) {
		super();
		this.didx = didx;
		this.midx_from = midx_from;
		this.midx_to = midx_to;
		this.ridx = ridx;
		this.dreason = dreason;
		this.ddate = ddate;
		this.dstatus = dstatus;
		this.ltitle = ltitle;
		this.m_from_name = m_from_name;
		this.m_to_name = m_to_name;
		this.rcomment = rcomment;
		this.mblack = mblack;
	}
	
	public int getDidx() {
		return didx;
	}

	public void setDidx(int didx) {
		this.didx = didx;
	}

	public int getMidx_from() {
		return midx_from;
	}

	public void setMidx_from(int midx_from) {
		this.midx_from = midx_from;
	}

	public int getMidx_to() {
		return midx_to;
	}

	public void setMidx_to(int midx_to) {
		this.midx_to = midx_to;
	}

	public int getRidx() {
		return ridx;
	}

	public void setRidx(int ridx) {
		this.ridx = ridx;
	}

	public String getDreason() {
		return dreason;
	}

	public void setDreason(String dreason) {
		this.dreason = dreason;
	}

	public Date getDdate() {
		return ddate;
	}

	public void setDdate(Date ddate) {
		this.ddate = ddate;
	}

	public String getDstatus() {
		return dstatus;
	}

	public void setDstatus(String dstatus) {
		this.dstatus = dstatus;
	}

	public String getLtitle() {
		return ltitle;
	}

	public void setLtitle(String ltitle) {
		this.ltitle = ltitle;
	}

	public String getM_from_name() {
		return m_from_name;
	}

	public void setM_from_name(String m_from_name) {
		this.m_from_name = m_from_name;
	}

	public String getM_to_name() {
		return m_to_name;
	}

	public void setM_to_name(String m_to_name) {
		this.m_to_name = m_to_name;
	}
	public String getRcomment() {
		return rcomment;
	}
	public void setRcomment(String rcomment) {
		this.rcomment = rcomment;
	}
	public int getMblack() {
		return mblack;
	}
	public void setMblack(int mblack) {
		this.mblack = mblack;
	}
	
	
}
