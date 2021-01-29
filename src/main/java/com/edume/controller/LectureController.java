package com.edume.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LectureController {

	@RequestMapping("testVideo.do")
	public String testVideoForm() {
		return "lecture/lectureTestvideo/lectureTestvideo";
	}
	
	@RequestMapping("chartTest.do")
	public String charTest() {
		return "lecture/lectureResult/lectureResult";
	}
}
