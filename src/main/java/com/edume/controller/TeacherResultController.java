package com.edume.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TeacherResultController {

	@RequestMapping("/getStudentXML.do")
	public ModelAndView chartStudent(@RequestParam(value="sort")String sort) {
		
		ModelAndView mav=new ModelAndView();
		
		return mav;
		
	}
}
