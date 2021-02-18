package com.edume.createLectureCurriculum.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edume.createLecture.model.CreateLectureDTO;

@Service
public class CreateLectureCurriculumDAOImple implements CreateLectureCurriculumDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;


	@Override
	public CreateLectureDTO createLectureAll(int lidx) {
		CreateLectureDTO dto=sqlMap.selectOne("createLectureAll", lidx);
		return dto;
	}

	@Override
	public int createLectureInsert(CreateLectureDTO dto) {
		int count=sqlMap.insert("createLectureInsert1", dto);
		return count;
	}

	@Override
	public int lidxSearch(CreateLectureDTO dto) {
		int count=sqlMap.selectOne("lidxSearch", dto);
		return count;
	}

	@Override
	public int lectureCurriculumSubmit(CreateLectureCurriculumDTO dto) {
		int count=sqlMap.insert("lectureCurriculumSubmit", dto);
		return count;
	}
	
	@Override
	public int createLectureDelete(int lidx) {
		int result=sqlMap.delete("createLectureDelete", lidx);
		return result;
	}
}
