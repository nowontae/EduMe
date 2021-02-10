package com.edume.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edume.teacherBoardNotice.model.*;

@Controller
public class TeacherBoardNoticeController {

	@Autowired
	private TeacherBoardNoticeDAO teacherBoardNoticeDao;
	
	/*공지 메인*/
	 @RequestMapping("/teacherNoticeMain.do")
	 public ModelAndView teacherNoticeMain(@RequestParam(value="cp", defaultValue = "1")int cp) {
		 int totalCnt=teacherBoardNoticeDao.getTotalCnt();
			int listSize=10;
			int pageSize=5;
			String pageStr=com.edume.page.PageModule.makePage("teacherNoticeMain.do", totalCnt, cp, listSize, pageSize);
			
			List list=teacherBoardNoticeDao.teacherNoticeMain(cp,listSize);
			
			ModelAndView mav=new ModelAndView();
			mav.addObject("list", list);
			
			mav.addObject("pageStr", pageStr);
			
			mav.setViewName("teacher/teacherBoard/teacherNoticeMain");
			return mav;
		} 
	 
	 /*공지 글쓰기*/
	 @RequestMapping(value="/teacherNoticeWrite.do", method= RequestMethod.GET)
		public String teacherNoticeWriteForm() {
		return "teacher/teacherBoard/teacherNoticeWrite";
	}
	 
	 /*공지 글쓰기 등록*/
	 @RequestMapping("/teacherNoticeSubmit.do")
		public ModelAndView teacherNoticeWriteSubmit(TeacherBoardNoticeDTO dto,
				@RequestParam("upload")MultipartFile upload,
				HttpServletRequest rs) {
		 //
		 HttpSession session=rs.getSession();
		 String path = session.getServletContext().getRealPath("/")+"img/";
		 System.out.println(path);
		 
		 dto.setNimg(upload.getOriginalFilename());
		 copyInto(upload,path);
		 int result=teacherBoardNoticeDao.teacherNoticeWrite(dto);
		 String msg=result>0? "글쓰기 성공!":"글쓰기 실패!";
		
		 ModelAndView mav=new ModelAndView();
		 mav.addObject("msg", msg);
		 mav.setViewName("teacher/teacherBoard/noticeWriteMsg");
		 return mav;
	}
	 
		/*실제 파일 복사 관련 메서드*/
	 
		private void copyInto(MultipartFile upload,String path) {
			try {
				byte bytes[]=upload.getBytes(); //복사 할 원본
				File outFile=new File(path+upload.getOriginalFilename());//빈 종이(어디에 복사할건지 대상 정의)
				FileOutputStream fos=new FileOutputStream(outFile); //1바이트씩 저장하고,1바이트씩 뽑아옴
				fos.write(bytes); //이게 복사기능
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}	
		}	
	 
	 /*공지 본문보기*/
	 @RequestMapping(value="/teacherNoticeContent.do", produces= "text/plain;charset=utf-8")
	 public ModelAndView teacherNoticeContent(@RequestParam(value="nidx", defaultValue = "0")int nidx) {
	 TeacherBoardNoticeDTO dto=teacherBoardNoticeDao.teacherNoticeContent(nidx);
	 
	 ModelAndView mav=new ModelAndView();
	 if(dto==null) {
		 mav.addObject("msg", "삭제된 게시글 또는 잘못된 접근입니다");
		 mav.setViewName("teacher/teacherBoard/noticeWriteMsg");
	 }else {
		 mav.addObject("dto", dto);
		 mav.setViewName("teacher/teacherBoard/teacherNoticeContent");
		 }
	 return mav;
	 }
	 
}
