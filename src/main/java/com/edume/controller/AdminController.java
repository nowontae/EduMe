package com.edume.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edume.admin.model.MemberDAO;


@Controller
public class AdminController {

	
	
	   @Autowired
		private MemberDAO memberDao;
	

		//관리자 페이지 이동
	   @RequestMapping("/admin.do")
	      public String index() {
	         return "admin/adminForm";
	      }
	   //관리자페이지-전체 유저리스트 출력
	   @RequestMapping("/admin_memberAllList.do")
	   	public ModelAndView memberIdxAllList() {
		   List list=memberDao.memberIdxAllList();
		   ModelAndView mav=new ModelAndView();
		   mav.addObject("list",list);
		   mav.setViewName("admin/userAllList");
		   return mav;
	    }
	   //관리자페이지-전체 블랙리스트 출력
	   @RequestMapping("/admin_blackList.do")
	   public ModelAndView blackList() {
		   ModelAndView mav=new ModelAndView();
		   mav.setViewName("admin/blackList");
		   return mav;
	   }
	  //관리자페이지-리뷰신고 출력
	   @RequestMapping("admin_reviewDeclaration.do")
	   public ModelAndView reviewDeclaration() {
		   ModelAndView mav=new ModelAndView();
		   mav.setViewName("admin/reviewDeclaration");
		   return mav;
	   }
}
