package com.edume.admin.model;

public class Category3DTO {

	private int cat1_idx; //카테고리 대 idx
	private int cat2_idx;//카테고리 중 idx
	private int cat3_idx;//카테고리 소 idx
	private String cat_name;//카테고리 이름
	
	public Category3DTO() {
		// TODO Auto-generated constructor stub
	}

	public Category3DTO(int cat1_idx, int cat2_idx, int cat3_idx, String cat_name) {
		super();
		this.cat1_idx = cat1_idx;
		this.cat2_idx = cat2_idx;
		this.cat3_idx = cat3_idx;
		this.cat_name = cat_name;
	}

	public int getCat1_idx() {
		return cat1_idx;
	}

	public void setCat1_idx(int cat1_idx) {
		this.cat1_idx = cat1_idx;
	}

	public int getCat2_idx() {
		return cat2_idx;
	}

	public void setCat2_idx(int cat2_idx) {
		this.cat2_idx = cat2_idx;
	}

	public int getCat3_idx() {
		return cat3_idx;
	}

	public void setCat3_idx(int cat3_idx) {
		this.cat3_idx = cat3_idx;
	}

	public String getCat_name() {
		return cat_name;
	}

	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}
	
	
}
