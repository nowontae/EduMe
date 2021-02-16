package com.edume.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;


import com.edume.teacherResult.model.*;
import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;


@Controller
@EnableWebMvc
public class TeacherResultController {
	
	@Autowired
	private TeacherResultDAO teacherResultDao;
	
	@RequestMapping("/teacherResult.do")
	public ModelAndView teacherResult(@RequestParam(value = "midx", defaultValue = "0")int midx) {
		
		Map map=new HashMap();
		map.put("midx", midx);

		Integer M1camount=teacherResultDao.getTeacherResult28D_7(map);
		Integer M2camount=teacherResultDao.getTeacherResult28D_14(map);
		Integer M3camount=teacherResultDao.getTeacherResult28D_21(map);
		Integer M4camount=teacherResultDao.getTeacherResult28D_28(map);
		Integer allResult=teacherResultDao.getTeacherAllResult(map);
		Integer monthResult=teacherResultDao.getTeacherResult6M_1(map);

		if(M1camount == null) {M1camount=0;}
		if(M2camount == null) {M2camount=0;}
		if(M3camount == null) {M3camount=0;}
		if(M4camount == null) {M4camount=0;}
		if(allResult == null) {allResult=0;}
		if(monthResult == null) {monthResult=0;}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("M1camount", M1camount);
		mav.addObject("M2camount", M2camount);
		mav.addObject("M3camount", M3camount);
		mav.addObject("M4camount", M4camount);
		mav.addObject("allResult", allResult);
		mav.addObject("monthResult", monthResult);
		mav.setViewName("teacher/teacherResult/teacherResult");
		return mav;
	}
	
