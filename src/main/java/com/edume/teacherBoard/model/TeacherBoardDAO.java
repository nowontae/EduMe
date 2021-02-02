package com.edume.teacherBoard.model;

import java.util.List;
import java.util.Map;

public interface TeacherBoardDAO {
	
	public List BoardAskList(Map map);
	public int getAskListCnt();
	public TeacherBoardDTO boardAskContent(int midx);
}
