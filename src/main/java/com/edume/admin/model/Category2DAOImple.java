package com.edume.admin.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class Category2DAOImple implements Category2DAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	//카테고리 중분류 보기
	@Override
	public List Category2List(int cat1_idx) {
		List arr=sqlMap.selectList("Category2List",cat1_idx);
		return arr;
	}
	//카테고리 중분류 추가
	@Override
	public int Category2Add(Category2DTO dto) {
		int count=sqlMap.insert("Category2Add",dto);
		return count;
	}
	//카테고리 대분류 삭제
	@Override
	public int Category1_2Delete(int cat1_idx) {
		int count=sqlMap.delete("Category1_2Delete",cat1_idx);
		return count;
	}
	//카테고리 중분류 삭제
	@Override
	public int Category2Delete(int cat2_idx) {
		int count=sqlMap.delete("Category2Delete",cat2_idx);
		return count;
	}
	

}
