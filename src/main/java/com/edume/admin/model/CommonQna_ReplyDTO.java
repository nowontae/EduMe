package com.edume.admin.model;

import java.util.*;

public class CommonQna_ReplyDTO {
	private int cqreply_idx;  //댓글 고유 번호
    private int cqidx; 		  //문의 게시물 고유번호
	private int midx; 		  //댓글작성자 고유번호
	private String cqreplycontent; //본문 
	private Date cqreplywritedate; //작성일자
	private String mname;	  //member 에서 가져온 이름
	
	public CommonQna_ReplyDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public CommonQna_ReplyDTO(int cqreply_idx, int cqidx, int midx, String cqreplycontent, Date cqreplywritedate) {
		super();
		this.cqreply_idx = cqreply_idx;
		this.cqidx = cqidx;
		this.midx = midx;
		this.cqreplycontent = cqreplycontent;
		this.cqreplywritedate = cqreplywritedate;
	}



	public CommonQna_ReplyDTO(int cqreply_idx, int cqidx, int midx, String cqreplycontent, Date cqreplywritedate,
			String mname) {
		super();
		this.cqreply_idx = cqreply_idx;
		this.cqidx = cqidx;
		this.midx = midx;
		this.cqreplycontent = cqreplycontent;
		this.cqreplywritedate = cqreplywritedate;
		this.mname = mname;
	}

	public int getCqreply_idx() {
		return cqreply_idx;
	}

	public void setCqreply_idx(int cqreply_idx) {
		this.cqreply_idx = cqreply_idx;
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

	public String getCqreplycontent() {
		return cqreplycontent;
	}

	public void setCqreplycontent(String cqreplycontent) {
		this.cqreplycontent = cqreplycontent;
	}

	public Date getCqreplywritedate() {
		return cqreplywritedate;
	}

	public void setCqreplywritedate(Date cqreplywritedate) {
		this.cqreplywritedate = cqreplywritedate;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	
	
	
}
