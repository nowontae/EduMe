package com.edume.admin.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class Category3DAOImple implements Category3DAO {
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	//카테고리 소분류 보기
	@Override
	public List Category3List(int cat1_idx,int cat2_idx) {
		Map map=new HashMap();
		map.put("cat1_idx", cat1_idx);
		map.put("cat2_idx", cat2_idx);
		List arr=sqlMap.selectList("Category3List",map);
				
		return arr;
	}
	//카테고리 소분류 추가
	@Override
	public int Category3Add(Category3DTO dto) {
		int count=sqlMap.insert("Category3Add",dto);
		return count;
	}
	//카테고리 대분류 삭제	
	@Override
	public int Category1_3Delete(int cat1_idx) {
		int count=sqlMap.delete("Category1_3Delete",cat1_idx);
		return count;
	}
	//카테고리 중분류 삭제	
	@Override
	public int Category2_3Delete(int cat2_idx) {
		int count=sqlMap.delete("Category2_3Delete",cat2_idx);
		return count;
	}
	
	//카테고리 소분류 삭제
	@Override
	public int Category3Delete(int cat3_idx) {
		int count=sqlMap.delete("Category3Delete",cat3_idx);
		return count;
	}

}
