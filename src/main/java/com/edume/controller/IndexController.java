package com.edume.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edume.admin.model.Category1DAO;
import com.edume.admin.model.Category2DAO;
import com.edume.admin.model.Category3DAO;


@Controller
public class IndexController {

	@Autowired
	private Category1DAO category1Dao;
	@Autowired
	private Category2DAO category2Dao;
	@Autowired
	private Category3DAO category3Dao;

	
	@RequestMapping("/index.do")
      public ModelAndView index(HttpServletRequest req, HttpServletResponse resp) {
        
    	// midx session 심기
    	HttpSession session = req.getSession(true); 

    	session.setAttribute("mgrade", "2");
    	session.setAttribute("midx", "2");


    	List cat1_list = category1Dao.Category1List();
    	List cat2_list = category2Dao.Category2AllList();
    	List cat3_list = category3Dao.Category3AllList();
    	
    	session.setAttribute("cat1_list", cat1_list);
    	session.setAttribute("cat2_list", cat2_list);
    	session.setAttribute("cat3_list", cat3_list);
    	
    	ModelAndView mav = new ModelAndView();
//    	mav.addObject("cat1_list", cat1_list);
//    	mav.addObject("cat2_list", cat2_list);
//    	mav.addObject("cat3_list", cat3_list);
    	mav.setViewName("index");
    	return mav;
         
      }  
    
    @RequestMapping("/teacherMain.do")
	public String createLectureMain() {
		return "teacher/teacherMain";
	}
    
   
}