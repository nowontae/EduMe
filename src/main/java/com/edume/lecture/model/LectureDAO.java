package com.edume.lecture.model;

import java.util.List;

public interface LectureDAO {
	
	//public LectureDTO lectureDetail(int lidx);
	public String lectureDetail(int lidx);
	public List getLectureList();
	public LectureDTO getLectureDetail(int lidx);
	public List getLectureCurriculum(int lidx);
	
}
