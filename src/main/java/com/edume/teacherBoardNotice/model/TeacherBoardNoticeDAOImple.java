package com.edume.teacherBoardNotice.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.edume.teacherBoardNotice.model.TeacherBoardNoticeDTO;

public class TeacherBoardNoticeDAOImple implements TeacherBoardNoticeDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	@Override
	/*공지 메인 겸 페이징*/
	public List teacherNoticeMain(int cp, int ls) {
	
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List list=sqlMap.selectList("teacherNoticeMain", map);
		return list;
	}
	
	/*글쓰기*/
	@Override
	public int teacherNoticeWrite(TeacherBoardNoticeDTO dto) {
		int count=sqlMap.insert("teacherNoticeWrite", dto);
		return count;
	}

	/*글쓰기 본문보기*/
	@Override
	public TeacherBoardNoticeDTO teacherNoticeContent(int nidx) {
		TeacherBoardNoticeDTO dto=sqlMap.selectOne("teacherNoticeContent", nidx);
		return dto;
	}
	
	public int getTotalCnt() {
		int count=sqlMap.selectOne("noticeTotalCnt");
		return count==0? 1:count;
	}

}
