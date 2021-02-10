package com.edume.student.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class CartDAOImple implements CartDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	
	//내 장바구니 보기
	@Override
	public List myCartList(int midx) {
		List arr=sqlMap.selectList("myCartList",midx);
		return arr;
	}
	//장바구니 항목 삭제
	@Override
	public int myCart_delete(int midx, int lidx) {
		Map map=new HashMap();
		map.put("midx", midx);
		map.put("lidx", lidx);
		int count=sqlMap.delete("myCart_delete",map);
		return count;
	}
	//장바구니 담기
	@Override
	public int addMyCartList(int midx, int lidx) {
		Map map= new HashMap();
		map.put("midx", midx);
		map.put("lidx", lidx);
		int count=sqlMap.insert("addMyCartList",map);
		return count;
	}
}
