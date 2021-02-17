package com.edume.lecture.model;

import java.util.List;

public interface LectureDAO {
	
	//public LectureDTO lectureDetail(int lidx);
	public String lectureDetail(int lidx);
	public List getLectureList();
	public List getLectureList(int cat1_idx);
	public List getLectureList(int cat1_idx,int cat2_idx);
	public List getLectureList(int cat1_idx,int cat2_idx,int cat3_idx);
	public List getMyLectureList(int midx);
	public LectureDTO getLectureDetail(int lidx);
	public List getLectureCurriculum(int lidx);
	public LectureCurriculumDTO getMyClass(int lidx,int section, int part);
	public int checkMyLecture(int lidx, int midx);
	
}
