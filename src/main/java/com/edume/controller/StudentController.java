package com.edume.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edume.lecture.model.LectureCurriculumDTO;
import com.edume.lecture.model.LectureDAO;
import com.edume.lecture.model.LectureDTO;
import com.edume.student.model.CommonQnaDAO;
import com.edume.student.model.CommonQnaDTO;
import com.edume.student.model.StudentDAO;
import com.edume.student.model.WishListDAO;



@Controller
public class StudentController {

	@Autowired
	private StudentDAO studentDao;
	
	@Autowired
	private LectureDAO lectureDao;
	
//	@Autowired
//	private LectureDTO ldto;
//	
	@Autowired
	private CommonQnaDAO cqDao;
	
	@Autowired
	private WishListDAO wishListDao;
	
	//신고하기 폼
	@RequestMapping(value="/declaration.do", method=RequestMethod.GET)
	public ModelAndView declarationFrom() {
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/student/declaration/declaration");
		
		
		return mav;
	}
	
	//신고하기 등록
	@RequestMapping(value="/declaration.do", method=RequestMethod.POST)
	public ModelAndView declarationSubmit() {

		studentDao.declarationSubmit();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/student/declaration/declaration");
		
		return mav;
	}
	
	
	
	//일반문의사항 폼
	@RequestMapping(value="/commonQna.do", method=RequestMethod.GET)
	public String commonQnaFrom() {
		return "/common/commonQna";
	}
		
	//일반문의사항 등록
	@RequestMapping(value="/commonQna.do", method=RequestMethod.POST)
	public ModelAndView commonQnaSubmit(CommonQnaDTO cqdto) {
		int result = cqDao.commonQnaInsert(cqdto);
		System.out.println(result);
		String resultStr="등록에 실패하였습니다.";
		if(result == 1) {
			resultStr = "등록에 성공하였습니다.";
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/student/commonQna/commonQnaOk");
		mav.addObject("resultStr", resultStr);
		
		return mav;
	}
	
	
	
		//	강의리스트
		@RequestMapping(value="/lectureList.do", method=RequestMethod.GET)
		public ModelAndView lectureList() {
			System.out.println("1");
			List list = lectureDao.getLectureList();
			System.out.println("2");
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/lecture/lectureList");
			mav.addObject("lectureList", list);
			System.out.println("3");
			return mav;
			
		}
	
	//강의 상세
	@RequestMapping("/lectureDetail.do")
	public ModelAndView lectureDetail(@RequestParam("lidx") int lidx) {
		System.out.println("1");
		LectureDTO ldto = lectureDao.getLectureDetail(lidx);
		List lcdto = lectureDao.getLectureCurriculum(lidx);
		System.out.println("2");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/lecture/lectureDetail");
		mav.addObject("lectureDetail", ldto);
		mav.addObject("curriculum", lcdto);
		System.out.println("lidx="+ldto.getLidx());
		return mav;
		
	}
	
	

	//찜목록
	@RequestMapping("/wishList.do")
	public ModelAndView wishList(HttpServletRequest req) {
		System.out.println("wishList 1");
		HttpSession session = req.getSession();
		int midx = Integer.parseInt((String)session.getAttribute("midx"));
		List list = wishListDao.getWishList(midx);
		System.out.println("컨트롤러 list 사이즈 : "+list.size());
		String test1 ="test1";
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		mav.addObject("test1", test1);
		mav.setViewName("/student/wishList/wishList");
		
		return mav;
		
	}
			
<<<<<<< HEAD
	//장바구니 페이지이동
	@RequestMapping("/MyCart.do")
	public ModelAndView myCart() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("myPage/myCart");
		return mav;
	}
	
	//내학습관리 페이지 이동
	@RequestMapping("/MyLectureList.do")
	public ModelAndView myLectureList() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("myPage/myLectureList");
		return mav;
	}
=======
	
	//찜목록
	@RequestMapping("/addWishList.do")
	public ModelAndView wishListAdd(HttpServletRequest req, @RequestParam("lidx")int lidx) {
		System.out.println("add wish 1");
		HttpSession session = req.getSession();
		int midx = Integer.parseInt((String)session.getAttribute("midx"));
		int result = wishListDao.addWishList(midx, lidx);
		System.out.println("2");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/student/wishList/goWishList");
		return mav;
		
	}
		
		
>>>>>>> wontae/decalration
}
