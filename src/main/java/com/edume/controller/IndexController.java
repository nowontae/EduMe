package com.edume.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

    @RequestMapping("/index.do")
      public ModelAndView index(HttpServletRequest req, HttpServletResponse resp) {
        
    	// midx session 심기
    	HttpSession session = req.getSession(true); 

    	session.setAttribute("mgrade", "2");
    	session.setAttribute("midx", "2");


    	
    	ModelAndView mav = new ModelAndView();
    	
    	mav.setViewName("index");
    	return mav;
         
      }  
    
    @RequestMapping("/teacherMain.do")
	public String createLectureMain() {
		return "teacher/teacherMain";
	}
    
   
}