package com.edume.createLecture.model;

import java.util.*;

public interface CreateLectureDAO {

	public int createLectureInsert(); //저장 처음 눌렀을 때
	public int createLectureUpdate(CreateLectureDTO dto); //저장 1회이상 눌렀을 때
	public CreateLectureDTO createLectureContent(Map map); /*저장 후 안에 내용 저장해서 그대로 돌아가기*/
	public List lectureYList(Map map); /*공개여부Y인 등록된 강의*/
	public List lectureNList(Map map); /*공개여부N인 등록된 강의*/
	public List lectureFakeList(Map map); /*등록 대기중인 강의*/
	public int createLectureUpdateImg(String fileName,int lidx);
}
