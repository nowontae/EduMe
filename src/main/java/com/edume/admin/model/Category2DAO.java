package com.edume.admin.model;

import java.util.List;

public interface Category2DAO {
		//카테고리 중분류 전체 보기
		public List Category2AllList();

		//카테고리 즁분류 보기
		public List Category2List(int cat1_idx);
		
		//카테고리 중분류 추가
		public int Category2Add(Category2DTO dto);
		
		//카테고리 대분류 삭제
	
		public int Category1_2Delete(int cat1_idx);

		
		//카테고리 중분류 삭제
		public int Category2Delete(int cat2_idx);
}
