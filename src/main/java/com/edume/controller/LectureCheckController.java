package com.edume.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edume.admin_teacher_lectureCheck.model.LectureCheckDAO;
import com.edume.admin_teacher_lectureCheck.model.LectureCheckDTO;
import com.edume.createLectureCurriculum.model.CreateLectureCurriculumDTO;
import com.edume.lecture.model.LectureCurriculumDTO;
import com.edume.lecture.model.LectureDAO;
import com.edume.lecture.model.LectureDTO;
import com.edume.teacherBoardNotice.model.TeacherBoardNoticeDTO;

@Controller
public class LectureCheckController {

	@Autowired
	private LectureCheckDAO lectureCheckDao;
	
	@Autowired
	private LectureDAO lectureDao;
	
	//동영상 공개여부가 N인 모든 강의
	@RequestMapping("/lectureCheck.do")
	public ModelAndView lectureCheckList(LectureCheckDTO dto,
		@RequestParam(value="cp", defaultValue = "1")int cp) {
		int totalCnt=lectureCheckDao.getTotalNCnt();
		int listSize=10;
		int pageSize=5;
		String pageStr=com.edume.page.PageModule.makePage("lectureCheck.do", totalCnt, cp, listSize, pageSize);
		
		List list=lectureCheckDao.lectureCheckList(cp,listSize);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("admin_Teacher/lectureCheck");
		return mav;
	}
	
	//동영상 공개여부가 Y인 모든 강의
		@RequestMapping("/lectureCheckY.do")
		public ModelAndView LectureCheckY(LectureCheckDTO dto,
				@RequestParam(value="cp", defaultValue = "1")int cp) {
			int totalCnt=lectureCheckDao.getTotalYCnt();
			int listSize=10;
			int pageSize=5;
			String pageStr=com.edume.page.PageModule.makePage("lectureCheckY.do", totalCnt, cp, listSize, pageSize);
			List list=lectureCheckDao.lectureCheckY(cp,listSize);
			
			ModelAndView mav=new ModelAndView();
			mav.addObject("list", list);
			mav.addObject("pageStr", pageStr);
			mav.setViewName("admin_Teacher/lectureCheckY");
			return mav;
		}
		
		 /*본문보기*/
		 @RequestMapping("/lectureLtitleContent.do")
		 public ModelAndView lectureNContent(@RequestParam(value="lidx", defaultValue = "0") int lidx,
				@RequestParam(value="section", defaultValue = "1") int section,
				@RequestParam(value="part", defaultValue = "1") int part)  {
				
				Map map = new HashMap();
				map.put("lidx", lidx);
				LectureCheckDTO dto = lectureCheckDao.lectureContent(map); //강의
				LectureCurriculumDTO ldto = lectureDao.getMyClass(lidx, section, part); //커리큘럼 강의번호,섹션,강의
				List lcdto = lectureDao.getLectureCurriculum(lidx); //커리큘럼 내용전체
				
				ModelAndView mav = new ModelAndView();
				
				if (dto == null) {
					mav.addObject("msg", "삭제된 게시글 또는 잘못된 접근입니다");
					mav.setViewName("admin_Teacher/lectureCheckMsg");
				} else {
					mav.addObject("dto", dto);
					mav.addObject("myClass", ldto);
					mav.addObject("curriculum", lcdto);
					mav.setViewName("admin_Teacher/lectureLtitleContent");
				}
				return mav;
			}
		 
		 @RequestMapping("/lectureOpen.do")
		 public ModelAndView lectureOpen(@RequestParam(value="lidx", defaultValue = "0")int lidx,
				 LectureCheckDTO dto) {
			 int result=lectureCheckDao.lectureOpen(dto);
			 
			 String msg=result>0? "강좌등록 확인 완료!":"강좌등록 확인 실패!";
			 ModelAndView mav=new ModelAndView();
			 mav.addObject("msg", msg);
			 mav.setViewName("admin_Teacher/lectureOpenMsg");
		 
			 return mav;
		 }
		 
}
