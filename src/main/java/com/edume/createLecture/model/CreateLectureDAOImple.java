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
		int result=sqlMap.insert("createLectureInsert", lidx);
		System.out.println("result = "+result);
		System.out.println("lidx = "+ lidx);
		 
		return lidx;
	}

	@Override
	public int createLectureUpdate(CreateLectureDTO dto) {
		int count=sqlMap.update("createLectureUpdate", dto);
		return count;
	}

	@Override
	public int createLectureUpdateImg(String fileName, int lidx) {
		System.out.println("filename = "+fileName);
		System.out.println("lidx = "+lidx);
		
		Map map = new HashMap();
		map.put("fileName", fileName);
		map.put("lidx", lidx);
		int result=sqlMap.update("createLectureUpdateImg", map);
		return result;
	}
	@Override
	public CreateLectureDTO createLectureContent(Map map) {
		CreateLectureDTO dto=sqlMap.selectOne("createLectureContent", map);
		return dto;
	}

	@Override
	public List lectureYList(Map map) {
		List list=sqlMap.selectList("lectureYList", map);
		return list;
	}

	@Override
	public List lectureNList(Map map) {
		List list=sqlMap.selectList("lectureNList", map);
		return list;
	}
	
	@Override
	public List lectureFakeList(Map map) {
		List list=sqlMap.selectList("lectureFakeList", map);
		return list;
	}
	
}
