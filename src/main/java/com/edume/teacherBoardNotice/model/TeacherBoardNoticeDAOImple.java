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
	public TeacherBoardNoticeDTO teacherNoticeContent(int nidx, int lidx) {
		
		Map map = new HashMap();
		map.put("nidx", nidx);
		map.put("lidx", lidx);
		
		TeacherBoardNoticeDTO dto=sqlMap.selectOne("teacherNoticeContent", map );
		return dto;
	}
	
	public int getTotalCnt() {
		int count=sqlMap.selectOne("noticeTotalCnt");
		return count==0? 1:count;
	}

	/*글쓰기 공지안내 쪽지 보내기*/
	@Override
	public int teacherNoticeMsgWrite(TeacherBoardNoticeDTO dto) {
		List<TeacherBoardNoticeDTO> list = sqlMap.selectList("teacherNoticeMsgWho", dto.getLidx());
		
		
		Map map = new HashMap();
		map.put("dto", dto);
		map.put("msg", "공지 메세지");
		
		int count=1;
		int result = 0;
		for (TeacherBoardNoticeDTO midxList : list) {
			map.put("midxList", midxList);
			result += sqlMap.insert("teacherNoticeMsgWrite", map);
		}
		
		return result;
	}
}
