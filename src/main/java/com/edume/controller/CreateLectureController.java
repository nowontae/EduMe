package com.edume.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edume.createLecture.model.CreateLectureDAO;

@Controller
public class CreateLectureController {
	
	//@Autowired
	//private CreateLectureDAO clDao;


	
	@RequestMapping("/createLectureForm.do")
	public String createLectureForm() {
		return "teacher/createLecture/lectureTitle";
	}
	

	@RequestMapping("/lectureCategory.do")
	public String lectureCategorySave() {
		return "teacher/createLecture/lectureCategory";
	}
	
	@RequestMapping("/lectureStudentInfo.do")
	public String lectureStudentInfoSave() {
		return "teacher/createLecture/lectureStudentInfo";
	}
	
	@RequestMapping("/lectureLadingPage.do")
	public String lectureLadingPage() {
		return "teacher/createLecture/lectureLadingPage";
	}

	@RequestMapping("/lectureCurriculum.do")
	public String lectureCurriculum() {
		return "teacher/createLecture/lectureCurriculum";
	}

	@RequestMapping("/lecturePrice.do")
	public String lecturePrice() {
		return "teacher/createLecture/lecturePrice";
	}
	
	@RequestMapping("testVideo.do")
	public String testVideoForm() {
		return "teacher/teacherTestvideo/teacherTestvideo";
	}
	
	@RequestMapping("chartTest.do")
	public String charTest() {
		return "teacher/teacherResult/teacherResult";

	}
	
}
