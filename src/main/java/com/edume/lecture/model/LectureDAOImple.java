package com.edume.lecture.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		
		LectureDTO lectureDto = sqlMap.selectOne("com.edume.lecture.discount", lidx);
		System.out.println(lectureDto.getLidx());
		return lectureDto.toString();
	}
	
	@Override
	public List getLectureList() {
		List list = sqlMap.selectList("getAllLectureList");
		return list;
	}
	
	@Override
	public List getLectureList(int cat1_idx) {
		Map map = new HashMap();
		map.put("cat1_idx", cat1_idx);
		List list = sqlMap.selectList("getCat1LectureList",map);
		return list;
	}
	@Override
	public List getLectureList(int cat1_idx, int cat2_idx) {
		Map map = new HashMap();
		map.put("cat1_idx", cat1_idx);
		map.put("cat2_idx", cat2_idx);
		List list = sqlMap.selectList("getCat2LectureList",map);
		return list;
	}
	@Override
	public List getLectureList(int cat1_idx, int cat2_idx, int cat3_idx) {
		Map map = new HashMap();
		map.put("cat1_idx", cat1_idx);
		map.put("cat2_idx", cat2_idx);
		map.put("cat3_idx", cat3_idx);
		List list = sqlMap.selectList("getCat3LectureList",map);
		return list;
	}
	
	@Override
	public List getMyLectureList(int midx) {
		List list = sqlMap.selectList("getMyLectureList", midx);
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
	
	
	@Override
	public LectureCurriculumDTO getMyClass(int lidx,int section, int part) {
		
		Map map = new HashMap();
		map.put("lidx", lidx);
		map.put("section", section);
		map.put("part", part);
		LectureCurriculumDTO ldto = sqlMap.selectOne("getMyClass", map);
				
		return ldto;
	}
	
	@Override
	public int checkMyLecture(int lidx, int midx) {
		Map map = new HashMap();
		map.put("lidx", lidx);
		map.put("midx", midx);
		int result = sqlMap.selectOne("checkMyLecture", map);
		return result;
	}
	
}
