package com.edume.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edume.teacherBoardReview.model.TeacherBoardReviewDAO;

@Controller
public class TeacherBoardReviewController {

	@Autowired
	private TeacherBoardReviewDAO teacherBoardReviewDao;

	@RequestMapping("/teacherReviewMain.do")
	 public ModelAndView teacherReviewMain(@RequestParam(value="midx", defaultValue =  "0")int midx) {
		Map map=new HashMap();	 
		map.put("midx", midx);
		List list=teacherBoardReviewDao.teacherReviewMain(map);
			
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("teacher/teacherBoard/teacherReviewMain");
		return mav;
		} 
	
	@RequestMapping("/teacherReviewContent.do")
	 public ModelAndView teacherReviewContent(@RequestParam(value="lidx", defaultValue =  "0")int lidx,
			 @RequestParam(value="ltitle")String ltitle) {
		Map map=new HashMap();	 
		map.put("lidx", lidx);
		List list=teacherBoardReviewDao.teacherReviewContent(map);
			
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("ltitle", ltitle);
		mav.setViewName("teacher/teacherBoard/teacherReviewContent");
		return mav;
		} 
	
}
