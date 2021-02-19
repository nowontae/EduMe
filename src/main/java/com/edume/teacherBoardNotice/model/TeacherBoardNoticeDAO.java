package com.edume.teacherBoardNotice.model;

import java.util.*;

public interface TeacherBoardNoticeDAO {
	public List teacherNoticeMain(int cp, int ls);
	public int getTotalCnt(); 
	public int teacherNoticeWrite(TeacherBoardNoticeDTO dto);
	public int teacherNoticeMsgWrite(TeacherBoardNoticeDTO dto);
	public TeacherBoardNoticeDTO teacherNoticeContent(int nidx, int lidx);
}
