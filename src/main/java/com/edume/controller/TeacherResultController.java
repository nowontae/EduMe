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
			jsonChartData="{chart:{data:["+M1camount+","+M2camount+","+M3camount+","+M4camount+"],labels:['1주전','1~2주전','2~3주전','3~4주전']}}";
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
			jsonChartData="{chart:{data:["+M1camount+","+M2camount+","+M3camount+","+M4camount+","+M5camount+","+M6camount+"],labels:['1달전','1~2달전','2~3달전','3~4달전','4~5달전','5~6달전']}}";
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
			jsonChartData="{chart:{data:["+M1camount+","+M2camount+","+M3camount+","+M4camount+","+M5camount+","+M6camount+"],labels:['1~2달전','2~4달전','4~6달전','6~8달전','8~10달전','10~12달전']}}";

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
