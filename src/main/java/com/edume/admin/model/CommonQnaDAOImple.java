package com.edume.admin.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class CommonQnaDAOImple implements CommonQnaDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	//관리자페이지-문의사항 글 리스트 보기
	@Override
	public List CommonQnAList(int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		List arr=sqlMap.selectList("CommonQnAList",map);
		return arr;
	}
	//문의사항 답변 완료 글 리스트보기
	@Override
	public List CommonQnAListComplete() {
		List arr=sqlMap.selectList("CommonQnAListComplete");
		return arr;
	}
	//문의사항 답변 미완료 글 리스트보기
	@Override
	public List CommonQnAListNotComplete() {
		List arr=sqlMap.selectList("CommonQnAListNotComplete");
		return arr;
	}
	
	//문의사항글 본문글보기
	@Override
	public CommonQnaDTO CommonQnaContent(int cqidx) {
		CommonQnaDTO dto=sqlMap.selectOne("CommonQnaContent",cqidx);
		return dto;
	}
	
	//문의사항 본문글 보기 페이지의 처리완료 버튼 클릭시 페이지
	@Override
	public int AnswerComplete(int cqidx) {
		int cqidx_c=sqlMap.update("AnswerComplete",cqidx);
		return cqidx_c;
	}
	//총 게시물 수
	@Override
	public int commonQna_TotalCnt() {
		int count=sqlMap.selectOne("commonQna_TotalCnt");
		return count==0?1:count;
	}
}
