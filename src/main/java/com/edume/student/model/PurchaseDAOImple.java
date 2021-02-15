package com.edume.student.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class PurchaseDAOImple implements PurchaseDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	//결제정보 보기
	@Override
	public List PurchaseUserList() {
		List arr=sqlMap.selectList("PurchaseUserList");
		return arr;
	}
	
	@Override
	public List purchaseHistory(int midx) {
		List list = sqlMap.selectList("purchaseHistory",midx);
		return list;
	}
}
