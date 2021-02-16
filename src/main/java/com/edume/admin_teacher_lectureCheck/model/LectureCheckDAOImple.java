package com.edume.admin_teacher_lectureCheck.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

public class LectureCheckDAOImple implements LectureCheckDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;

	@Override
	public List lectureCheckList(LectureCheckDTO dto) {
		List list=sqlMap.selectList("lectureCheckList", dto);
		return list;
	}

	

}
