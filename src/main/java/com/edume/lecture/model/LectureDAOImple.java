package com.edume.lecture.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class LectureDAOImple implements LectureDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
//	@Override
//	public LectureDTO lectureDetail(int lidx) {
//
//		
//		
//		return null;
//	}
	
	
	@Override
	public String lectureDetail(int lidx) {
		
		
		System.out.println("33");
		LectureDTO lectureDto = sqlMap.selectOne("com.edume.lecture.discount", lidx);
		System.out.println(lectureDto.getLidx());
		return lectureDto.toString();
	}
	
	@Override
	public List getLectureList() {
		List list = sqlMap.selectList("getLectureList");
		return list;
	}
	
	@Override
	public LectureDTO getLectureDetail(int lidx) {
		LectureDTO ldto = sqlMap.selectOne("getLectureDetail", lidx);
				
		return ldto;
	}
	
	
	
	@Override
	public List getLectureCurriculum(int lidx) {
		List list = sqlMap.selectList("getLectureCurriculum", lidx);
		return list;
	}
}
