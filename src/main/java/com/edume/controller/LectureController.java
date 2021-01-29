package com.edume.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;

@Controller
public class LectureController {


	//@Autowired
	
	@RequestMapping("/createLectureForm.do")
	public String createLectureForm() {
		return "lecture/createLecture/lectureTitle";
	}
	
	@RequestMapping("/lectureCategory.do")
	public String lectureCategorySave() {
		return "lecture/createLecture/lectureCategory";
	}
	
	@RequestMapping("/lectureStudentInfo.do")
	public String lectureStudentInfoSave() {
		return "lecture/createLecture/lectureStudentInfo";
	}
	
	@RequestMapping("/lectureLadingPage.do")
	public String lectureLadingPage() {
		return "lecture/createLecture/lectureLadingPage";
	}

	@RequestMapping("/lectureCurriculum.do")
	public String lectureCurriculum() {
		return "lecture/createLecture/lectureCurriculum";
	}

	@RequestMapping("/lecturePrice.do")
	public String lecturePrice() {
		return "lecture/createLecture/lecturePrice";

	@RequestMapping("testVideo.do")
	public String testVideoForm() {
		return "lecture/lectureTestvideo/lectureTestvideo";
	}
	
	@RequestMapping("chartTest.do")
	public String charTest() {
		return "lecture/lectureResult/lectureResult";

	}
}
