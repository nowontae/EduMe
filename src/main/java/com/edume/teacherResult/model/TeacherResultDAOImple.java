package com.edume.teacherResult.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class TeacherResultDAOImple implements TeacherResultDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	public TeacherResultDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	@Override
	public Integer getTeacherAllResult(Map map) {
		Integer count=sqlMap.selectOne("teacherAllResult", map);
		return count;
	}
	
	@Override
	public Integer getTeacherResult6M_1(Map map) {
		Integer count=sqlMap.selectOne("teacherResult6M_1", map);
		return count;
	}
	@Override
	public Integer getTeacherResult6M_2(Map map) {
		Integer count=sqlMap.selectOne("teacherResult6M_2", map);
		return count;
	}
	
	@Override
	public Integer getTeacherResult6M_3(Map map) {
		Integer count=sqlMap.selectOne("teacherResult6M_3", map);
		return count;
	}
	@Override
	public Integer getTeacherResult6M_4(Map map) {
		Integer count=sqlMap.selectOne("teacherResult6M_4", map);
		return count;
	}
	@Override
	public Integer getTeacherResult6M_5(Map map) {
		Integer count=sqlMap.selectOne("teacherResult6M_5", map);
		return count;
	}
	@Override
	public Integer getTeacherResult6M_6(Map map) {
		Integer count=sqlMap.selectOne("teacherResult6M_6", map);
		return count;
	}
	
	
	@Override
	public Integer getTeacherResult12M_2(Map map) {
		Integer count=sqlMap.selectOne("teacherResult12M_2", map);
		return count;
	}
	@Override
	public Integer getTeacherResult12M_4(Map map) {
		Integer count=sqlMap.selectOne("teacherResult12M_4", map);
		return count;
	}
	@Override
	public Integer getTeacherResult12M_6(Map map) {
		Integer count=sqlMap.selectOne("teacherResult12M_6", map);
		return count;
	}
	@Override
	public Integer getTeacherResult12M_8(Map map) {
		Integer count=sqlMap.selectOne("teacherResult12M_8", map);
		return count;
	}
	@Override
	public Integer getTeacherResult12M_10(Map map) {
		Integer count=sqlMap.selectOne("teacherResult12M_10", map);
		return count;
	}
	@Override
	public Integer getTeacherResult12M_12(Map map) {
		Integer count=sqlMap.selectOne("teacherResult12M_12", map);
		return count;
	}
	
	@Override
	public Integer getTeacherResult28D_7(Map map) {
		Integer count=sqlMap.selectOne("teacherResult28D_7", map);
		return count;
	}
	@Override
	public Integer getTeacherResult28D_14(Map map) {
		Integer count=sqlMap.selectOne("teacherResult28D_14", map);
		return count;
	}
	@Override
	public Integer getTeacherResult28D_21(Map map) {
		Integer count=sqlMap.selectOne("teacherResult28D_21", map);
		return count;
	}
	@Override
	public Integer getTeacherResult28D_28(Map map) {
		Integer count=sqlMap.selectOne("teacherResult28D_28", map);
		return count;
	}
	
	@Override
	public Integer getTeacherGradeAll(Map map) {
		Integer count=sqlMap.selectOne("teacherGradeAvg", map);
		return count;
	}
	@Override
	public Integer getTeacherGradeCount1M(Map map) {
		Integer count=sqlMap.selectOne("teacherGradeCount1M", map);
		return count;
	}
}
