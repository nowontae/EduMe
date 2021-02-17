package com.edume.createLectureCurriculum.model;

import java.util.List;

public class CreateLectureCurriculumDTO {

		private int lidx;
		private int lcsection;
		private int lcpart;
		private String lctitle;
		private String lcvideo;
		private String lcsample;
		private List<CreateLectureCurriculumDTO> list;
		
		public CreateLectureCurriculumDTO() {
			super();
		}

		public CreateLectureCurriculumDTO(int lidx, int lcsection, int lcpart, String lctitle, String lcvideo,
				String lcsample, List<CreateLectureCurriculumDTO> list) {
			super();
			this.lidx = lidx;
			this.lcsection = lcsection;
			this.lcpart = lcpart;
			this.lctitle = lctitle;
			this.lcvideo = lcvideo;
			this.lcsample = lcsample;
			this.list = list;
		}

		public int getLidx() {
			return lidx;
		}

		public void setLidx(int lidx) {
			this.lidx = lidx;
		}

		public int getLcsection() {
			return lcsection;
		}

		public void setLcsection(int lcsection) {
			this.lcsection = lcsection;
		}

		public int getLcpart() {
			return lcpart;
		}

		public void setLcpart(int lcpart) {
			this.lcpart = lcpart;
		}

		public String getLctitle() {
			return lctitle;
		}

		public void setLctitle(String lctitle) {
			this.lctitle = lctitle;
		}

		public String getLcvideo() {
			return lcvideo;
		}

		public void setLcvideo(String lcvideo) {
			this.lcvideo = lcvideo;
		}

		public String getLcsample() {
			return lcsample;
		}

		public void setLcsample(String lcsample) {
			this.lcsample = lcsample;
		}

		public List<CreateLectureCurriculumDTO> getList() {
			return list;
		}

		public void setList(List<CreateLectureCurriculumDTO> list) {
			this.list = list;
		}
		
}

