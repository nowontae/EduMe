package com.edume.admin_teacher.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class TestVideoDAOImple implements TestVideoDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	// 테스트 동영상 전체 조회용 
	@Override
	public List TestVideoAllList() {
		List arr=sqlMap.selectList("TestVideoAllList");
		return arr;
	}

}
