package com.edume.teacherBoardReview.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.edume.teacherBoardReview.model.TeacherBoardReviewDTO;

public class TeacherBoardReviewDAOImple implements TeacherBoardReviewDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;

	@Override
	/*후기 메인*/
	public List teacherReviewMain(Map map) {
		List list=sqlMap.selectList("teacherReviewMain", map);
		return list;
	}
	
}
