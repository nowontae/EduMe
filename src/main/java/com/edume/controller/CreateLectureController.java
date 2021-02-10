package com.edume.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edume.createLecture.model.*;

@Controller
public class CreateLectureController {
	
	@RequestMapping("/createLectureMain.do")
	public String createLectureMain() {
		return "teacher/createLecture/createLectureMain";
	}
	
	/*저장부분*/
	@RequestMapping("createLectureSave.do")
	public ModelAndView createLectureSave(CreateLectureDTO dto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("count", dto);
		mav.setViewName("teacher/createLecture/createLectureMain");
		return mav;
	}
	
}
	
	
	/*
	@RequestMapping("/lectureTitle.do")
	public String lectureTitle() {
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
	*/

