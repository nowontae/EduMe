package com.edume.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @RequestMapping("/index.do")
      public String index(HttpServletRequest req) {
    	HttpSession session = req.getSession();
    	session.setAttribute("midx", 2);
         return "index";
      }  
    
    @RequestMapping("/teacherMain.do")
	public String createLectureMain() {
		return "teacher/teacherMain";
	}
    
   
}