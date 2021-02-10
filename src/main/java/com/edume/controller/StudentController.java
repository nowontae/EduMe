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
import com.edume.student.model.CartDTO;
import com.edume.student.model.CommonQnaDAO;
import com.edume.student.model.CommonQnaDTO;
import com.edume.student.model.CreditDAO;
import com.edume.student.model.NoticeMsgDAO;
import com.edume.student.model.PurchaseDAO;
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
	private PurchaseDAO purchaseDao;
	
	@Autowired
	private CreditDAO creditDao;
	
	@Autowired
	private NoticeMsgDAO noticeMsgDao;
	
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
		String[] arr=request.getParameterValues("ck");
		   int[] arr_i=new int[arr.length];
		   int result=0;
		   for(int i=0;i<arr.length;i++) {
			   arr_i[i]=Integer.parseInt(arr[i]);
			   result=cartDao.myCart_delete(midx, lidx);
		   }
		String msg=result>0?"선택한 항목이 삭제 되었습니다.":"선택한 항목이 삭제되지않았습니다.";
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
		
	//구매내역
		@RequestMapping("/purchaseHistory.do")
		public ModelAndView purchaseHistory(HttpServletRequest req) {
			System.out.println("purchase history 1");
			HttpSession session = req.getSession();
			int midx = Integer.parseInt((String)session.getAttribute("midx"));
			List list = purchaseDao.purchaseHistory(midx);
			System.out.println("2");
			ModelAndView mav = new ModelAndView();
			mav.addObject("purchaseHistory", list); 
			mav.setViewName("/student/purchase/purchaseHistory");
			return mav;
			
		}
	//구매내역
	@RequestMapping("/credit.do")
	public ModelAndView creditHistory(HttpServletRequest req) {
		System.out.println("credit history 1");
		HttpSession session = req.getSession();
		int midx = Integer.parseInt((String)session.getAttribute("midx"));
		List list = creditDao.creditHistory(midx);
		System.out.println("2");
		ModelAndView mav = new ModelAndView();
		mav.addObject("creditHistory", list); 
		mav.setViewName("/student/credit/creditHistory");
		return mav;
		
	}		
	
	//구매내역
	@RequestMapping("/noticeMsg.do")
	public ModelAndView noticeMsgList(HttpServletRequest req) {
		System.out.println("noticeMsgList history 1");
		HttpSession session = req.getSession();
		int midx = Integer.parseInt((String)session.getAttribute("midx"));
		List list = noticeMsgDao.noticeMsgList(midx);
		System.out.println("2");
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticeMsg", list); 
		mav.setViewName("/student/noticeMsg/noticeMsg");
		return mav;
		
	}	
	//장바구니 담기
	@RequestMapping("/addMyCartList.do")
	public ModelAndView addMyCartList(HttpServletRequest req, int lidx, Boolean result) {
		System.out.println("시작");
		HttpSession session = req.getSession();
		int midx = Integer.parseInt((String)session.getAttribute("midx"));
		System.out.println("어디까지 되니?");
		int count=cartDao.addMyCartList(midx,lidx);
		System.out.println("장바구니에 담겼는가?"+count);
		String msg="";
		if(result) { // db에 담고 장바구니 페이지로 이동
			msg="/myPage/myCart";
		}else{// db에  담고 원래 lidx 페이지로 이동
			msg="/lecture/lectureDetail";
		}
		
			
		
			
		ModelAndView mav=new ModelAndView();
		mav.setViewName(msg);
		return mav;
	}


}
