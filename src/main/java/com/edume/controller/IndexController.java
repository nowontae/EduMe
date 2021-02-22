package com.edume.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.FormSubmitEvent.MethodType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edume.admin.model.Category1DAO;
import com.edume.admin.model.Category2DAO;
import com.edume.admin.model.Category3DAO;
import com.edume.admin.model.MemberDAO;
import com.edume.admin.model.MemberDTO;
import com.edume.createLecture.model.CreateLectureDAO;
import com.edume.createLecture.model.CreateLectureDTO;


@Controller
public class IndexController {

	@Autowired
	private Category1DAO category1Dao;
	@Autowired
	private Category2DAO category2Dao;
	@Autowired
	private Category3DAO category3Dao;
	@Autowired
	private CreateLectureDAO createLectureDao;
	@Autowired
	private MemberDAO memberDao;
	
	@RequestMapping("/index.do")
      public ModelAndView index(HttpServletRequest req, HttpServletResponse resp) {
        
    	// midx session 심기
    	HttpSession session = req.getSession(true); 

    	//session.setAttribute("mgrade", "3");
    	//session.setAttribute("midx", "2");



    	List cat1_list = category1Dao.Category1List();
    	List cat2_list = category2Dao.Category2AllList();
    	List cat3_list = category3Dao.Category3AllList();
    	
    	session.setAttribute("cat1_list", cat1_list);
    	session.setAttribute("cat2_list", cat2_list);
    	session.setAttribute("cat3_list", cat3_list);
    	
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("cat1_list", cat1_list);
   		mav.addObject("cat2_list", cat2_list);
		mav.addObject("cat3_list", cat3_list);
    	mav.setViewName("index");
    	return mav;
         
      }  
	
	// 로그인 Form
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String loginForm() {
		return "common/login";		
	}
	
	// 로그인  값
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public ModelAndView loginSubmt(@RequestParam("mid")String mid,
			@RequestParam("mpwd")String mpwd ,
			HttpServletRequest req) {
		
		
		MemberDTO dtoResult = memberDao.memberLogin(mid, mpwd);
		
		HttpSession session = req.getSession(); 
		session.setAttribute("midx", dtoResult.getMidx());
		session.setAttribute("mgrade", dtoResult.getMgrade());
		
		System.out.println("login : "+dtoResult.getMidx() +"/"+ dtoResult.getMgrade());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
				
		return mav;		
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession(true); 
		session.invalidate();
		return "index";
	}
    
	/*등록된 강의 리스트 불러오기*/
    @RequestMapping("/teacherMain.do")
	public ModelAndView createLectureMain(HttpServletRequest req) {
    	
    	HttpSession session = req.getSession();
		//int midx = Integer.parseInt((String)session.getAttribute("midx"));
		int midx = (Integer)session.getAttribute("midx");
    	Map map=new HashMap();
    	map.put("midx", midx);
    	
    	List list=createLectureDao.lectureYList(map);
    	List list1=createLectureDao.lectureNList(map);
    	List list2=createLectureDao.lectureFakeList(map);
    	
    	System.out.println(list.size());
    	System.out.println(list1.size());
    	System.out.println(list2.size());
    	ModelAndView mav=new ModelAndView();
    	mav.addObject("list", list);
    	mav.addObject("list1", list1);
    	mav.addObject("list2", list2);
    	mav.setViewName("teacher/teacherMain");
		
    	return mav;
	}
    
   
}