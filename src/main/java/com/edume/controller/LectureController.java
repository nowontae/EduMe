package com.edume.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edume.lecture.model.LectureDAO;

@Controller
public class LectureController {
	
		@Autowired
		private LectureDAO lectureDao;
		
	  // 강의 리스트
	  @RequestMapping("/lectureList.do")
		public ModelAndView lectureList(@RequestParam(value="cat1_idx",defaultValue = "0")int cat1_idx,
				@RequestParam(value="cat2_idx",defaultValue = "0")int cat2_idx,
				@RequestParam(value="cat3_idx",defaultValue = "0")int cat3_idx) {
		  
		    List list = null;
		    Map map = new HashMap();
		    
		    if(cat1_idx==0 && cat2_idx==0 && cat3_idx==0) {
		    	list = lectureDao.getLectureList();
		    } else if (cat2_idx==0 && cat3_idx==0) {
		    	list = lectureDao.getLectureList(cat1_idx);
		    	map.put("cat1_idx",cat1_idx);
		    } else if (cat3_idx==0) {
		    	list = lectureDao.getLectureList(cat1_idx,cat2_idx);
		    	map.put("cat1_idx",cat1_idx);
		    	map.put("cat2_idx",cat2_idx);
		    } else {
		    	list = lectureDao.getLectureList(cat1_idx,cat2_idx,cat3_idx);
		    	map.put("cat1_idx",cat1_idx);
		    	map.put("cat2_idx",cat2_idx);
		    	map.put("cat3_idx",cat3_idx);
		    }
		    
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/lecture/lectureList");
			mav.addObject("lectureList", list);
			mav.addObject("lectureCat", map);
			return mav;
		}
	
	

}
