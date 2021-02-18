package com.edume.teacherPaymentRequest.model;

import java.util.*;

public interface TeacherPaymentRequestDAO {
	
	public Integer teacherPaymentCredit(Map map);
	public TeacherPaymentRequestDTO teacherBankInfo(Map map);
	public int paymentInsert(TeacherPaymentRequestDTO dto);
	public List waitPaymentRequest(Map map);
	public List completePaymentRequest(Map map);
}
