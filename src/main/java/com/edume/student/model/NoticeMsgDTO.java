package com.edume.student.model;

public class NoticeMsgDTO {

	
	private int notmsg_idx;
	private int nidx;
	private int midx_from;
	private int midx_to;
	private String notmsg_content;
	private String nread;
	private int lidx;
	public NoticeMsgDTO() {
		super();
	}
	public NoticeMsgDTO(int notmsg_idx, int nidx, int midx_from, int midx_to, String notmsg_content, String nread,
			int lidx) {
		super();
		this.notmsg_idx = notmsg_idx;
		this.nidx = nidx;
		this.midx_from = midx_from;
		this.midx_to = midx_to;
		this.notmsg_content = notmsg_content;
		this.nread = nread;
		this.lidx = lidx;
	}
	public int getNotmsg_idx() {
		return notmsg_idx;
	}
	public int getNidx() {
		return nidx;
	}
	public int getMidx_from() {
		return midx_from;
	}
	public int getMidx_to() {
		return midx_to;
	}
	public String getNotmsg_content() {
		return notmsg_content;
	}
	public String getNread() {
		return nread;
	}
	public int getLidx() {
		return lidx;
	}
	
	
}
