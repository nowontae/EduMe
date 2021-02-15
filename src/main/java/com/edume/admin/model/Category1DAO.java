package com.edume.admin.model;

import java.util.List;

public interface Category1DAO {
	//카테고리 대분류 보기
	public List Category1List();
	//카테고리 대분류 추가
	public int Category1Add(Category1DTO dto);
	//카테고리 대분류 삭제
	public int Category1Delete(int cat1_idx);

}
