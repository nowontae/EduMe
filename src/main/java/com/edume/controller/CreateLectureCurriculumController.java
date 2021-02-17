package com.edume.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.edume.createLecture.model.CreateLectureDTO;
import com.edume.createLectureCurriculum.model.CreateLectureCurriculumDAO;
import com.edume.createLectureCurriculum.model.CreateLectureCurriculumDTO;

@Controller
public class CreateLectureCurriculumController {

	@Autowired
	private CreateLectureCurriculumDAO createLectureCurriculumDao;
	
	@RequestMapping("/lectureCurriculum.do")
	public ModelAndView createLectureCurriculumForm(@RequestParam(value="lidx")int lidx) {
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("lidx", lidx);
		mav.setViewName("teacher/createLecture/lectureCurriculum");
		return mav;
	}
	
	/*커리큘럼 동영상 저장 + 제출기능*/
	@ResponseBody
	@RequestMapping(value="/lectureCurriculumSubmit.do", method=RequestMethod.POST)
	public ModelAndView lectureCurriculumSubmit(@RequestParam(value="lidx")int lidx,
			HttpServletRequest rs, MultipartHttpServletRequest mhsr) {
		// lidx 
		// 1) lecture_fake DB에서 lidx를 가지고 조회
		// 2) 가져온 임시저장 데이터를 가지고 본 DB에 insert
		// 3) 본 DB lidx 가져오기
		// 4) 본 DB curriculum Table에 쑤셔넣기
		
		CreateLectureDTO dto= createLectureCurriculumDao.createLectureAll(lidx);
		int result1=createLectureCurriculumDao.createLectureInsert(dto);
		int resultLidx=createLectureCurriculumDao.createLectureInsert(dto);
		
		
		CreateLectureCurriculumDTO dto1 = new CreateLectureCurriculumDTO();
		
		//section이 몇개인지
		String lcsection[] = rs.getParameterValues("lcsection");
		
		ArrayList<ArrayList<String>> lctitle = new ArrayList<ArrayList<String>>();
		ArrayList<ArrayList<MultipartFile>> lcvideo = new ArrayList<ArrayList<MultipartFile>>();
		
		for(int i=0; i < lcsection.length; i++) {
			String title = "lctitle"+(i+1);
			String tmpTitle[] = rs.getParameterValues(title);
			ArrayList<String> arrTmpTitle = new ArrayList<String>(Arrays.asList(tmpTitle));
			lctitle.add(arrTmpTitle);
			
		
			String video = "lcvideo"+(i+1);
			List<MultipartFile> tmpVideo = mhsr.getFiles(video);
			MultipartFile[] arrTmpVideo = new MultipartFile[tmpVideo.size()];
			arrTmpVideo =	tmpVideo.toArray(arrTmpVideo);
			ArrayList<MultipartFile> arrListTmpVideo = new ArrayList<MultipartFile>(Arrays.asList(arrTmpVideo));
			lcvideo.add(arrListTmpVideo);
		}
		int result=0;
		int checkResultCount=0;
		HttpSession session=rs.getSession();
		String path = session.getServletContext().getRealPath("/")+"video/";
		//section 갯수만큼
		for(int i=0; i< lctitle.size(); i++) {
			
			
			//part 갯수만큼
			for(int j=0; j < lctitle.get(i).size(); j++) {
				dto1.setLidx(resultLidx);
				dto1.setLcsection(i+1);
				dto1.setLcpart(j);
				dto1.setLctitle(lctitle.get(i).get(j));
				dto1.setLcvideo("section");
				dto1.setLcsample("N");
				//System.out.print("section = "+i+"/ part = "+j+" / title= "+lctitle.get(i).get(j));
				if(j>0) {
					dto1.setLcvideo(lcvideo.get(i).get(j-1).getOriginalFilename());
					copyInto(lcvideo.get(i).get(j-1),path); 
					//System.out.print("/ video = "+lcvideo.get(i).get(j-1).getOriginalFilename());
				}
				//System.out.println();
				result+=createLectureCurriculumDao.lectureCurriculumSubmit(dto1);
				checkResultCount++;
			}
			
			
		}
		
		
		
		
		
		
		String msg=result==checkResultCount? "제출 완료!":"제출 실패!";
	
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		//mav.addObject("lcvideo1", lcvideo1);
		mav.setViewName("teacher/createLecture/lectureCurriMsg");
		return mav;
	
	}
	
	
//	/*커리큘럼 동영상 저장 + 제출기능*/
//	@ResponseBody
//	@RequestMapping(value="/lectureCurriculumSubmit.do", method=RequestMethod.POST,
//			consumes = MediaType.APPLICATION_JSON_VALUE, headers = {"Accept=application/json"})
//	public ModelAndView lectureCurriculumSubmit(@RequestBody CreateLectureCurriculumDTO dto,
//			MultipartFile lcvideo1, 
//			HttpServletRequest rs) {
//		
//		System.out.println("ㅎㅇ");
//		HttpSession session=rs.getSession();
//		String path = session.getServletContext().getRealPath("/")+"video/";
//		System.out.println(path);
//		
//		System.out.println("ㅎㅇ2");
//		dto.setLcvideo(lcvideo1.getOriginalFilename());
//		copyInto(lcvideo1,path); 
//		int result=createLectureCurriculumDao.lectureCurriculumSubmit();
//		String msg=result>0? "제출 완료!":"제출 실패!";
//		
//		System.out.println("ㅎㅇ3");
//		ModelAndView mav=new ModelAndView();
//		mav.addObject("msg", msg);
//		mav.addObject("lcvideo1", lcvideo1);
//		mav.setViewName("teacher/createLecture/lectureCurriMsg");
//		return mav;
//	
//	}
	
	
	
	
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