package com.edume.createLecture.model;

import java.util.*;

public interface CreateLectureDAO {

	public int createLectureInsert(); //저장 처음 눌렀을 때
	public int createLectureUpdate(CreateLectureDTO dto); //저장 1회이상 눌렀을 때
	public CreateLectureDTO createLectureContent(Map map); /*저장 후 안에 내용 저장해서 그대로 돌아가기*/
}
