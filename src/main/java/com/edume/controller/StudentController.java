package com.edume.controller;

import java.lang.reflect.Parameter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.edume.admin.model.ReviewDAO;
import com.edume.admin_teacher_lectureCheck.model.LectureCheckDAO;
import com.edume.admin_teacher_lectureCheck.model.LectureCheckDTO;
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
	 @Autowired
	 private ReviewDAO reviewDao;
	 @Autowired
	 private LectureCheckDAO lectureCheckDao;
	

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
	
	
	
		
	
	//강의 상세
	@RequestMapping("/lectureDetail.do")
	public ModelAndView lectureDetail(@RequestParam("lidx") int lidx) {
		//System.out.println("1");
		LectureDTO ldto = lectureDao.getLectureDetail(lidx);
		List lcdto = lectureDao.getLectureCurriculum(lidx);

		List list=reviewDao.reviewList_lectureDetail(lidx);//댓글보기
		//System.out.println("2");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/lecture/lectureDetail");
		mav.addObject("lectureDetail", ldto);
		mav.addObject("list", list);
		mav.addObject("curriculum", lcdto);
		//System.out.println("lidx="+ldto.getLidx());
		return mav;
		
	}
	
	//강의 상세 진입 Ajax
	@RequestMapping("/checkMyLecture.do")
	public ModelAndView checkMyLecutre(@RequestParam("lidx") int lidx, HttpServletRequest req) {
		HttpSession session = req.getSession();
		//int midx = Integer.parseInt((String)session.getAttribute("midx"));
		int midx = (Integer)session.getAttribute("midx");
		int result = lectureDao.checkMyLecture(lidx, midx);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/lecture/checkMyLecture");
		mav.addObject("result", result);
		return mav;
		
	}
	
	//강의 수강
		@RequestMapping("/lectureMyClass.do")
		public ModelAndView lectureDetail(@RequestParam(value="lidx", defaultValue = "0") int lidx,
				@RequestParam(value="section", defaultValue = "1") int section,
				@RequestParam(value="part", defaultValue = "1") int part) {
			
			Map map = new HashMap();
			map.put("lidx", lidx);
			
			LectureCheckDTO dto = lectureCheckDao.lectureContent(map); //강의
			LectureCurriculumDTO ldto = lectureDao.getMyClass(lidx, section, part); //커리큘럼 강의번호,섹션,강의
			List lcdto = lectureDao.getLectureCurriculum(lidx); //커리큘럼 내용전체
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/lecture/lectureMyClass");
			mav.addObject("myClass", ldto);
			mav.addObject("curriculum", lcdto);
			//System.out.println("lidx="+ldto.getLidx());
			return mav;
			
		}

	//찜목록
	@RequestMapping("/wishList.do")
	public ModelAndView wishList(HttpServletRequest req) {
		System.out.println("wishList 1");
		HttpSession session = req.getSession();
		//int midx = Integer.parseInt((String)session.getAttribute("midx"));
		int midx = (Integer)session.getAttribute("midx");
		List list = wishListDao.getWishList(midx);
		System.out.println("컨트롤러 list 사이즈 : "+list.size());
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		mav.setViewName("/student/wishList/wishList");
		
		return mav;
		
	}

	
	//		-- 장바구니 --
	
	//내 장바구니  페이지이동
	@RequestMapping("/MyCart.do")
	public ModelAndView myCart(HttpServletRequest req) {
		
		System.out.println("mycart into");
		HttpSession session=req.getSession();
		int midx = (Integer)session.getAttribute("midx");
		System.out.println("cart midx=" + midx);
		ArrayList list=cartDao.myCartList(midx);
		
		int lastPrice = 0;
		for(int i=0;i< list.size(); i++) {
			CartDTO tmp = (CartDTO)list.get(i);
			lastPrice += tmp.getLlastprice();
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("Sesseion_midx",midx);
		mav.addObject("list",list);
		mav.addObject("lastPrice",lastPrice);
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
	public ModelAndView myCart_SelectDelete(HttpServletRequest request, int midx) {
		String[] arr=request.getParameterValues("lidx");
		   int[] arr_i=new int[arr.length];
		   int result=0;
		   for(int i=0;i<arr.length;i++) {
			   arr_i[i]=Integer.parseInt(arr[i]);
			   result=cartDao.myCart_delete(midx, arr_i[i]);
		   }
		String msg=result>0?"선택한 항목이 삭제 되었습니다.":"선택한 항목이 삭제되지않았습니다.";
		ModelAndView mav =new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("myPage/myCartMsg");
		return mav;
	}
	//내 장바구니 페이지에서 결제
	@RequestMapping("/myCart_PurchaseLecture.do")
	public ModelAndView myCart_PurchaseLecture(HttpServletRequest request, int midx) {
		String[] arr=request.getParameterValues("lidx");
		   int result=0;
		   for(int i=0;i<arr.length;i++) {
			   
			   System.out.println("하나씩 결제 시작");
			   System.out.println("midx="+midx+"/lidx="+arr[i]);
			   int lidx=Integer.parseInt(arr[i]);
			   
			// 장바구니에서 구매 -1 (구매 목록 등록)  
			// 장바구니에서 구매 -2 (장바구니 삭제 )
			// 장바구니에서 구매 -3 (결제내역 등록)
			// 장바구니에서 구매 -4 (크레딧 등록)
			   result+=cartDao.myCart_PurchaseLecture(midx, lidx); // result = 1
			   result+=cartDao.myCart_updatePurchase(midx, lidx);  // result = 1 + 3
			   result+=cartDao.myCart_delete(midx, lidx); // result = 1 + 3 + 1
		   }
		String msg=	result==5*arr.length?"구매완료":"에러 발생";
		ModelAndView mav =new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("myPage/myCartMsg");
		return mav;
	}
	

		
	
	//내 강의 목록 페이지 이동
	@RequestMapping("/myLectureList.do")
	public ModelAndView myLectureList(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		//int midx = Integer.parseInt((String)session.getAttribute("midx"));
		int midx = (Integer)session.getAttribute("midx");
		List list = lectureDao.getMyLectureList(midx);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("lecture/myLectureList");
		mav.addObject("myLectureList", list);
		return mav;
	}
	
	//찜목록
	@RequestMapping("/addWishList.do")
	public ModelAndView wishListAdd(HttpServletRequest req, @RequestParam("lidx")int lidx) {
		System.out.println("add wish 1");
		HttpSession session = req.getSession();
		//int midx = Integer.parseInt((String)session.getAttribute("midx"));
		int midx = (Integer)session.getAttribute("midx");
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
		//int midx = Integer.parseInt((String)session.getAttribute("midx"));
		int midx = (Integer)session.getAttribute("midx");
		
		
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
		//int midx = Integer.parseInt((String)session.getAttribute("midx"));
		int midx = (Integer)session.getAttribute("midx");
		
		
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
		HttpSession session = req.getSession();
		//int midx = Integer.parseInt((String)session.getAttribute("midx"));
		
		int midx = (Integer)session.getAttribute("midx");
		List list = noticeMsgDao.noticeMsgList(midx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticeMsg", list); 
		mav.setViewName("/student/noticeMsg/noticeMsg");
		return mav;
		
	}	
	//장바구니 담기
	@RequestMapping("/addMyCartList.do")
	public ModelAndView addMyCartList(HttpServletRequest req, int lidx) {
		HttpSession session = req.getSession();
		//int midx = Integer.parseInt((String)session.getAttribute("midx"));
		int midx = (Integer)session.getAttribute("midx");
		String msg="";
		String gopage="";
		ModelAndView mav=new ModelAndView();
		//장바구니에 있는지 한번 확인한다.
		int check_result=cartDao.myCartList_Check(midx, lidx);
		
		if(check_result>0) {
			msg="이미 장바구니에 담겨있습니다.";
			gopage="/lecture/lectureDetail";
			mav.addObject("lidx",lidx);
		}else {
			//장바구니에 없다면 담기를 실행한다.
			int count=cartDao.addMyCartList(midx,lidx);
			
			gopage="/myPage/myCartMsg";
			msg="장바구니페이지로 이동합니다.";
			
		}
		mav.addObject("msg", msg);
		mav.addObject("lidx",lidx);
		mav.setViewName(gopage);
		return mav;
	}

	
	// 장바구니 -> 결제
	@RequestMapping("/purchase.do")
	public ModelAndView purchaseLecture() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/student/purchase/purchase");
		
		return mav;
		
	}

}
