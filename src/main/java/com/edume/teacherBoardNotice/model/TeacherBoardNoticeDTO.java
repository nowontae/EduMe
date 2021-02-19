package com.edume.teacherBoardNotice.model;

import java.util.Date;

public class TeacherBoardNoticeDTO {
				
		/*공지 관련*/
		private int nidx;
		private int midx;
		private int lidx;
		private String ltitle;
		private String nsubject;
		private String ncontent;
		private String nimg;
		private Date nwritedate;
				
		public TeacherBoardNoticeDTO() {
			super();
		}

		public TeacherBoardNoticeDTO(int nidx, int midx, int lidx, String nsubject, String ncontent, String nimg,
				Date nwritedate) {
			super();
			this.nidx = nidx;
			this.midx = midx;
			this.lidx = lidx;
			this.nsubject = nsubject;
			this.ncontent = ncontent;
			this.nimg = nimg;
			this.nwritedate = nwritedate;
		}

		public int getNidx() {
			return nidx;
		}

		public void setNidx(int nidx) {
			this.nidx = nidx;
		}

		public int getMidx() {
			return midx;
		}

		public void setMidx(int midx) {
			this.midx = midx;
		}

		public int getLidx() {
			return lidx;
		}

		public void setLidx(int lidx) {
			this.lidx = lidx;
		}

		public String getNsubject() {
			return nsubject;
		}

		public void setNsubject(String nsubject) {
			this.nsubject = nsubject;
		}

		public String getNcontent() {
			return ncontent;
		}

		public void setNcontent(String ncontent) {
			this.ncontent = ncontent;
		}

		public String getNimg() {
			return nimg;
		}

		public void setNimg(String nimg) {
			this.nimg = nimg;
		}

		public Date getNwritedate() {
			return nwritedate;
		}

		public void setNwritedate(Date nwritedate) {
			this.nwritedate = nwritedate;
		}

		public String getLtitle() {
			return ltitle;
		}

		public void setLtitle(String ltitle) {
			this.ltitle = ltitle;
		}
		
				
	}
