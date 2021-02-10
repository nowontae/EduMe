package com.edume.teacherBoard.model;

import java.util.List;
import java.util.Map;

public interface TeacherBoardDAO {
	
	public List BoardAskList(Map map);
	public List BoardAskListY(Map map);
	public List BoardAskListN(Map map);
	
	public int getAskListCnt(int midx);
	public int getAskListYCnt(int midx);
	public int getAskListNCnt(int midx);
	public TeacherBoardDTO boardAskContent(Map map);
	public List boardReplyList(Map map);
	public int replyWrite(TeacherBoardDTO dto);
	public int replyUpdate(TeacherBoardDTO dto);
}
