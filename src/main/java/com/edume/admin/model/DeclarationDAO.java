package com.edume.admin.model;

import java.util.List;

public interface DeclarationDAO {
	//리뷰 신고 글 전체 리스트 보기
	public List DeclarationAllList();
	
	 //관리자페이지-리뷰신고/ 확인 안된  status=0 기준으로 리스트 조회
	 public List reviewDeclaration_CheckedinformationList(); 
	 //관리자페이지-리뷰신고/ 승인된 status=Y 기준으로 리스트 조회
	 public List reviewDeclaration_ApprovedList(); 
	 //관리자페이지-리뷰신고/ 미승인된 status=N 기준으로 리스트 조회
	 public List reviewDeclaration_NotapprovedList(); 
	
	//리뷰 신고 글 본문 보기
	public DeclarationDTO Declaration_Content(int didx);
	
	//신고 승인 시 mblack +1 , status =Y 변경
	public int Declaration_approved_mblack(int mblack);
	public int Declaration_Declaration_approved_status(int didx);
	
	//신고 미승인 시  status =N 변경
	public int Declaration_Notapproved_status(int didx);
}
