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
	public List memberIdxAllList() {

		List arr=sqlMap.selectList("memberIdxAllList");
		//int cnt = sqlMap.selectOne("totalCnt");

		return arr;
	}

}
 