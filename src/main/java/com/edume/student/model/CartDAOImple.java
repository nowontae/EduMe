package com.edume.student.model;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class CartDAOImple implements CartDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	
	//내 장바구니 보기
	@Override
	public ArrayList myCartList(int midx) {
		
		
		List arr=sqlMap.selectList("myCartList",midx);
		ArrayList<CartDTO> list = new ArrayList<CartDTO>();
		list.addAll(arr);

		
		System.out.println("list siez = "+list.size());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date now = new Date(System.currentTimeMillis());
		
		int index = 0;
		try {
			for(CartDTO dto : list) {
				System.out.println(dto.getLidx() +"/"+ dto.getLadminstartdiscount() +"/"+ dto.getLadminenddiscount());
				int result1 = now.compareTo(dto.getLadminstartdiscount());
				int result2 = now.compareTo(dto.getLadminenddiscount());
				
				int lastPrice = dto.getLorignprice();
				if(result1 >0 && result2 <0 ) {
					System.out.println("할인 범위 안");
					int admindiscount = (int)(dto.getLorignprice()*dto.getLadmindiscount()*0.01);
					int teacherdiscont = (int)(dto.getLorignprice()*dto.getLteacherdiscount()*0.01);
					lastPrice -= (admindiscount+teacherdiscont);
					System.out.println("최종가 = " + lastPrice);
					
				}
				
				list.get(index).setLlastprice(lastPrice);
				index++;
			}	
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}
	
	
	//장바구니 항목 삭제
	@Override
	public int myCart_delete(int midx, int lidx) {
		Map map=new HashMap();
		map.put("midx", midx);
		map.put("lidx", lidx);
		int count=sqlMap.delete("myCart_delete",map);
		return count;
	}
	//장바구니에 있는지 확인
	@Override
	public int myCartList_Check(int midx, int lidx) {
		Map map=new HashMap();
		map.put("midx", midx);
		map.put("lidx", lidx);
		
		int count=sqlMap.selectOne("myCartList_Check",map);
		return count;
	}
	
	//장바구니 담기
	@Override
	public int addMyCartList(int midx, int lidx) {
		Map map= new HashMap();
		map.put("midx", midx);
		map.put("lidx", lidx);
		int count=sqlMap.insert("addMyCartList",map);
		return count;
	}
	
	// 장바구니에서 구매 -1 (구매 목록 등록) 
	@Override
	public int myCart_PurchaseLecture(int midx, int lidx) {
		//System.out.println("1. 구매목록 등록");
		
		Map map= new HashMap();
		map.put("midx", midx);
		map.put("lidx", lidx);
		int result = sqlMap.insert("purchaseLecture", map);
		//System.out.println("1. 구매목록 등록 끝");
		return result;
	}
	

	// 장바구니에서 구매 -2 (결제내역 등록)
	@Override
	public int myCart_updatePurchase(int midx, int lidx) {
		//System.out.println("2. 결제 내역 등록");
		Map map= new HashMap();
		map.put("midx", midx);
		map.put("lidx", lidx);
		
		//System.out.println("강의 할인 정보 취득");
		CartDTO purchaseInfo = sqlMap.selectOne("purchaseLectureInfo", map);
		PurchaseDTO dto = new PurchaseDTO();
		
		Date now = new Date(System.currentTimeMillis());
	
		int result1 = now.compareTo(purchaseInfo.getLadminstartdiscount());
		int result2 = now.compareTo(purchaseInfo.getLadminenddiscount());
		int result3 = now.compareTo(purchaseInfo.getLteacherstartdiscount());
		int result4 = now.compareTo(purchaseInfo.getLteacherenddiscount());
		
		int lastPrice = purchaseInfo.getLorignprice();
		int tmplastPrice = purchaseInfo.getLorignprice();
		
		//System.out.println("할인 여부 확인 시작");
		// 관리자 할인
		if(result1 >0 && result2 <0 ) {
			//System.out.println("관리자 할인 범위 안");
			int admindiscount = (int)(purchaseInfo.getLorignprice()*purchaseInfo.getLadmindiscount()*0.01);
			int adminIncome = (int)(lastPrice*0.3) - admindiscount;
			dto.setPadminincome(adminIncome);
			tmplastPrice -= admindiscount;
			
		} else {
			int adminIncome = (int)(lastPrice*0.3);
			dto.setPadminincome(adminIncome);
		}

		
		//강사할인
		if(result3 >0 && result4 <0 ) {
			//System.out.println("강사 할인 범위 안");
			int teacherdiscount = (int)(purchaseInfo.getLorignprice()*purchaseInfo.getLteacherdiscount()*0.01);
			int teacherIncome = (int)(lastPrice*0.7) - teacherdiscount;
			dto.setPteacherincome(teacherIncome);
			tmplastPrice -= teacherdiscount;
			
		}else {
			int teacherIncome = (int)(lastPrice*0.7);
			dto.setPteacherincome(teacherIncome);
		}

		
		dto.setPprice(tmplastPrice);
		dto.setLidx(lidx);
		dto.setMidx(midx);
		
		int teacherMidx = purchaseInfo.getMidx();
		map.put("teacherMidx", teacherMidx);
		map.put("dto", dto);
		map.put("ltitle", purchaseInfo.getLtitle()+"판매");

		
		//System.out.println("나의 강의 목록 등록 시작");
		int result = sqlMap.insert("updatePurchase", dto);  // result=1

		//System.out.println("강사 크레딧 추가 시작");
		result += sqlMap.update("updateUserCredit", map); //result=2

		
		//System.out.println("크레딧 히스토리 추가");
		result += sqlMap.insert("updateCreditHistory", map); //result=3
		
		
		return result;
	}
	
	// 장바구니에서 구매 -3 (장바구니 삭제 )
	// 위에 delete 사용
	
	// 장바구니에서 구매 -4 (크레딧 등록)
	@Override
	public int myCart_updateCredit(int midx, int lidx) {
		// TODO Auto-generated method stub
		return 0;
	}
}
