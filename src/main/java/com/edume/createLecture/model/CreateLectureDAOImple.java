package com.edume.createLecture.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.edume.teacherBoardNotice.model.TeacherBoardNoticeDTO;

public class CreateLectureDAOImple implements CreateLectureDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;

	@Override
	/*저장버튼 누르면 update*/
	public int createLectureSave(CreateLectureDTO dto) {
		int count=sqlMap.insert("createLectureSave", dto);
		return count;
	}


	
}
