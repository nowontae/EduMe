package com.edume.category.model;

import java.util.List;

public interface CategoryDAO {
	public int insertCat1(String cat_name);
	public int insertCat2(int cat1_idx, String cat_name);
	public int insertCat3(int cat1_idx, int cat2_idx, String cat_name);
	
	
	public List getCat1();
	public List getCat2();
	public List getCat3();
}
