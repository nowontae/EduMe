package com.edume.admin_teacher.model;

import java.util.List;


public interface TestVideoDAO {
	// 관리자 페이지-테스트 동영상 전체 조회용 
	public List TestVideoAllList(int cp, int ls);
	//테스트 동영상 관리 본문 보기
	public TestVideoDTO TestVideoContent_Management(int tvidx);
	//테스트 동영상 관리 본문 보기-코멘트 달기 부분
	public int TestVideoContent_tvcommentAdd(int tvidx, String tvcomment);
	//총 게시물수
	public int TestVideo_TotalCnt();
}
