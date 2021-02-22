package com.edume.createLectureCurriculum.model;

import java.util.*;

import com.edume.createLecture.model.CreateLectureDTO;

public interface CreateLectureCurriculumDAO {

	public CreateLectureDTO createLectureAll(int lidx);
	public int createLectureInsert(CreateLectureDTO dto);
	public int lidxSearch(CreateLectureDTO dto);
	public int lectureCurriculumSubmit(CreateLectureCurriculumDTO dto);
	public int createLectureDelete(int lidx);
	public int createLectureDiscount(int lidx);
}
