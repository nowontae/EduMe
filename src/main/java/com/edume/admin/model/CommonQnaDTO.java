package com.edume.admin.model;

import java.util.*;

public class CommonQnaDTO {

	    private int cqidx; 		  //문의 게시물 고유번호
        private int midx;		  //회원 고유번호
        private String lqsubject; //제목
        private String lqcontent; //본문
        private Date lqwritedate; //작성일자
	    private char cqreply;     //답변완료 여부
	    private String mname;	  //->member테이블에서 가져온 이름
	    
	    public CommonQnaDTO() {
			// TODO Auto-generated constructor stub
		}

	    //이름포함
	    public CommonQnaDTO(int cqidx, int midx, String lqsubject, String lqcontent, Date lqwritedate, char cqreply,
				String mname) {
			super();
			this.cqidx = cqidx;
			this.midx = midx;
			this.lqsubject = lqsubject;
			this.lqcontent = lqcontent;
			this.lqwritedate = lqwritedate;
			this.cqreply = cqreply;
			this.mname = mname;
		}
	    
	    //이름없이 
		public CommonQnaDTO(int cqidx, int midx, String lqsubject, String lqcontent, Date lqwritedate, char cqreply) {
			super();
			this.cqidx = cqidx;
			this.midx = midx;
			this.lqsubject = lqsubject;
			this.lqcontent = lqcontent;
			this.lqwritedate = lqwritedate;
			this.cqreply = cqreply;
		}

		

		public int getCqidx() {
			return cqidx;
		}

		public void setCqidx(int cqidx) {
			this.cqidx = cqidx;
		}

		public int getMidx() {
			return midx;
		}

		public void setMidx(int midx) {
			this.midx = midx;
		}

		public String getLqsubject() {
			return lqsubject;
		}

		public void setLqsubject(String lqsubject) {
			this.lqsubject = lqsubject;
		}

		public String getLqcontent() {
			return lqcontent;
		}

		public void setLqcontent(String lqcontent) {
			this.lqcontent = lqcontent;
		}

		public Date getLqwritedate() {
			return lqwritedate;
		}

		public void setLqwritedate(Date lqwritedate) {
			this.lqwritedate = lqwritedate;
		}

		public char getCqreply() {
			return cqreply;
		}

		public void setCqreply(char cqreply) {
			this.cqreply = cqreply;
		}

		public String getMname() {
			return mname;
		}

		public void setMname(String mname) {
			this.mname = mname;
		}
	    
	    
}
