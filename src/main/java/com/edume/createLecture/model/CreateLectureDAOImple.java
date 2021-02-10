package com.edume.createLecture.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.edume.teacherBoardNotice.model.TeacherBoardNoticeDTO;

public class CreateLectureDAOImple implements CreateLectureDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	@Override
	/*저장*/
	public int createLectureInsert() {
		
		Integer lidx = sqlMap.selectOne("checkLidx");
		if(lidx == null ) {
			lidx = 1;
		}
		sqlMap.selectOne("createLectureInsert", lidx);
		System.out.println("lidx = "+ lidx);
		 
		return lidx;
	}

	@Override
	public int createLectureUpdate(CreateLectureDTO dto) {
		int count=sqlMap.update("createLectureUpdate", dto);
		return count;
	}

	@Override
	public CreateLectureDTO createLectureContent(Map map) {
		CreateLectureDTO dto=sqlMap.selectOne("createLectureContent", map);
		return dto;
	}
	
	
	
}
