package com.edume.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edume.admin_teacher.model.TestVideoDAO;
import com.edume.admin_teacher_lectureCheck.model.LectureCheckDAO;

@Controller
public class Admin_TeacherController {

	@Autowired
	private TestVideoDAO testVideoDao;
	
	// 테스트 동영상 전체 조회용
	@RequestMapping("/TestVideoManagement.do")
	public ModelAndView TestVideoAllList() {
		List list=testVideoDao.TestVideoAllList();
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("admin_Teacher/testVideoAllList");
		return mav;
	}
	
	
}
