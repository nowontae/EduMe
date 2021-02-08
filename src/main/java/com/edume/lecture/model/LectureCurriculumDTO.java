package com.edume.lecture.model;

public class LectureCurriculumDTO {

	private int lidx;
	private int lcsection;
	private int lcpart;
	private String lctitle;
	private String lcvideo;
	private String lcsample;
	public LectureCurriculumDTO() {
		super();
	}
	public LectureCurriculumDTO(int lidx, int lcsection, int lcpart, String lctitle, String lcvideo, String lcsample) {
		super();
		this.lidx = lidx;
		this.lcsection = lcsection;
		this.lcpart = lcpart;
		this.lctitle = lctitle;
		this.lcvideo = lcvideo;
		this.lcsample = lcsample;
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
	
	
	
	
}