	@RequestMapping(value = "/teacherResultChart.do", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String charTest(@RequestParam(value = "midx",defaultValue = "0")int midx,
			@RequestParam(value = "sort",defaultValue = "1")int sort) {
		//1,6,12개월당 변수이름
		Integer M1camount=0; Integer M2camount=0; Integer M3camount=0; Integer M4camount=0; Integer M5camount=0; Integer M6camount=0;
		
		
		Calendar calD1 = Calendar.getInstance();
		Calendar calD2 = Calendar.getInstance();
		Calendar calD3 = Calendar.getInstance();
		Calendar calD4 = Calendar.getInstance();
		
		Calendar calM1 = Calendar.getInstance();
		Calendar calM2 = Calendar.getInstance();
		Calendar calM3 = Calendar.getInstance();
		Calendar calM4 = Calendar.getInstance();
		Calendar calM5 = Calendar.getInstance();
		Calendar calM6 = Calendar.getInstance();
		
		Calendar calY2 = Calendar.getInstance();
		Calendar calY4 = Calendar.getInstance();
		Calendar calY6 = Calendar.getInstance();
		Calendar calY8 = Calendar.getInstance();
		Calendar calY10 = Calendar.getInstance();
		Calendar calY12 = Calendar.getInstance();

		
		calD1.setTime(new Date());
		calD2.setTime(new Date());
		calD3.setTime(new Date());
		calD4.setTime(new Date());
		
		calM1.setTime(new Date());
		calM2.setTime(new Date());
		calM3.setTime(new Date());
		calM4.setTime(new Date());
		calM5.setTime(new Date());
		calM6.setTime(new Date());
		
		calY2.setTime(new Date());
		calY4.setTime(new Date());
		calY6.setTime(new Date());
		calY8.setTime(new Date());
		calY10.setTime(new Date());
		calY12.setTime(new Date());
		
		
		DateFormat df= new SimpleDateFormat("yyyy-MM-dd");
		calD1.add(Calendar.DATE, -7);
		calD2.add(Calendar.DATE, -14);
		calD3.add(Calendar.DATE, -21);
		calD4.add(Calendar.DATE, -28);
		
		calM1.add(Calendar.MONTH, -1);
		calM2.add(Calendar.MONTH, -2);
		calM3.add(Calendar.MONTH, -3);
		calM4.add(Calendar.MONTH, -4);
		calM5.add(Calendar.MONTH, -5);
		calM6.add(Calendar.MONTH, -6);
		
		calY2.add(Calendar.MONTH, -2);
		calY4.add(Calendar.MONTH, -4);
		calY6.add(Calendar.MONTH, -6);
		calY8.add(Calendar.MONTH, -8);
		calY10.add(Calendar.MONTH, -10);
		calY12.add(Calendar.MONTH, -12);
		
		
		Map map=new HashMap();
		map.put("midx", midx);
		
		String jsonChartData="";
		if(sort==1) {
			M1camount=teacherResultDao.getTeacherResult28D_7(map);
			M2camount=teacherResultDao.getTeacherResult28D_14(map);
			M3camount=teacherResultDao.getTeacherResult28D_21(map);
			M4camount=teacherResultDao.getTeacherResult28D_28(map);
			if(M1camount==null) {M1camount=0;}
			if(M2camount==null) {M2camount=0;}
			if(M3camount==null) {M3camount=0;}
			if(M4camount==null) {M4camount=0;}
			
			
			jsonChartData="{chart:{data:["+M1camount+","+M2camount+","+M3camount+","+M4camount+"],labels:["+df.format(calD1.getTime())+","+df.format(calD2.getTime())+","+df.format(calD3.getTime())+","+df.format(calD4.getTime())+"]}}";
		}else if(sort==6){
			M1camount=teacherResultDao.getTeacherResult6M_1(map);
			M2camount=teacherResultDao.getTeacherResult6M_2(map);
			M3camount=teacherResultDao.getTeacherResult6M_3(map);
			M4camount=teacherResultDao.getTeacherResult6M_4(map);
			M5camount=teacherResultDao.getTeacherResult6M_5(map);
			M6camount=teacherResultDao.getTeacherResult6M_6(map);
			
			if(M1camount==null) {M1camount=0;}
			if(M2camount==null) {M2camount=0;}
			if(M3camount==null) {M3camount=0;}
			if(M4camount==null) {M4camount=0;}
			if(M5camount==null) {M5camount=0;}
			if(M6camount==null) {M6camount=0;}
			jsonChartData="{chart:{data:["+M1camount+","+M2camount+","+M3camount+","+M4camount+","+M5camount+","+M6camount+"],labels:["+df.format(calM1.getTime())+","+df.format(calM2.getTime())+","+df.format(calM3.getTime())+","+df.format(calM4.getTime())+","+df.format(calM5.getTime())+","+df.format(calM6.getTime())+"]}}";
		}else if(sort==12) {
			M1camount=teacherResultDao.getTeacherResult12M_2(map);
			M2camount=teacherResultDao.getTeacherResult12M_4(map);
			M3camount=teacherResultDao.getTeacherResult12M_6(map);
			M4camount=teacherResultDao.getTeacherResult12M_8(map);
			M5camount=teacherResultDao.getTeacherResult12M_10(map);
			M6camount=teacherResultDao.getTeacherResult12M_12(map);

			if(M1camount==null) {M1camount=0;}
			if(M2camount==null) {M2camount=0;}
			if(M3camount==null) {M3camount=0;}
			if(M4camount==null) {M4camount=0;}
			if(M5camount==null) {M5camount=0;}
			if(M6camount==null) {M6camount=0;}
			jsonChartData="{chart:{data:["+M1camount+","+M2camount+","+M3camount+","+M4camount+","+M5camount+","+M6camount+"],labels:["+df.format(calY2.getTime())+","+df.format(calY4.getTime())+","+df.format(calY6.getTime())+","+df.format(calY8.getTime())+","+df.format(calY10.getTime())+","+df.format(calY12.getTime())+"]}}";

		}
		
		return jsonChartData;

	}
	
	
	
	@RequestMapping("/teacherGrade.do")
	public ModelAndView teacherGrade(@RequestParam(value = "midx", defaultValue = "0")int midx) {
		
		Map map=new HashMap();
		map.put("midx", midx);
		
		Integer allResult=teacherResultDao.getTeacherAllResult(map);
		Integer monthResult=teacherResultDao.getTeacherResult6M_1(map);
		
		if(allResult == null) {allResult=0;}
		if(monthResult == null) {monthResult=0;}
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("allResult", allResult);
		mav.addObject("monthResult", monthResult);
		
		return mav;	
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
