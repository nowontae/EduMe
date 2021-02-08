package com.edume.teacherBoard.model;

import java.util.List;
import java.util.Map;

public interface TeacherBoardDAO {
	
	public List BoardAskList(Map map);
	public List BoardAskListY(Map map);
	public List BoardAskListN(Map map);
	
	public int getAskListCnt();
	public int getAskListYCnt();
	public int getAskListNCnt();
	public TeacherBoardDTO boardAskContent(Map map);
	public List boardReplyList(Map map);
	public int replyWrite(TeacherBoardDTO dto);
	public int replyUpdate(TeacherBoardDTO dto);
}
