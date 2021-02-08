package com.edume.admin.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class CommonQna_ReplyDAOImple implements CommonQna_ReplyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	//댓글쓰기
	@Override
	public int ReplyWrite(CommonQna_ReplyDTO dto) {
		int count = sqlMap.insert("CommonQnAReplyAdd",dto);
		return count;
	}
	//댓글보기
	@Override
	public List ReplyList(int cqidx) {
		List list=sqlMap.selectList("CommonQnAReplyList",cqidx);
		return list;
	}
	//댓글 수정시 뜨는 폼
	@Override
	public CommonQna_ReplyDTO Qna_ReplyUpdateForm(int cqreply_idx) {
		CommonQna_ReplyDTO dto=sqlMap.selectOne("Qna_ReplyUpdateForm",cqreply_idx);
		return dto;
	}
	//댓글 수정
	@Override
	public int ReplyUpdate(Map map) {

		int count=sqlMap.update("Qna_ReplyUpdate",map);
		return count;
	}
	//댓글 삭제
	@Override
	public int ReplyDelete(int cqreply_idx) {
		int count=sqlMap.delete("Qna_ReplyDelete",cqreply_idx);
		return count;
	}

}
