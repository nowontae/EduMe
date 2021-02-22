package com.edume.admin.model;

import java.util.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.edume.admin.model.MemberDTO;



//@Service
public class MemberDAOImple implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
//	
//	public MemberDAOImple() {
//		super();
//	}
//	
//	
//	//생성자주입방식
//	public MemberDAOImple(SqlSessionTemplate sqlMap) {
//		super();
//		this.sqlMap = sqlMap;
//	}
//	
	
	/*관리자페이지-유저 전체 조회*/
	@Override
	public List memberIdxAllList(int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		
		List arr=sqlMap.selectList("memberIdxAllList",map);
		return arr;
	}

	/*관리자페이지-유저 전체 조회 내 검색기능*/
	@Override
	public List memberInfoList(Map<String, String> map) {
		List arr=sqlMap.selectList("findLists",map);
		return arr;
	}
	/*유저 정보  조회*/
	@Override
	public MemberDTO memberInfo(int midx) {
		MemberDTO dto=sqlMap.selectOne("memberInfo",midx);
		return dto;
	}
	//총게시물수
	@Override
	public int member_TotalCnt() {
		int count=sqlMap.selectOne("member_TotalCnt");
		return count==0?1:count;
	}
	
	//블랙리스트 전체 내역 
	@Override
	public List member_blackList() {
		List arr=sqlMap.selectList("member_blackList");
		return arr;
	}
	//블랙리스트 해제
	@Override
	public int Unblacklist(int midx) {
		int count=sqlMap.update("Unblacklist",midx);
		return count;
	}
	
	//login
	@Override
	public MemberDTO memberLogin(String mid,String mpwd) {

		Map map = new HashMap();
		map.put("mid", mid);
		map.put("mpwd", mpwd);
		MemberDTO dtoResult=sqlMap.selectOne("login",map);
		return dtoResult;
	}
}
 