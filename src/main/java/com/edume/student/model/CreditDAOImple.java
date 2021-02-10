package com.edume.student.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class CreditDAOImple implements CreditDAO {

	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	@Override
	public List creditHistory(int midx) {
		System.out.println("sys1");
		List list = sqlMap.selectList("creditHistory", midx);
		System.out.println("sys2");
		return list;
	}

}
