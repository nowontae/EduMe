package com.edume.admin.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class DeclarationDAOImple implements DeclarationDAO {

	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	//리뷰 신고 글 전체 리스트 보기
	@Override
	public List DeclarationAllList() {
		List arr=sqlMap.selectList("DeclarationAllList");
		return arr;
	}
	 //관리자페이지-리뷰신고/ 확인 안 된 status=0 기준으로 리스트 조회
	@Override
	public List reviewDeclaration_CheckedinformationList() {
		List arr=sqlMap.selectList("reviewDeclaration_CheckedinformationList");
		return arr;
	}
	//관리자페이지-리뷰신고/ 승인된 status=Y 기준으로 리스트 조회
	@Override
	public List reviewDeclaration_ApprovedList() {
		List arr=sqlMap.selectList("reviewDeclaration_ApprovedList");
		return arr;
	}
	//관리자페이지-리뷰신고/ 미승인된 status=N 기준으로 리스트 조회
	@Override
	public List reviewDeclaration_NotapprovedList() {
		List arr=sqlMap.selectList("reviewDeclaration_NotapprovedList");
		return arr;
	}
	
	
	////리뷰 신고 글 본문 보기
	@Override
	public DeclarationDTO Declaration_Content(int didx) {
		DeclarationDTO dto=sqlMap.selectOne("Declaration_Content",didx);
		return dto;
	}
	//리뷰 신고 승인 시 mblack 변경 
	@Override
	public int Declaration_approved_mblack(int mblack) {
		int count = sqlMap.update("Declaration_approved_mblack",mblack);
		return count;
	}
	//리뷰 신고 승인 시  status 변경
	@Override
	public int Declaration_Declaration_approved_status(int didx) {
		int count = sqlMap.update("Declaration_approved_status",didx);
		return count;
	}
	//리뷰 신고 미승인 시  status 변경
	@Override
	public int Declaration_Notapproved_status(int didx) {
		int count=sqlMap.update("Declaration_Notapproved_status",didx);
		return count;
	}
	
}
