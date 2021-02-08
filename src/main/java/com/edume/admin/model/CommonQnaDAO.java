package com.edume.admin.model;

import java.util.*;

public interface CommonQnaDAO {
	//문의사항 전체 글 리스트 보기
	public List CommonQnAList(int cp, int ls);
	
	//문의사항 답변 완료 글 리스트보기
	public List CommonQnAListComplete();
	//문의사항 답변 미완료 글 리스트보기
	public List CommonQnAListNotComplete();
	
	//문의사항글 본문글보기
	public CommonQnaDTO CommonQnaContent(int cqidx);
	
	//문의사항 본문글 보기 페이지의 처리완료 버튼 클릭시 페이지
	public int AnswerComplete(int cqidx);
	
	//총 게시물수
	public int commonQna_TotalCnt();
	
}
