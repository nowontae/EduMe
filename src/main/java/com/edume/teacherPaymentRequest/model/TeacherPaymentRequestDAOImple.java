package com.edume.teacherPaymentRequest.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeacherPaymentRequestDAOImple implements TeacherPaymentRequestDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	
	
	public TeacherPaymentRequestDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}



	@Override
	public Integer teacherPaymentCredit(Map map) {
		Integer count=sqlMap.selectOne("teacherPaymentCredit", map);
		return count;
	}
	
	@Override
	public Integer teacherPaymentCredit2(Map map) {
		Integer count=sqlMap.selectOne("teacherPaymentCredit2", map);
		return count;
	}
	
	@Override
	public TeacherPaymentRequestDTO teacherBankInfo(Map map) {
		TeacherPaymentRequestDTO dto=sqlMap.selectOne("teacherBankInfo", map);
		return dto;
	}
	@Override
	public int paymentInsert(TeacherPaymentRequestDTO dto) {
		int count=sqlMap.insert("paymentInsert", dto);
		return count;
	}
	@Override
	public List waitPaymentRequest(Map map) {
		List arr=sqlMap.selectList("waitPaymentRequest", map);
		return arr;
	}
	@Override
	public List completePaymentRequest(Map map) {
		List arr=sqlMap.selectList("completePaymentRequest", map);
		return arr;
	}
}
