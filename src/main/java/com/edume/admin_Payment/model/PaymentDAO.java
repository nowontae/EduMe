package com.edume.admin_Payment.model;

import java.util.*;

public interface PaymentDAO {

	public List paymentRequestList();
	public Integer memberAllCredit(Map map);
	public int updatePaymentDate(PaymentDTO dto);
	public int creditPaymentInsert(PaymentDTO dto);
	
}
