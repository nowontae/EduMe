package com.edume.teacherBoard.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeacherBoardDAOImple implements TeacherBoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	public TeacherBoardDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	@Override
	public List BoardAskList(Map map) {
		List arr=sqlMap.selectList("teacherBoardAskList", map);
		return arr;
	}
	
	@Override
	public List BoardAskListY(Map map) {
		List arr=sqlMap.selectList("boardAskReplyYList", map);
		return arr;
	}
	@Override
	public List BoardAskListN(Map map) {
		List arr=sqlMap.selectList("boardAskReplyNList", map);
		return arr;
	}
	
	
	
	
	
	@Override
	public int getAskListCnt(int midx) {
		int count=sqlMap.selectOne("askTotalCnt",midx);
		count=count==0?1:count;
		return count;
	}
	@Override
	public int getAskListYCnt(int midx) {
		int count=sqlMap.selectOne("askTotalYCnt", midx);
		return count;
	}
	@Override
	public int getAskListNCnt(int midx) {
		int count=sqlMap.selectOne("askTotalNCnt", midx);
		return count;
	}
	
	
	
	
	
	
	@Override
	public TeacherBoardDTO boardAskContent(Map map) {
		TeacherBoardDTO dto=sqlMap.selectOne("askContent", map);
		return dto;
	}
	
	@Override
	public List boardReplyList(Map map) {
		List arr=sqlMap.selectList("answerReplyList", map);
		return arr;
	}
	
	@Override
	public int replyWrite(TeacherBoardDTO dto) {
		int count=sqlMap.insert("replyInsert", dto);
		return count;
	}
	
	@Override
	public int replyUpdate(TeacherBoardDTO dto) {
		int count=sqlMap.update("replyUpdate", dto);
		return count;
	}
}
