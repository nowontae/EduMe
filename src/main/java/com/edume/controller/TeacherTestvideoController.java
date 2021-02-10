package com.edume.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Controller
@EnableWebMvc
public class TeacherTestvideoController {
	
	
	@RequestMapping("/teacherTestVideo.do")
	public ModelAndView teacherTestVideoMain(@RequestParam(value = "midx",defaultValue = "0")int midx) {
	
	
		
		
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("teacher/teacherTestvideo/teacherTestvideoMain");
		
		return mav;
		
	}
	
	
	
	
	
	@RequestMapping("/makeTestvideo.do")
	public ModelAndView makeTestvideo(@RequestParam(value = "midx",defaultValue = "0")int midx) {
		
		
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("teacher/teacherTestvideo/teacherTestvideo");
		return mav;
	}
	
	
	
	
	
	
}
