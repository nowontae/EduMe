package com.edume.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edume.createLectureCurriculum.model.CreateLectureCurriculumDAO;

@Controller
public class CreateLectureCurriculumController {

	@Autowired
	private CreateLectureCurriculumDAO createLectureCurriculumDao;
	
	@RequestMapping("/lectureCurriculum.do")
	public ModelAndView createLectureCurriculumForm(@RequestParam(value="lidx")int lidx) {
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("lidx", lidx);
		mav.setViewName("teacher/createLecture/lectureCurriculum");
		return mav;
	}
	
}
