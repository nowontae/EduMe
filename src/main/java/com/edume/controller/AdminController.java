package com.edume.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edume.admin.model.CommonQnaDAO;
import com.edume.admin.model.CommonQnaDTO;
import com.edume.admin.model.CommonQna_ReplyDAO;
import com.edume.admin.model.CommonQna_ReplyDTO;
import com.edume.admin.model.DeclarationDAO;
import com.edume.admin.model.MemberDAO;
import com.edume.admin.model.MemberDTO;
import com.edume.admin.model.ReviewDAO;


@Controller
public class AdminController {

	
	
	   @Autowired
		private MemberDAO memberDao;
	   @Autowired
	   private DeclarationDAO declarationDao;
	   
	   @Autowired
	    private CommonQnaDAO commonQnaDao;
	   @Autowired
	    private CommonQna_ReplyDAO commonQnaReplyDao;

		//관리자 페이지 이동
	   @RequestMapping("/admin.do")
	      public String index() {
	         return "admin/adminForm";
	      }
	   
	   //      ---전체 유저 리스트 ---
	   
	   
	   //관리자페이지-전체 유저리스트 출력페이지의 검색기능
	   @RequestMapping("/admin_userInfoList.do")
	   public ModelAndView userInfoList(String selects, String findKeys) {
		   Map<String, String> map=new HashMap<String, String>();
		   map.put("selects",selects);
		   map.put("findKeys",findKeys);
		   
		   List list=memberDao.memberInfoList(map);
	
		   ModelAndView mav=new ModelAndView();
		   mav.addObject("list",list);
		   mav.setViewName("admin/userAllList");
		   return mav;
	   }
	   
	   //관리자페이지-전체 유저리스트 출력
	   @RequestMapping("/admin_memberAllList.do")
	   	public ModelAndView memberIdxAllList(
	   			@RequestParam(value="cp",defaultValue = "1")int cp) {
			int totalCnt=commonQnaDao.commonQna_TotalCnt();
			int listSize=5;
			int pageSize=5;
			String pageStr=com.edume.page.PageModule
					.makePage("admin_memberAllList.do", totalCnt, cp, listSize, pageSize);
		   List list=memberDao.memberIdxAllList(cp,listSize);
		   ModelAndView mav=new ModelAndView();
		   mav.addObject("list",list);
		   mav.addObject("pageStr",pageStr);
		   mav.setViewName("admin/userAllList");
		   return mav;
	    }
	
	   //관리자페이지 - 전체유저 리스트의  유저 정보 내역
	   @RequestMapping("/userInfo.do")
	   public ModelAndView userInfo(
			   @RequestParam(value="midx", defaultValue="0")int midx) {
		   MemberDTO dto=memberDao.memberInfo(midx);
		   ModelAndView mav=new ModelAndView();
		   mav.addObject("dto",dto);
		   mav.setViewName("admin/userInfo");
		   return mav;
	   }
	   
	   //   --- 블랙리스트 ---
	   
	   //관리자페이지-전체 블랙리스트 출력
	   @RequestMapping("/admin_blackList.do")
	   public ModelAndView blackList() {
		   List list =memberDao.member_blackList();
		   ModelAndView mav=new ModelAndView();
		   mav.addObject("list",list);
		   mav.setViewName("admin/blackList");
		   return mav;
	   }
	   //블랙리스트 해제
	   @RequestMapping("/admin_Unblacklist.do")
	   public ModelAndView Unblacklist(int midx) {
		   int result=memberDao.Unblacklist(midx);
		   ModelAndView mav = new ModelAndView();
		   String msg=result>0?"계정 사용이 가능합니다.":"계정사용이 불가능 합니다.";
		   mav.addObject("msg",msg);
		   mav.setViewName("admin/Unblacklist_Msg");
		   return mav;
	   }
	   // 블랙리스트 다중선택 후 해제(체크박스사용)
	   @RequestMapping("UnblackSelectlist.do")
	   public ModelAndView UnblackSelectlist(HttpServletRequest request) {
		   String[] arr=request.getParameterValues("mname_cb");
		   int[] arr_i=new int[arr.length];
		   int result=0;
		   for(int i=0;i<arr.length;i++) {
			   arr_i[i]=Integer.parseInt(arr[i]); 
			   result=memberDao.Unblacklist(arr_i[i]);
		   }
		   //System.out.println("1:"+arr[0]);
		   //System.out.println("2:"+arr_i[0]);
		   String msg=result>0?"계정 사용이 가능합니다.":"계정 사용이 불가능합니다.";
		   ModelAndView mav=new ModelAndView();
		   mav.addObject("arr",arr);
		   mav.addObject("msg",msg);
		   mav.setViewName("admin/Unblacklist_Msg");
		   return mav;
	   }
	   
	   //      --- 리뷰 신고 글 ---
	   
	  //관리자페이지-리뷰신고 출력
	   @RequestMapping("admin_reviewDeclaration.do")
	   public ModelAndView DeclarationAllList() {
		   List list = declarationDao.DeclarationAllList();
		   ModelAndView mav=new ModelAndView();
		   mav.addObject("list",list);
		   mav.setViewName("admin/reviewDeclaration");
		   return mav;
	   }
	   
	   
	   //			--- 문의사항 ---
	   
	   
	   
	   //관리자페이지-문의사항 전체 글리스트  출력
	   @RequestMapping("/admin_CommonQnAList.do")
	   public ModelAndView CommonQnAList(
			   @RequestParam(value="cp",defaultValue = "1")int cp) {
		   	int totalCnt=commonQnaDao.commonQna_TotalCnt();
			int listSize=5;
			int pageSize=5;
			String pageStr=com.edume.page.PageModule
					.makePage("admin_CommonQnAList.do", totalCnt, cp, listSize, pageSize);
		   List list=commonQnaDao.CommonQnAList(cp,listSize);
		   ModelAndView mav=new ModelAndView();
		   mav.addObject("list",list);
		   mav.addObject("pageStr",pageStr);
		   mav.setViewName("admin/CommonQnAList");
		   return mav;
	   }
	   
