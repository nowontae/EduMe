package com.edume.admin.model;

import java.util.*;

public interface ReviewDAO {
	//전체 리뷰 신고글 리스트
	public List reviewAllList();
	
	//강의 상세 페이지의 댓글 부분 출력
	public List reviewList_lectureDetail(int lidx);
}
