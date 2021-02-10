package com.edume.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edume.lecture.model.LectureCurriculumDTO;
import com.edume.lecture.model.LectureDAO;
import com.edume.lecture.model.LectureDTO;
import com.edume.student.model.CartDAO;
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
	
	@Autowired
	private CartDAO cartDao;
	
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
	//		-- 장바구니 --
	
	//내 장바구니  페이지이동
	@RequestMapping("/MyCart.do")
	public ModelAndView myCart(HttpServletRequest req) {
		HttpSession session=req.getSession();
		int midx = Integer.parseInt((String)session.getAttribute("midx"));
		List list=cartDao.myCartList(midx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("Sesseion_midx",midx);
		mav.addObject("list",list);
		mav.setViewName("myPage/myCart");
		return mav;
	}
	//내 장바구니 페이지에서 항목 1개 삭제
	@RequestMapping("/myCart_Delete.do")
	public ModelAndView myCart_delete(
			@RequestParam(value="midx", defaultValue="0")int midx, int lidx) {
		int result=cartDao.myCart_delete(midx, lidx);
		String msg=result>0?"선택하신 강의 항목이 삭제되었습니다.":"선택하신 강의항목이 삭제 되지 않았습니다..";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("myPage/myCartMsg");
		return mav;
	}
	//내 장바구니 페이지에서 다중 선택 후 해제(체크박스 사용)
	@RequestMapping("/myCart_SelectDelete.do")
	public ModelAndView myCart_SelectDelete(HttpServletRequest request, int midx, int lidx) {
		System.out.println("시작");
		String[] arr=request.getParameterValues("ck");
		System.out.println("값 들어오니?"+arr[0]);
		   int[] arr_i=new int[arr.length];
		   System.out.println("변환해줍시다.");
		   int result=0;
		   for(int i=0;i<arr.length;i++) {
			   System.out.println("for문 도니?"+arr[i]);
			   arr_i[i]=Integer.parseInt(arr[i]);
			   System.out.println("for문 속 변환 "+arr_i[i]);
			   result=cartDao.myCart_delete(midx, lidx);
			   System.out.println("결과를 봅시다요");
		   }
		System.out.println("포문 탈출~!");
		String msg="!";
		ModelAndView mav =new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("myPage/myCartMsg");
		return mav;
	}
	
	
	//내학습관리 페이지 이동
	@RequestMapping("/MyLectureList.do")
	public ModelAndView myLectureList() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("myPage/myLectureList");
		return mav;
	}
	
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

}
