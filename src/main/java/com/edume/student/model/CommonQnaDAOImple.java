package com.edume.student.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class CommonQnaDAOImple implements CommonQnaDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	@Override
	public int commonQnaInsert(CommonQnaDTO cqdto) {
		
		int result = sqlMap.insert("commonQnaInsert",cqdto);
		return result;
	}
}
