package com.edume.admin.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class ReviewDAOImple implements ReviewDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	@Override
	public List reviewAllList() {
		List arr=sqlMap.selectList("reviewAllList");
		return arr;
	}

}
