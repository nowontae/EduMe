package com.edume.category.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class CategoryDAOImple implements CategoryDAO {
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	@Override
	public int insertCat1(String cat_name) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertCat2(int cat1_idx, String cat_name) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertCat3(int cat1_idx, int cat2_idx, String cat_name) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public List getCat1() {
		List cat1_list = sqlMap.selectList("getCat1List");
		return cat1_list;
	}
	@Override
	public List getCat2() {
		List cat2_list = sqlMap.selectList("getCat2List");
		return cat2_list;
	}
	@Override
	public List getCat3() {
		List cat3_list = sqlMap.selectList("getCat3List");
		return cat3_list;
	}
}
