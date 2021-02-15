package com.edume.admin.model;

import java.util.List;
import java.util.Map;

public interface Category3DAO {
	//카테고리 대분류 보기
	public List Category3List(int cat1_idx,int cat2_idx);
	//카테고리 대분류 추가
	public int Category3Add(Category3DTO dto);
	//카테고리 대분류 삭제
	public int Category3Delete(int cat3_idx);
}
