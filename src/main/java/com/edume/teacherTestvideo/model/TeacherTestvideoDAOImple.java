package com.edume.teacherTestvideo.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class TeacherTestvideoDAOImple implements TeacherTestvideoDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	public TeacherTestvideoDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	
	@Override
	public List testvideoAll(Map map) {
		List arr=sqlMap.selectList("teacherTestvideoListAll", map);
		return arr;
	}
	@Override
	public List testvideoN(Map map) {
		List arr=sqlMap.selectList("teacherTestvideoListN", map);
		return arr;
	}
	@Override
	public int testvideoInsert(TeacherTestvideoDTO dto) {
		int count=sqlMap.insert("teacherTestvideoinsert", dto);
		return count;
	}
	
	
}
