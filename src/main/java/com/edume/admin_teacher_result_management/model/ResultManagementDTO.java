package com.edume.admin_teacher_result_management.model;

import java.util.*;
import java.util.Date;
import java.sql.*;

public class ResultManagementDTO {
	
	private int midx;
	private String mname;
	private String id;
	private String mpwd;
	private String memail;
	private String mtel;
	private String mgrade;
	private String ming;
	private Integer mcredit;
	private Integer mblack;
	private String mfav1_idx;
	private String mfav2_idx;
	private String mfav3_idx;
	private Date mjoindate;
	
	private int cidx;
	private int ccode;
	private Integer camount;
	private String ccoment;
	private Date cpaydate;
	
	
	
	public ResultManagementDTO() {
		super();
	}



	public ResultManagementDTO(int midx, String mname, String id, String mpwd, String memail, String mtel,
			String mgrade, String ming, Integer mcredit, Integer mblack, String mfav1_idx, String mfav2_idx,
			String mfav3_idx, Date mjoindate, int cidx, int ccode, Integer camount, String ccoment, Date cpaydate) {
		super();
		this.midx = midx;
		this.mname = mname;
		this.id = id;
		this.mpwd = mpwd;
		this.memail = memail;
		this.mtel = mtel;
		this.mgrade = mgrade;
		this.ming = ming;
		this.mcredit = mcredit;
		this.mblack = mblack;
		this.mfav1_idx = mfav1_idx;
		this.mfav2_idx = mfav2_idx;
		this.mfav3_idx = mfav3_idx;
		this.mjoindate = mjoindate;
		this.cidx = cidx;
		this.ccode = ccode;
		this.camount = camount;
		this.ccoment = ccoment;
		this.cpaydate = cpaydate;
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



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
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



	public String getMgrade() {
		return mgrade;
	}



	public void setMgrade(String mgrade) {
		this.mgrade = mgrade;
	}



	public String getMing() {
		return ming;
	}



	public void setMing(String ming) {
		this.ming = ming;
	}



	public Integer getMcredit() {
		return mcredit;
	}



	public void setMcredit(Integer mcredit) {
		this.mcredit = mcredit;
	}



	public Integer getMblack() {
		return mblack;
	}



	public void setMblack(Integer mblack) {
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



	public int getCidx() {
		return cidx;
	}



	public void setCidx(int cidx) {
		this.cidx = cidx;
	}



	public int getCcode() {
		return ccode;
	}



	public void setCcode(int ccode) {
		this.ccode = ccode;
	}



	public Integer getCamount() {
		return camount;
	}



	public void setCamount(Integer camount) {
		this.camount = camount;
	}



	public String getCcoment() {
		return ccoment;
	}



	public void setCcoment(String ccoment) {
		this.ccoment = ccoment;
	}



	public Date getCpaydate() {
		return cpaydate;
	}



	public void setCpaydate(Date cpaydate) {
		this.cpaydate = cpaydate;
	}
	
	
	
	
	
	
	
	
}
