package com.edume.admin_teacher.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class TestVideoDAOImple implements TestVideoDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	// 테스트 동영상 전체 조회용 
	@Override
	public List TestVideoAllList(int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		List arr=sqlMap.selectList("TestVideoAllList",map);
		return arr;
	}
	//테스트 동영상 관리 본문 보기
	@Override
	public TestVideoDTO TestVideoContent_Management(int tvidx) {
		TestVideoDTO dto=sqlMap.selectOne("TestVideoContent_Management",tvidx);
		return dto;
	}
	//테스트 동영상 관리 본문 보기-코멘트 달기 부분
	@Override
	public int TestVideoContent_tvcommentAdd(int tvidx, String tvcomment) {
		Map map=new HashMap();
		map.put("tvidx", tvidx);
		map.put("tvcomment", tvcomment);
		int count=sqlMap.update("TestVideoContent_tvcommentAdd",map);
		return count;
	}
	//총게시물 수
	@Override
	public int TestVideo_TotalCnt() {
		int count=sqlMap.selectOne("TestVideo_TotalCnt");
		return count==0?1:count;
	}
}
