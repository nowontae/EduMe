package com.edume.category.model;

public interface CategoryDAO {
	public int insertCat1(String cat_name);
	public int insertCat2(int cat1_idx, String cat_name);
	public int insertCat3(int cat1_idx, int cat2_idx, String cat_name);
}
