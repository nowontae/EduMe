package com.edume.student.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class StudentDAOImple implements StudentDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	
	
	@Override
	public String declarationSubmit() {
	
		int result = sqlMap.insert("declarationSubmit");
		System.out.println(result);
		return null;
	}
	
	
	@Override
	public int commonQnaSubmit() {
		
		int result = sqlMap.insert("commonQnaSubmit");
		
		return 0;
	}
}
