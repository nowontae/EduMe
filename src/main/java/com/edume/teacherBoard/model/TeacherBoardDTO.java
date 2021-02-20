package com.edume.teacherBoard.model;

import java.sql.Date;

public class TeacherBoardDTO {
	
	private int lqidx;
	private int midx;
	private String mname;
	private int lidx;
	private String ltitle;
	private String lqsubject;
	private String lqcontent;
	private Date lqwritedate;
	private String lqreply;
	private String lqReplyContent;
	private Date lqReplyCritedate;
	
	public TeacherBoardDTO() {
		super();
	}
	public TeacherBoardDTO(int lqidx, int midx, int lidx, String lqsubject, String lqcontent, Date lqwritedate,
			String lqreply) {
		super();
		this.lqidx = lqidx;
		this.midx = midx;
		this.lidx = lidx;
		this.lqsubject = lqsubject;
		this.lqcontent = lqcontent;
		this.lqwritedate = lqwritedate;
		this.lqreply = lqreply;
	}
	public TeacherBoardDTO(int lqidx, int midx, int lidx, String lqsubject, Date lqwritedate, String lqreply) {
		super();
		this.lqidx = lqidx;
		this.midx = midx;
		this.lidx = lidx;
		this.lqsubject = lqsubject;
		this.lqwritedate = lqwritedate;
		this.lqreply = lqreply;
	}
	
	public TeacherBoardDTO(int lqidx, int midx, String lqReplyContent, Date lqReplyCritedate) {
		super();
		this.lqidx = lqidx;
		this.midx = midx;
		this.lqReplyContent = lqReplyContent;
		this.lqReplyCritedate = lqReplyCritedate;
	}
	
	
	public TeacherBoardDTO(int lqidx, int midx, String mname, int lidx, String ltitle, String lqsubject, String lqcontent,
			Date lqwritedate, String lqreply, String lqReplyContent, Date lqReplyCritedate) {
		super();
		this.lqidx = lqidx;
		this.midx = midx;
		this.mname = mname;
		this.lidx = lidx;
		this.ltitle = ltitle;
		this.lqsubject = lqsubject;
		this.lqcontent = lqcontent;
		this.lqwritedate = lqwritedate;
		this.lqreply = lqreply;
		this.lqReplyContent = lqReplyContent;
		this.lqReplyCritedate = lqReplyCritedate;
	}
	public int getLqidx() {
		return lqidx;
	}
	public void setLqidx(int lqidx) {
		this.lqidx = lqidx;
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
	public String getLqsubject() {
		return lqsubject;
	}
	public void setLqsubject(String lqsubject) {
		this.lqsubject = lqsubject;
	}
	public String getLqcontent() {
		return lqcontent;
	}
	public void setLqcontent(String lqcontent) {
		this.lqcontent = lqcontent;
	}
	public Date getLqwritedate() {
		return lqwritedate;
	}
	public void setLqwritedate(Date lqwritedate) {
		this.lqwritedate = lqwritedate;
	}
	public String getLqreply() {
		return lqreply;
	}
	public void setLqreply(String lqreply) {
		this.lqreply = lqreply;
	}
	public String getLqReplyContent() {
		return lqReplyContent;
	}
	public void setLqReplyContent(String lqReplyContent) {
		this.lqReplyContent = lqReplyContent;
	}
	public Date getLqReplyCritedate() {
		return lqReplyCritedate;
	}
	public void setLqReplyCritedate(Date lqReplyCritedate) {
		this.lqReplyCritedate = lqReplyCritedate;
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
	
	
}
