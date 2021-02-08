package com.edume.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LectureController {

	  @RequestMapping("/lectureList.do")
		public String createLectureMain() {
			return "lecture/lectureList";
		}
	
	
}
