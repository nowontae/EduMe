package com.edume.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.util.*;
import com.edume.teacherBoard.model.*;

@Controller
@EnableWebMvc
public class TeacherBoardController {
	
	@Autowired
	private TeacherBoardDAO teacherBoardDao;
	
	@RequestMapping("/teacherAsk.do")
	public ModelAndView teacherAskList(@RequestParam(value = "cp",defaultValue = "1")int cp) {
		
		Map map=new HashMap();
		int listSize=10;
		int pageSize=5;
		int Cnt=teacherBoardDao.getAskListCnt();
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		map.put("start", start);
		map.put("end", end);
		String str=com.edume.page.PageModule.makePage("teacherAsk.do", cp, Cnt, listSize, pageSize);
		List arr=teacherBoardDao.BoardAskList(map);
		ModelAndView mav=new ModelAndView();
		mav.addObject("str",str);
		mav.addObject("list",arr);
		mav.setViewName("teacher/teacherBoard/teacherAsk");
		return mav;
	}
	@RequestMapping("teacherAnswer.do")
	public ModelAndView teacherAnswer(@RequestParam(value="idx",defaultValue = "0")int midx) {
			TeacherBoardDTO dto=teacherBoardDao.boardAskContent(midx);
		
	      ModelAndView mav=new ModelAndView();
	      if(dto==null) {
	         mav.addObject("msg", "삭제된 게시글 또는 잘못된 접근입니다");
	         mav.setViewName("teacher/teacherBoard/teacherMsg");
	      }else {
	         mav.addObject("dto", dto);
	         mav.setViewName("teacher/teacherBoard/teacherAnswer");
	      }
	      return mav;

	}
}
