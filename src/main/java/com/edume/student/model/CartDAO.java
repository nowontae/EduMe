package com.edume.student.model;

import java.util.List;

public interface CartDAO {
	
	//내 장바구니 보기
	public List myCartList(int midx); 
	
	//장바구니 항목 삭제
	public int myCart_delete(int midx, int lidx);

}
