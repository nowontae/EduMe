package com.edume.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.edume.teacherPaymentRequest.model.*;

import java.text.DecimalFormat;
import java.util.*;

@Controller
@EnableWebMvc
public class TeacherPaymentRequest {
	
	@Autowired
	private TeacherPaymentRequestDAO teacherPaymentRequestDao;
	
	@RequestMapping("/teacherPaymentRequest.do")
	public ModelAndView teacherPaymentRequest(@RequestParam(value = "midx", defaultValue = "0")int midx) {
		
		Map map=new HashMap();
		map.put("midx", midx);
		
		DecimalFormat formatter = new DecimalFormat("###,###원");
		
		Integer teacherMoney=teacherPaymentRequestDao.teacherPaymentCredit(map);
		if(teacherMoney==null) {teacherMoney=0;}
		
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
	
}
