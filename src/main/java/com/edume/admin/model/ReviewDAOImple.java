package com.edume.admin.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class ReviewDAOImple implements ReviewDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	@Override
	public List reviewAllList() {
		List arr=sqlMap.selectList("reviewAllList");
		return arr;
	}
	//강의 상세 페이지의 댓글 부분 출력
	@Override
	public List reviewList_lectureDetail(int lidx) {
		List arr= sqlMap.selectList("reviewList_lectureDetail",lidx);
		return arr;
	}

}
