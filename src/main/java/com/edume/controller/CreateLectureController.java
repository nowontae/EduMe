package com.edume.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

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

import com.edume.createLecture.model.*;
import com.edume.teacherBoardNotice.model.TeacherBoardNoticeDTO;

@Controller
public class CreateLectureController {
	
	@Autowired
	private CreateLectureDAO createLectureDao;
	
	/*강좌만들기 클릭 시 null값으로 insert*/
	@RequestMapping(value="/createLectureMain.do", method=RequestMethod.GET)
	public ModelAndView createLectureMainForm() {
		int lidx=createLectureDao.createLectureInsert();
	
		ModelAndView mav=new ModelAndView();
		mav.addObject("lidx",lidx);
		mav.setViewName("teacher/createLecture/createLectureMain");
		return mav;
	}
	
	/*강좌만들기 메인페이지 겸 저장+이미지 업로드 기능*/
	@RequestMapping(value="/createLectureSave.do", method=RequestMethod.POST)
	public ModelAndView createLectureMain(
			CreateLectureDTO dto, 
			@RequestParam(value="lidx", defaultValue = "0")int lidx,
			@RequestParam(value="lthumnail1", defaultValue="img/checkbox.svg")MultipartFile lthumnail1,
			HttpServletRequest rs
	) {
		
		System.out.println("하이");
		HttpSession session=rs.getSession();
		String path = session.getServletContext().getRealPath("/")+"img/";
		System.out.println(path);
		
		dto.setLthumnail(lthumnail1.getOriginalFilename());
		copyInto(lthumnail1,path); 
		int result=createLectureDao.createLectureUpdate(dto);
		String msg=result>0? "저장 완료!":"저장 실패!";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("lidx", lidx);
		mav.setViewName("teacher/createLecture/createLectureMsg");
		return mav;
	}
	
	/*저장 후 안에 내용 저장해서 그대로 돌아가기*/
	@RequestMapping(value = "/createLectureUpdate.do", method=RequestMethod.GET)
	public ModelAndView createLectureUpdateForm(@RequestParam(value="lidx", defaultValue = "0")int lidx) {
		Map map=new HashMap();
		map.put("lidx", lidx);
		CreateLectureDTO dto=createLectureDao.createLectureContent(map);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("teacher/createLecture/createLectureUpdate");
		return mav;
	} 
	
	/*저장 후 안에 내용 저장해서 그대로 돌아가기*/
	@RequestMapping(value = "/createLectureUpdate.do", method=RequestMethod.POST)
	public ModelAndView createLectureUpdateSubmit(CreateLectureDTO dto,@RequestParam(value="lidx", defaultValue = "0")int lidx,
			@RequestParam(value="lthumnail1", defaultValue="img/checkbox.svg")MultipartFile lthumnail1,
			HttpServletRequest rs) {
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("teacher/createLecture/createLectureUpdate");
		return mav;
	}
	
	
	/*실제 파일 복사 관련 메서드*/
	 
	private void copyInto(MultipartFile upload,String path) {
		try {
			byte bytes[]=upload.getBytes(); //복사 할 원본
			File outFile=new File(path+upload.getOriginalFilename());//빈 종이(어디에 복사할건지 대상 정의)
			FileOutputStream fos=new FileOutputStream(outFile); //1바이트씩 저장하고,1바이트씩 뽑아옴
			fos.write(bytes); //이게 복사기능
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}	
	
	@RequestMapping("/lectureCurriculum.do")
	public String lectureCurriculum() {
		return "teacher/createLecture/lectureCurriculum";
	}
}	
	

	
	
	/*
	@RequestMapping("/lectureTitle.do")
	public String lectureTitle() {
		return "teacher/createLecture/lectureTitle";
	}
	
	@RequestMapping("/lectureCategory.do")
	public String lectureCategorySave() {
		return "teacher/createLecture/lectureCategory";
	}
	
	@RequestMapping("/lectureStudentInfo.do")
	public String lectureStudentInfoSave() {
		return "teacher/createLecture/lectureStudentInfo";
	}
	
	@RequestMapping("/lectureLadingPage.do")
	public String lectureLadingPage() {
		return "teacher/createLecture/lectureLadingPage";
	}

	@RequestMapping("/lectureCurriculum.do")
	public String lectureCurriculum() {
		return "teacher/createLecture/lectureCurriculum";
	}

	@RequestMapping("/lecturePrice.do")
	public String lecturePrice() {
		return "teacher/createLecture/lecturePrice";
	}
	*/

