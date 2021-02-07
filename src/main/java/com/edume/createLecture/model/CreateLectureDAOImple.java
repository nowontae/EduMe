package com.edume.createLecture.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class CreateLectureDAOImple implements CreateLectureDAO {

private SqlSessionTemplate sqlMap;
	
	public CreateLectureDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	/*강의주제*/
	public int lectureTitleUpdate(CreateLectureDTO dto) {
		int count=sqlMap.update("lectureTitle",dto);
		return count;
	}

}
