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

import com.edume.admin.model.Category1DAO;
import com.edume.admin.model.Category2DAO;
import com.edume.admin.model.Category3DAO;
import com.edume.createLecture.model.*;
import com.edume.teacherBoardNotice.model.TeacherBoardNoticeDTO;

@Controller
public class CreateLectureController {
	@Autowired
	private Category1DAO category1Dao;
	@Autowired
	private Category2DAO category2Dao;
	@Autowired
	private Category3DAO category3Dao;
	@Autowired
	private CreateLectureDAO createLectureDao;
	
	/*강좌만들기 클릭 시 null값으로 insert*/
	@RequestMapping(value="/createLectureMain.do", method=RequestMethod.GET)
	public ModelAndView createLectureMainForm() {
		
		int lidx=createLectureDao.createLectureInsert();
		List cat1_list = category1Dao.Category1List();
    	List cat2_list = category2Dao.Category2AllList();
    	List cat3_list = category3Dao.Category3AllList();
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("lidx",lidx);
		mav.addObject("cat1_list", cat1_list);
		mav.addObject("cat2_list", cat2_list);
		mav.addObject("cat3_list", cat3_list);
		mav.setViewName("teacher/createLecture/createLectureMain");
		return mav;
	}
	
	
	/*강좌만들기 이미지 업로드시 저장해 버리는 AJAX */
	@RequestMapping(value="/createLectureSaveImg.do", method=RequestMethod.POST)
	public ModelAndView createLectureSaveImg(
			CreateLectureDTO dto, 
			@RequestParam(value="lidx", defaultValue = "0")int lidx,
			@RequestParam(value="lthumnail1")MultipartFile lthumnail1,
			HttpServletRequest rs) {
	
		HttpSession session=rs.getSession();
		
		
		//String path = session.getServletContext().getRealPath("/")+"img/";
		//img save
		String path = session.getServletContext().getRealPath("/");
		int tmpPath = session.getServletContext().getRealPath("/").indexOf("\\", 4);
		//path = path.substring(0, tmpPath) + "\\EduMe\\src\\main\\webapp\\img\\";
		//은진 경로
		path = path.substring(0, tmpPath) + "\\FinalProject\\EduMe\\src\\main\\webapp\\img\\";
		
		copyInto(lthumnail1,path);
		
		
		
		//img file name insert to DB
		int result=createLectureDao.createLectureUpdateImg(lthumnail1.getOriginalFilename(), lidx);
		String msg= "{\"lthumnail\":\""+lthumnail1.getOriginalFilename()+"\"}";
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("teacher/createLecture/createLectureSaveImg");
		
		return mav;
	}
	
	/*강좌만들기 메인페이지 겸 저장+이미지 업로드 기능*/
	@RequestMapping(value="/createLectureSave.do", method=RequestMethod.POST)
	public ModelAndView createLectureMain(
			CreateLectureDTO dto, 
			@RequestParam(value="lidx", defaultValue = "0")int lidx,
			@RequestParam(value="type", defaultValue = "save")String type,
			HttpServletRequest rs) {
		System.out.println("-----lecture save start------");
	
		HttpSession session=rs.getSession();
		int midx = Integer.parseInt((String)session.getAttribute("midx"));
		
		int result=createLectureDao.createLectureUpdate(dto);
		String msg=result>0? "저장 완료!":"저장 실패!";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("midx", midx);
		mav.addObject("lidx", lidx);
		
		if(type.equals("next")) {
			System.out.println("next");
			mav.setViewName("teacher/createLecture/lectureCurriculum");
		} else {
			System.out.println("save");
			mav.setViewName("teacher/createLecture/createLectureMsg");
		}
		return mav;
	}
	
	
	
	
	
	/*저장 후 안에 내용 저장해서 그대로 돌아가기*/
	@RequestMapping(value = "/createLectureUpdate.do", method=RequestMethod.GET)
	public ModelAndView createLectureUpdateForm(@RequestParam(value="lidx", defaultValue = "0")int lidx,
			HttpServletRequest rs) {
		Map map=new HashMap();
		map.put("lidx", lidx);
		CreateLectureDTO dto=createLectureDao.createLectureContent(map);
		
		HttpSession session=rs.getSession();
		int midx = Integer.parseInt((String)session.getAttribute("midx"));
		
		List cat1_list = category1Dao.Category1List();
    	List cat2_list = category2Dao.Category2AllList();
    	List cat3_list = category3Dao.Category3AllList();
    	
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("midx", midx);
		mav.addObject("cat1_list", cat1_list);
		mav.addObject("cat2_list", cat2_list);
		mav.addObject("cat3_list", cat3_list);
		mav.setViewName("teacher/createLecture/createLectureUpdate");
		return mav;
	} 
	
	/*저장 후 안에 내용 저장해서 그대로 돌아가기*/
	@RequestMapping(value = "/createLectureUpdate.do", method=RequestMethod.POST)
	public ModelAndView createLectureUpdateSubmit(CreateLectureDTO dto,@RequestParam(value="lidx", defaultValue = "0")int lidx,
			@RequestParam(value="lthumnail1")MultipartFile lthumnail1,
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
			File f = new File(path);
			if(!f.exists()) {
				f.mkdirs();
			}
			
			File outFile=new File(path+upload.getOriginalFilename());//빈 종이(어디에 복사할건지 대상 정의)
			FileOutputStream fos=new FileOutputStream(outFile); //1바이트씩 저장하고,1바이트씩 뽑아옴
			fos.write(bytes); //이게 복사기능
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}	
	
}	
