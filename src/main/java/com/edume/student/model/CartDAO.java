package com.edume.student.model;

import java.util.ArrayList;
import java.util.List;

public interface CartDAO {
	
	//내 장바구니 보기
	public ArrayList myCartList(int midx); 
	
	//장바구니 항목 삭제
	public int myCart_delete(int midx, int lidx);

	//장바구니에 있는지 확인
	public int myCartList_Check(int midx, int lidx);
	
	//장바구니 담기
	public int addMyCartList(int midx, int lidx);
}
