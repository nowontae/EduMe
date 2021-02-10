package com.edume.student.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class PurchaseDAOImple implements PurchaseDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	@Override
	public List purchaseHistory(int midx) {

		List list = sqlMap.selectList("purchaseHistory", midx);
		return list;
	}

}
