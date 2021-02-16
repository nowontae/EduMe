package com.edume.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edume.admin_teacher.model.TestVideoDAO;
import com.edume.admin_teacher.model.TestVideoDTO;

@Controller
public class Admin_TeacherController {

	
	@Autowired
	private TestVideoDAO testVideoDao;
	
	// 테스트 동영상 관리 전체 조회용
	@RequestMapping("/TestVideoManagement.do")
	public ModelAndView TestVideoAllList(
	@RequestParam(value="cp",defaultValue = "1")int cp) {
		int totalCnt=testVideoDao.TestVideo_TotalCnt();
		int listSize=5;
		int pageSize=5;
		String pageStr=com.edume.page.PageModule
				.makePage("TestVideoManagement.do", totalCnt, cp, listSize, pageSize);
	  
		
		List list=testVideoDao.TestVideoAllList(cp,listSize);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		 mav.addObject("pageStr",pageStr);
		mav.setViewName("admin_Teacher/testVideoAllList");
		return mav;
	}
	//테스트 동영상 관리 본문 보기
	@RequestMapping("/TestVideoContent_Management.do")
	public ModelAndView TestVideoContent_Management(int tvidx) {
		TestVideoDTO dto=testVideoDao.TestVideoContent_Management(tvidx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto",dto);
		mav.setViewName("admin_Teacher/TestVideoContent");
		return mav;
	}
	//테스트 동영상 관리 본문보기의 관리자 코멘트 달기 부분
	@RequestMapping("/TestVideoContent_tvcommentAdd.do")
	public ModelAndView TestVideoContent_tvcommentAdd(int tvidx, String tvcomment) {
		int result=testVideoDao.TestVideoContent_tvcommentAdd(tvidx, tvcomment);
		String msg=result>0?"코멘트가 등록되었습니다.":"코멘트가 등록되지 않았습니다.";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("tvidx",tvidx);
		mav.setViewName("admin_Teacher/TestVideoContentMsg");
		return mav;
	}
}
