package com.edume.admin.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class Category1DAOImple implements Category1DAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	//카테고리 대분류 보기
	@Override
	public List Category1List() {
		List arr=sqlMap.selectList("Category1List");
		return arr;
	}
	
	//카테고리 대분류 추가
	@Override
	public int Category1Add(Category1DTO dto) {
		int count=sqlMap.insert("Category1Add",dto);
		return count;
	}
	//카테고리 대분류 삭제
	@Override
	public int Category1Delete(int cat1_idx) {
		int count=sqlMap.delete("Category1Delete",cat1_idx);
		return count;
	}

}
