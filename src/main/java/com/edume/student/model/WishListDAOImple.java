package com.edume.student.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class WishListDAOImple implements WishListDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	@Override
	public List getWishList(int midx) {
		List list = sqlMap.selectList("getWishList",midx);
		System.out.println("list응답 갯수 : "+list.size());
		return list;
	}

	@Override
	public int addWishList(int midx, int lidx) {
		Map map = new HashMap();
		map.put("midx", midx);
		map.put("lidx", lidx);
		int result = sqlMap.insert("addWishList", map);
		return 0;
	}

}
