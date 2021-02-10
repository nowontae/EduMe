package com.edume.student.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class NoticeMsgDAOImple implements NoticeMsgDAO {
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	@Override
	public List noticeMsgList(int midx) {
		List list = sqlMap.selectList("noticeMsg", midx);
		
		return list;
	}

}
