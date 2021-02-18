package com.edume.admin_teacher_lectureCheck.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

public class LectureCheckDAOImple implements LectureCheckDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;

	@Override
	public List lectureCheckList(int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List list=sqlMap.selectList("lectureCheckList", map);
		return list;
	}

	@Override
	public List lectureCheckY(int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List list=sqlMap.selectList("lectureCheckY", map);
		return list;
	}

	public int getTotalYCnt() {
		int count=sqlMap.selectOne("checkYTotalCnt");
		return count==0? 1:count;
	}
	
	public int getTotalNCnt() {
		int count=sqlMap.selectOne("checkNTotalCnt");
		return count==0? 1:count;
	}

	@Override
	public LectureCheckDTO lectureContent(Map map) {
		LectureCheckDTO dto=sqlMap.selectOne("lectureContent", map);
		return dto;
	}

	@Override
	public int lectureOpen(LectureCheckDTO dto) {
		int count=sqlMap.update("lectureOpen", dto);
		return count;
	}
	
}
