package com.edume.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.edume.admin_Payment.model.*;
import com.edume.teacherPaymentRequest.model.*;

import java.text.DecimalFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@EnableWebMvc
public class TeacherPaymentRequest {
	
	@Autowired
	private TeacherPaymentRequestDAO teacherPaymentRequestDao;
	
	@Autowired
	private PaymentDAO paymentDao;
	
	@Autowired
	private TeacherPaymentRequestDAO teacherpaymentRequestDao;
	
	//강사 수익 요청 부분
	
	@RequestMapping("/teacherPaymentRequest.do")
	public ModelAndView teacherPaymentRequest(@RequestParam(value = "midx", defaultValue = "0")int midx) {
		
		Map map=new HashMap();
		map.put("midx", midx);
		
		DecimalFormat formatter = new DecimalFormat("###,###원");
		
		Integer teacherMoney1=teacherPaymentRequestDao.teacherPaymentCredit(map);
		Integer teacherMoney2=teacherPaymentRequestDao.teacherPaymentCredit2(map);
		if(teacherMoney2==null) {teacherMoney2=0;}
		if(teacherMoney1==null) {teacherMoney1=0;}
		int teacherMoney=teacherMoney1+teacherMoney2;
		int teacherMoneyCopy=teacherMoney;
		
		String teachermoney=formatter.format(teacherMoney);
		
		TeacherPaymentRequestDTO dto=teacherPaymentRequestDao.teacherBankInfo(map);
		
		List arrWait=teacherPaymentRequestDao.waitPaymentRequest(map);
		
		List arrComplete=teacherPaymentRequestDao.completePaymentRequest(map);
		
		ModelAndView mav= new ModelAndView();
		
		mav.addObject("arr", arrWait);
		mav.addObject("arr2", arrComplete);
		mav.addObject("midx", midx);
		mav.addObject("teacherMoney", teachermoney);
		mav.addObject("dto", dto);
		mav.addObject("teacherMoneyCopy", teacherMoneyCopy);
		mav.setViewName("teacher/teacherPaymentRequest/teacherPaymentRequest");
		
		return mav;
		
	}
	
	@RequestMapping("/paymentRequestSubmit.do")
	public ModelAndView teacherPayment(TeacherPaymentRequestDTO dto) {
		
		int count=teacherPaymentRequestDao.paymentInsert(dto);
		String msg=count>0?"등록되었습니다.":"실패~";
		
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("/teacher/teacherPaymentRequest/paymentMsg");
		return mav;
		
	}
	
	
	
	//관리자 수익 요청 리스트,지급 부분
	
	@RequestMapping("/adminPayment.do")
	public ModelAndView adminPayment() {
		
		List arr=paymentDao.paymentRequestList();
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("arr", arr);
		mav.setViewName("admin_Teacher/teacherPaymentProcess");
		
		return mav;
	}
	
	@RequestMapping("/paymentOK.do")
	public ModelAndView paymentOK(PaymentDTO dto,
			@RequestParam(value = "midx",defaultValue = "0")int midx,
			@RequestParam(value = "pay_amount",defaultValue = "0")int pay_amount) {
		
		/*
		String midx_s=rq.getParameter("midx");
		int midx=Integer.parseInt(midx_s);
		
		String pay_idx_s=rq.getParameter("pay_idx");
		int pay_idx=Integer.parseInt(pay_idx_s);
		
		String pay_amount_s=rq.getParameter("pay_amount");
		int pay_amount=Integer.parseInt(pay_amount_s);
		*/
		
		
		Map map=new HashMap();
		map.put("midx", midx);
		
		int count=0;
		int count2=0;
		
		Integer result1=teacherpaymentRequestDao.teacherPaymentCredit(map);
		Integer result2=teacherpaymentRequestDao.teacherPaymentCredit2(map);
		
		if(result1==null) {result1=0;}
		if(result2==null) {result2=0;}
		
		int result=result1+result2;
	
		ModelAndView mav=new ModelAndView();
		
		
		if(result>=pay_amount) {
			count=paymentDao.creditPaymentInsert(dto);
			count2=paymentDao.updatePaymentDate(dto);
			
			String msg=count>0?"":"실패";
			String msg2=count2>0?"":"실패";
			
			String msg3=msg+"지급완료"+msg2;
			mav.addObject("msg", msg3);
			
		}else {
			String msg4="잔액이 부족합니다.";
			mav.addObject("msg", msg4);
		}
		
		mav.setViewName("admin_Teacher/teacherPaymentProcessMsg");

		return mav;
	}
	
}
