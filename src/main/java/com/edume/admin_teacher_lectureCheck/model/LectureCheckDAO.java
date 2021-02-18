package com.edume.admin_teacher_lectureCheck.model;

import java.util.List;
import java.util.Map;

public interface LectureCheckDAO {

	public List lectureCheckList(int cp, int ls);
	public List lectureCheckY(int cp, int ls);
	public int getTotalYCnt(); 
	public int getTotalNCnt(); 
	public LectureCheckDTO lectureContent(Map map);
	public int lectureOpen(LectureCheckDTO dto);
}
