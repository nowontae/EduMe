package com.edume.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.edume.teacherTestvideo.model.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

@Controller
@EnableWebMvc
public class TeacherTestvideoController {
	
	@Autowired
	private TeacherTestvideoDAO teacherTestvideoDao;
	
	
	//테스트비디오 메인
	@RequestMapping("/teacherTestVideo.do")
	public ModelAndView teacherTestVideoMain(@RequestParam(value = "midx",defaultValue = "0")int midx) {
	
		Map map=new HashMap();
		map.put("midx", midx);
		
		List allList=teacherTestvideoDao.testvideoAll(map);
		List nList=teacherTestvideoDao.testvideoN(map);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("allList", allList);
		mav.addObject("nList", nList);
		
		mav.setViewName("teacher/teacherTestvideo/teacherTestvideoMain");
		
		return mav;
		
	}
	

	
	//테스트동영상 만들기 이동
	@RequestMapping("/makeTestvideo.do")
	public ModelAndView makeTestvideo(@RequestParam(value = "midx",defaultValue = "0")int midx) {
		
		
		
		ModelAndView mav=new ModelAndView();
		
		
		
		mav.addObject("midx", midx);
		mav.setViewName("teacher/teacherTestvideo/teacherTestvideo");
		return mav;
	}
	
	
	
	
	
	@RequestMapping(value="/testVideoUpload.do", method = RequestMethod.POST)
	public ModelAndView testVideoUpload(TeacherTestvideoDTO dto,
			@RequestParam("upload")MultipartFile upload,
			HttpServletRequest rs,
			@RequestParam(value = "midx", defaultValue = "0")int midx) {
		HttpSession session=rs.getSession();
		String path = session.getServletContext().getRealPath("/")+"testvideo/";
		System.out.println(path);
		
		dto.setTvvideopath(upload.getOriginalFilename());
		copyInto(upload, path);
		
		int result=teacherTestvideoDao.testvideoInsert(dto);
		String msg=result>0?"성공":"실패!";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("midx", midx);
		mav.setViewName("teacher/teacherTestvideo/teacherTestvideoMsg");
		
		return mav;
	}
	
	
	
	/*파일 복사 메서드*/
	private void copyInto(MultipartFile upload,String path) {
		try {
			byte bytes[]=upload.getBytes(); //복사 할 원본
			File outFile=new File(path+upload.getOriginalFilename());//빈 종이
			FileOutputStream fos=new FileOutputStream(outFile); //1바이트씩 저장하고,1바이트씩 뽑아옴
			fos.write(bytes); //이게 복사기능
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}	
	
	
}
