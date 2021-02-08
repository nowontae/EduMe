package com.edume.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TeacherController {

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
	
	@RequestMapping("/testVideo.do")
	public String testVideoForm() {
		return "teacher/teacherTestvideo/teacherTestvideo";
	}
	
}