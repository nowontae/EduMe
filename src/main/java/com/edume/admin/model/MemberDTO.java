package com.edume.admin.model;

import java.util.*;

public class MemberDTO {
	private int midx;      //회원 고유번호
	private String mname;  //이름
	private String mid;    //ID
	private String mpwd;   //비밀번호
	private String memail; //이메일
	private String mtel;   //전화번호
	private int mgrade;    //유저 등급  -> 1 관리자 , 2 강사,  3 학생(default)
	private String mimg;   //프로필사진 경로
	private int mcredit;   //잔고
	private int mblack;   //블랙리스트 ** 신고횟수-> 3개 쌓이면 댓글, 리뷰기능을 이용 못함.
	private String mfav1_idx;  //관심사1
	private String mfav2_idx;  //관심사2
	private String mfav3_idx;  //관심사3 
	private Date mjoindate;//회원 가입일
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(int midx, String mname, String mid, String mpwd, String memail, String mtel, int mgrade,
			String mimg, int mcredit, int mblack, String mfav1_idx, String mfav2_idx, String mfav3_idx,
			Date mjoindate) {
		super();
		this.midx = midx;
		this.mname = mname;
		this.mid = mid;
		this.mpwd = mpwd;
		this.memail = memail;
		this.mtel = mtel;
		this.mgrade = mgrade;
		this.mimg = mimg;
		this.mcredit = mcredit;
		this.mblack = mblack;
		this.mfav1_idx = mfav1_idx;
		this.mfav2_idx = mfav2_idx;
		this.mfav3_idx = mfav3_idx;
		this.mjoindate = mjoindate;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpwd() {
		return mpwd;
	}

	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getMtel() {
		return mtel;
	}

	public void setMtel(String mtel) {
		this.mtel = mtel;
	}

	public int getMgrade() {
		return mgrade;
	}

	public void setMgrade(int mgrade) {
		this.mgrade = mgrade;
	}

	public String getMimg() {
		return mimg;
	}

	public void setMimg(String mimg) {
		this.mimg = mimg;
	}

	public int getMcredit() {
		return mcredit;
	}

	public void setMcredit(int mcredit) {
		this.mcredit = mcredit;
	}

	public int getMblack() {
		return mblack;
	}

	public void setMblack(int mblack) {
		this.mblack = mblack;
	}

	public String getMfav1_idx() {
		return mfav1_idx;
	}

	public void setMfav1_idx(String mfav1_idx) {
		this.mfav1_idx = mfav1_idx;
	}

	public String getMfav2_idx() {
		return mfav2_idx;
	}

	public void setMfav2_idx(String mfav2_idx) {
		this.mfav2_idx = mfav2_idx;
	}

	public String getMfav3_idx() {
		return mfav3_idx;
	}

	public void setMfav3_idx(String mfav3_idx) {
		this.mfav3_idx = mfav3_idx;
	}

	public Date getMjoindate() {
		return mjoindate;
	}

	public void setMjoindate(Date mjoindate) {
		this.mjoindate = mjoindate;
	}

	
	
}
