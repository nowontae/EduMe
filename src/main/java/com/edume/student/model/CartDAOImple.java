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
}
