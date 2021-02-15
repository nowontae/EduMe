package com.edume.student.model;

import java.util.List;

public interface PurchaseDAO {
	//결제정보 보기
	public List PurchaseUserList();
	public List purchaseHistory(int midx);
	
}
