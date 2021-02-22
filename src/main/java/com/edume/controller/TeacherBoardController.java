package com.edume.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.edume.teacherBoard.model.*;

@Controller
@EnableWebMvc
public class TeacherBoardController {
	
	@Autowired
	private TeacherBoardDAO teacherBoardDao;
	
	@RequestMapping("/teacherAsk.do")
	public ModelAndView teacherAskList(@RequestParam(value = "cp",defaultValue = "1")int cp,
			@RequestParam(value="midx",defaultValue = "0")int midx,
			@RequestParam(value="boardtype",defaultValue = "A")String boardtype) {
		Map map=new HashMap();
		int listSize=10;
		int pageSize=5;	
		String str = null;
		List arr= null;
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		map.put("midx", midx);
		map.put("start", start);
		map.put("end", end);
		
		if(boardtype.equals("A")) {
			int Cnt=teacherBoardDao.getAskListCnt(midx);
			str=com.edume.page.PageModule.teacherAskPage("teacherAsk.do", cp, Cnt, listSize, pageSize, midx, boardtype);
			arr=teacherBoardDao.BoardAskList(map);
		}else if(boardtype.equals("Y")) {
			int Cnt=teacherBoardDao.getAskListYCnt(midx);
			str=com.edume.page.PageModule.teacherAskPage("teacherAsk.do", cp, Cnt, listSize, pageSize, midx, boardtype);
			arr=teacherBoardDao.BoardAskListY(map);
		}else if(boardtype.equals("N")){
			int Cnt=teacherBoardDao.getAskListNCnt(midx);
			str=com.edume.page.PageModule.teacherAskPage("teacherAsk.do", cp, Cnt, listSize, pageSize, midx, boardtype);
			arr=teacherBoardDao.BoardAskListN(map);
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("str",str);
		mav.addObject("list",arr);
		mav.setViewName("teacher/teacherBoard/teacherAsk");
		return mav;
	}
	
	@RequestMapping("/teacherAnswer.do")
	public ModelAndView teacherAnswer(@RequestParam(value="midx",defaultValue = "0")int midx,
			@RequestParam(value="lqidx",defaultValue = "0")int lqidx) {
			Map map=new HashMap();
			map.put("midx", midx);
			map.put("lqidx", lqidx);
		
			TeacherBoardDTO dto=teacherBoardDao.boardAskContent(map);
			List arr=teacherBoardDao.boardReplyList(map);
	      ModelAndView mav=new ModelAndView();
	      if(dto==null) {
	         mav.addObject("msg", "삭제된 게시글 또는 잘못된 접근입니다");
	         mav.setViewName("teacher/teacherBoard/teacherMsg");
	      }else {
	         mav.addObject("dto", dto);
	         mav.addObject("list",arr);
	         mav.setViewName("teacher/teacherBoard/teacherAnswer");
	      }
	      return mav;
	}
	
	@RequestMapping("/teacherAnswerSubmit.do")
	public ModelAndView teacherAnswerSubmit(TeacherBoardDTO dto,
			@RequestParam(value="midx",defaultValue = "0")int midx,
			@RequestParam(value="lqidx",defaultValue = "0")int lqidx,
			HttpServletRequest req) {
		HttpSession session = req.getSession();
		//int teacheMidx=Integer.parseInt((String)session.getAttribute("midx"));
		int teacherMidx = (Integer)session.getAttribute("midx");
		String msg="";
		String page="";
		int result=teacherBoardDao.replyWrite(dto);
		int replyResult=teacherBoardDao.replyUpdate(dto);
		
		
		ModelAndView mav=new ModelAndView();
		if(result>0 && replyResult>0) {
			msg="등록되었습니다.";
			mav.addObject("msg", msg);
			page="teacherAsk.do?midx="+teacherMidx;
			mav.addObject("page", page);
			mav.setViewName("teacher/teacherBoard/teacherMsg");
		}else {
			msg="실패";
			mav.addObject("msg", msg);
			page="teacherAsk.do?midx="+teacherMidx;
			mav.addObject("page", page);
			mav.setViewName("teacher/teacherBoard/teacherMsg");
		}
		return mav;
	}
	@RequestMapping("/replyCheckY.do")
	public ModelAndView replyCheckY(TeacherBoardDTO dto,
			@RequestParam(value="midx",defaultValue = "0")int midx,
			@RequestParam(value="lqidx",defaultValue = "0")int lqidx,
			HttpServletRequest req) {
		System.out.println("replyY ");
		HttpSession session = req.getSession();

		//int teacheMidx=Integer.parseInt((String)session.getAttribute("midx"));
		int teacherMidx = (Integer)session.getAttribute("midx");

		String msg="";
		String page="";
		
		
		ModelAndView mav=new ModelAndView();
		int replyResult=teacherBoardDao.replyUpdate(dto);
		System.out.println("replyY ");
		if(replyResult>0) {
			msg="수정되었습니다.";
			mav.addObject("msg", msg);
			page="teacherAsk.do?midx="+teacherMidx;
			mav.addObject("page", page);
			mav.setViewName("teacher/teacherBoard/teacherMsg");
		}else {
			msg="실패";
			mav.addObject("msg", msg);
			page="teacherAsk.do?midx="+teacherMidx;
			mav.addObject("page", page);
			mav.setViewName("teacher/teacherBoard/teacherMsg");
		}
		return mav;
	}
	
}





















