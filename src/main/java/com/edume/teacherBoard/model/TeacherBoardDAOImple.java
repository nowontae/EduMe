package com.edume.teacherBoard.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeacherBoardDAOImple implements TeacherBoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	public TeacherBoardDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	@Override
	public List BoardAskList(Map map) {
		List arr=sqlMap.selectList("teacherBoardAskList", map);
		return arr;
	}
	
	@Override
	public int getAskListCnt() {
		int count=sqlMap.selectOne("askTotalCnt");
		count=count==0?1:count;
		return count;
	}
	@Override
	public TeacherBoardDTO boardAskContent(int midx) {
		TeacherBoardDTO dto=sqlMap.selectOne("askContent", midx);
		return dto;
	}
	
}
