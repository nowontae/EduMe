package com.edume.admin_Payment.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.stereotype.Service;


@Service
public class PaymentDAOImple implements PaymentDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	
	public PaymentDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public List paymentRequestList() {
		List arr=sqlMap.selectList("paymentRequest");
		return arr;
	}

	@Override
	public Integer memberAllCredit(Map map) {
		Integer result=sqlMap.selectOne("memberAllCredit", map);
		return result;
	}

	
	
	@Override
	public int updatePaymentDate(PaymentDTO dto) {
		int count=sqlMap.update("updatePaymentDate", dto);
		return count;
	}

	@Override
	public int creditPaymentInsert(PaymentDTO dto) {
		int count=sqlMap.insert("creditPaymentInsert", dto);
		return count;
	}
	
	
}
