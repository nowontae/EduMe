package com.edume.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class StudentController {

	
	//신고하기 폼
	@RequestMapping(value="/declaration.do", method=RequestMethod.GET)
	public ModelAndView declarationFrom() {
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/student/declaration/declaration");
		
		
		return mav;
	}
	
	//신고하기 등록
	@RequestMapping(value="/declaration.do", method=RequestMethod.POST)
	public String declarationSubmit() {
		return "/student/declaration/declaration";
	}
	
	
	
	//일반문의사항 폼
	@RequestMapping(value="/commonQna.do", method=RequestMethod.GET)
	public String commonQnaFrom() {
		return "/common/commonQna";
	}
		
	//일반문의사항 등록
	@RequestMapping(value="/commonQna.do", method=RequestMethod.POST)
	public String commonQnaSubmit() {
		return "/common/commonQna";
	}
	
	
	//강의 상세
	@RequestMapping("/lectureDetail.do")
	public String lectureDetail() {
		return "/lecture/lectureDetail";
	}
			
		
}
