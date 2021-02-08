package com.edume.admin.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class DeclarationDAOImple implements DeclarationDAO {

	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	//리뷰 신고 글 전체 리스트 보기
	@Override
	public List DeclarationAllList() {
		List arr=sqlMap.selectList("DeclarationAllList");
		return arr;
	}

}