	 //문의사항 답변 완료 글 리스트보기
	   @RequestMapping("/admin_CommonQnAListComplete.do")
	   public ModelAndView CommonQnAListComplete() {
		   List list = commonQnaDao.CommonQnAListComplete();
		   ModelAndView mav=new ModelAndView();
		   mav.addObject("list",list);
		   mav.setViewName("admin/CommonQnAList");
		   return mav;
	   }
	   
	   //문의사항 답변 미완료 글 리스트보기
	   @RequestMapping("/admin_CommonQnAListNotComplete.do")
	   public ModelAndView CommonQnAListNotComplete() {
		   List list = commonQnaDao.CommonQnAListNotComplete();
		   ModelAndView mav=new ModelAndView();
		   mav.addObject("list",list);
		   mav.setViewName("admin/CommonQnAList");
		   return mav;
	   }

	   //관리자페이지-문의사항 본문글, 답변글 내용보기
	   @RequestMapping("/commonQnaContent.do")
	   public ModelAndView CommonQnAContent( 
			   @RequestParam(value="cqidx", defaultValue="0")int cqidx) {
		   CommonQnaDTO dto=commonQnaDao.CommonQnaContent(cqidx);
		   List list=commonQnaReplyDao.ReplyList(cqidx);
		   ModelAndView mav=new ModelAndView();
		   mav.addObject("list", list);
		   mav.addObject("dto",dto);
		   mav.setViewName("admin/commonQnaContent");
		   return mav;
	   }
	   
	   //관리자페이지-문의사항 본문글 내용보기에서 처리완료 버튼을 눌렀을때 
	   @RequestMapping("/AnswerComplete.do")
	   public ModelAndView AnswerComplete(
			   @RequestParam(value="cqidx", defaultValue="0")int cqidx) {
		   //System.out.println("cqidx = "+ cqidx);
		   int result=commonQnaDao.AnswerComplete(cqidx);
		   //System.out.println("실행횟수"+result);
		   ModelAndView mav= new ModelAndView();
		   mav.addObject("result",result);
		   mav.setViewName("admin/commonQnaContent_ok");
		   return mav;
	   }
	   // 문의사항 답변 댓글 달기
	   @RequestMapping("/Qna_ReplyAdd.do")
	   public ModelAndView ReplyWrite(CommonQna_ReplyDTO dto){
		   int result = commonQnaReplyDao.ReplyWrite(dto);
		   int cqidx=dto.getCqidx();
		   String msg=result>0?"답변글이 등록되었습니다.":"답변글이 등록되지 않았습니다.";
		   ModelAndView mav=new ModelAndView();
		   mav.addObject("msg",msg);
		   mav.addObject("cqidx", cqidx);
		   mav.setViewName("admin/Qna_Reply_Msg");
		   return mav;
	   }
	   //문의사항 답변 댓글 삭제
	   @RequestMapping("Qna_ReplyDelete.do")
	   public ModelAndView ReplyDelete(int cqidxx, int cqreply_idx) {
		 
		   int cqidx=cqidxx;
		   int result = commonQnaReplyDao.ReplyDelete(cqreply_idx);
		   String msg=result>0?"답변글이 삭제 되었습니다.":"답변글이 삭제되지 않았습니다.";
		   ModelAndView mav = new ModelAndView();
		   mav.addObject("msg", msg);
		   mav.addObject("cqidx", cqidx);
		   mav.setViewName("admin/Qna_Reply_Msg");
		   return mav;
	   }

	   //문의사항 답변 댓글 수정하기 위한 페이지 이동
	   @RequestMapping("Qna_ReplyUpdateForm.do")
	   public ModelAndView Qna_ReplyUpdateForm( 
			   @RequestParam(value="cqidxx", defaultValue="0")int cqidxx, int cqreply_idx) {
		   CommonQnaDTO dto=commonQnaDao.CommonQnaContent(cqidxx);
		   CommonQna_ReplyDTO dt=commonQnaReplyDao.Qna_ReplyUpdateForm(cqreply_idx);
		   ModelAndView mav=new ModelAndView();
		   mav.addObject("dto",dto);
		   mav.addObject("dt",dt);
		   mav.setViewName("admin/commonQnaContent_UpdateForm");
		   return mav;
	   }
	   
	   
	   //문의사항 답변 댓글 수정
	  @RequestMapping("Qna_ReplyUpdate.do")
	   public ModelAndView Qna_ReplyUpdate(int cqidxx, int cqreply_idx, String cqreplycontent) {
		 // String cqreply_idxz=Integer.toString(cqreply_idx);
		  
		//  System.out.println("cqreply_idx="+cqreply_idx);
		 // System.out.println("cqidx="+cqidxx);
		  //System.out.println("cqreplycontent="+cqreplycontent);
		  Map map=new HashMap();
		
		  map.put("cqreply_idx",cqreply_idx);
		  map.put("cqreplycontent",cqreplycontent);
		  int cqidx=cqidxx;
		  int result=commonQnaReplyDao.ReplyUpdate(map);
		  
		  ModelAndView mav=new ModelAndView();
		 
		  String msg=result>0?"답변글이 수정되었습니다.":"답변글이 수정되지 않았습니다.";
		  mav.addObject("msg", msg);
		  mav.addObject("cqidx", cqidxx);
		  mav.setViewName("admin/Qna_Reply_Msg");
		  return mav;
	   }

	
}
