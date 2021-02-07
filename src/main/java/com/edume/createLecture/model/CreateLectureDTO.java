package com.edume.createLecture.model;

import java.util.Date;

public class CreateLectureDTO {
	
		private int lidx;
		private int midx;
		private String ltitle;
		private String lsubtitle;
		private int llevel;
		private String lthumnail;
		private String lsummary;
		private String lpurpose;
		private String ltarget;
		private String lknowledge;
		private int cat1_idx;
		private int cat2_idx;
		private int cat3_idx;
		private Date lwritedate;
		private String lopen;
		
		public CreateLectureDTO() {
			super();
		}

		public CreateLectureDTO(int lidx, int midx, String ltitle, String lsubtitle, int llevel, String lthumnail,
				String lsummary, String lpurpose, String ltarget, String lknowledge, int cat1_idx, int cat2_idx,
				int cat3_idx, Date lwritedate, String lopen) {
			super();
			this.lidx = lidx;
			this.midx = midx;
			this.ltitle = ltitle;
			this.lsubtitle = lsubtitle;
			this.llevel = llevel;
			this.lthumnail = lthumnail;
			this.lsummary = lsummary;
			this.lpurpose = lpurpose;
			this.ltarget = ltarget;
			this.lknowledge = lknowledge;
			this.cat1_idx = cat1_idx;
			this.cat2_idx = cat2_idx;
			this.cat3_idx = cat3_idx;
			this.lwritedate = lwritedate;
			this.lopen = lopen;
		}

		public int getLidx() {
			return lidx;
		}

		public void setLidx(int lidx) {
			this.lidx = lidx;
		}

		public int getMidx() {
			return midx;
		}

		public void setMidx(int midx) {
			this.midx = midx;
		}

		public String getLtitle() {
			return ltitle;
		}

		public void setLtitle(String ltitle) {
			this.ltitle = ltitle;
		}

		public String getLsubtitle() {
			return lsubtitle;
		}

		public void setLsubtitle(String lsubtitle) {
			this.lsubtitle = lsubtitle;
		}

		public int getLlevel() {
			return llevel;
		}

		public void setLlevel(int llevel) {
			this.llevel = llevel;
		}

		public String getLthumnail() {
			return lthumnail;
		}

		public void setLthumnail(String lthumnail) {
			this.lthumnail = lthumnail;
		}

		public String getLsummary() {
			return lsummary;
		}

		public void setLsummary(String lsummary) {
			this.lsummary = lsummary;
		}

		public String getLpurpose() {
			return lpurpose;
		}

		public void setLpurpose(String lpurpose) {
			this.lpurpose = lpurpose;
		}

		public String getLtarget() {
			return ltarget;
		}

		public void setLtarget(String ltarget) {
			this.ltarget = ltarget;
		}

		public String getLknowledge() {
			return lknowledge;
		}

		public void setLknowledge(String lknowledge) {
			this.lknowledge = lknowledge;
		}

		public int getCat1_idx() {
			return cat1_idx;
		}

		public void setCat1_idx(int cat1_idx) {
			this.cat1_idx = cat1_idx;
		}

		public int getCat2_idx() {
			return cat2_idx;
		}

		public void setCat2_idx(int cat2_idx) {
			this.cat2_idx = cat2_idx;
		}

		public int getCat3_idx() {
			return cat3_idx;
		}

		public void setCat3_idx(int cat3_idx) {
			this.cat3_idx = cat3_idx;
		}

		public Date getLwritedate() {
			return lwritedate;
		}

		public void setLwritedate(Date lwritedate) {
			this.lwritedate = lwritedate;
		}

		public String getLopen() {
			return lopen;
		}

		public void setLopen(String lopen) {
			this.lopen = lopen;
		}
}
