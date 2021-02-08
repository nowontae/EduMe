package com.edume.lecture.model;

import java.sql.Date;

public class LectureDTO {

	private int lidx;
	private int ladmindiscount;
	private int lteacherdiscount;
	private String ltitle;
	private String lsubtitle;
	private int llevel;
	private String lthumnail;
	private String lsummary; 
	private String lpurpose;
	private int lorignprice;
	private String ltarget; 
	private String lknowledge;
	private int cat_idx;
	private Date lwritedate;
	private String lopen;
	
	
	
	
	
	public LectureDTO() {
		super();
	}
	
	
	
	public LectureDTO(int lidx, int ladmindiscount, int lteacherdiscount) {
		super();
		this.lidx = lidx;
		this.ladmindiscount = ladmindiscount;
		this.lteacherdiscount = lteacherdiscount;
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



	public int getLlevel() {
		return llevel;
	}



	public void setLlevel(int llevel) {
		this.llevel = llevel;
	}



	public String getLthumnail() {
		return lthumnail;
	}



	public void setLthumnail(String lthumnail) {
		this.lthumnail = lthumnail;
	}



	public String getLsummary() {
		return lsummary;
	}



	public void setLsummary(String lsummary) {
		this.lsummary = lsummary;
	}



	public String getLpurpose() {
		return lpurpose;
	}



	public void setLpurpose(String lpurpose) {
		this.lpurpose = lpurpose;
	}



	public int getLorignprice() {
		return lorignprice;
	}



	public void setLorignprice(int lorignprice) {
		this.lorignprice = lorignprice;
	}



	public String getLtarget() {
		return ltarget;
	}



	public void setLtarget(String ltarget) {
		this.ltarget = ltarget;
	}



	public String getLknowledge() {
		return lknowledge;
	}



	public void setLknowledge(String lknowledge) {
		this.lknowledge = lknowledge;
	}



	public int getCat_idx() {
		return cat_idx;
	}



	public void setCat_idx(int cat_idx) {
		this.cat_idx = cat_idx;
	}



	public Date getLwritedate() {
		return lwritedate;
	}



	public void setLwritedate(Date lwritedate) {
		this.lwritedate = lwritedate;
	}



	public String getLopen() {
		return lopen;
	}



	public void setLopen(String lopen) {
		this.lopen = lopen;
	}



	public LectureDTO(int lidx, int ladmindiscount, int lteacherdiscount, String ltitle, String lsubtitle, int llevel,
			String lthumnail, String lsummary, String lpurpose, int lorignprice, String ltarget, String lknowledge,
			int cat_idx, Date lwritedate, String lopen) {
		super();
		this.lidx = lidx;
		this.ladmindiscount = ladmindiscount;
		this.lteacherdiscount = lteacherdiscount;
		this.ltitle = ltitle;
		this.lsubtitle = lsubtitle;
		this.llevel = llevel;
		this.lthumnail = lthumnail;
		this.lsummary = lsummary;
		this.lpurpose = lpurpose;
		this.lorignprice = lorignprice;
		this.ltarget = ltarget;
		this.lknowledge = lknowledge;
		this.cat_idx = cat_idx;
		this.lwritedate = lwritedate;
		this.lopen = lopen;
	}



	public int getLidx() {
		return lidx;
	}
	public void setLidx(int lidx) {
		this.lidx = lidx;
	}
	public int getLadmindiscount() {
		return ladmindiscount;
	}
	public void setLadmindiscount(int ladmindiscount) {
		this.ladmindiscount = ladmindiscount;
	}
	public int getLteacherdiscount() {
		return lteacherdiscount;
	}
	public void setLteacherdiscount(int lteacherdiscount) {
		this.lteacherdiscount = lteacherdiscount;
	}
	
	
	
}
