package com.edume.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edume.admin_teacher_lectureCheck.model.LectureCheckDAO;
import com.edume.admin_teacher_lectureCheck.model.LectureCheckDTO;

@Controller
public class LectureCheckController {

	@Autowired
	private LectureCheckDAO lectureCheckDao;
	
	//동영상 공개여부가 N인 모든 강의
	@RequestMapping("/LecutreCheck.do")
	public ModelAndView lectureCheckList(LectureCheckDTO dto) {
		List list=lectureCheckDao.lectureCheckList(dto);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("admin_Teacher/lectureCheck");
		return mav;
	}
}
