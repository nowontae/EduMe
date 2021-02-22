package com.edume.admin.model;

import java.util.*;

public interface MemberDAO {
	//전체 유저 리스트 
	public List memberIdxAllList(int cp, int ls);
	
	//전체유저리스트에서 검색하기
	public List memberInfoList(Map<String, String> map);
	
	//유저 정보  조회
	public MemberDTO memberInfo(int midx);
	
	//총 게시물수 
	public int member_TotalCnt();
	
	//블랙리스트 전체 내역
	public List member_blackList();
	
	//블랙리스트 해제
	public int Unblacklist(int midx);
	
	//login
	public MemberDTO memberLogin(String mid,String mpwd);
}
