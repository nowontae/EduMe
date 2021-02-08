package com.edume.admin.model;

import java.util.*;

public interface CommonQna_ReplyDAO {
	
	//댓글쓰기
	public int ReplyWrite(CommonQna_ReplyDTO dto);
	//댓글보기
	public List ReplyList(int cqidx);
	//댓글 수정
	public CommonQna_ReplyDTO Qna_ReplyUpdateForm(int cqreply_idx);
	public int ReplyUpdate(Map map);
	//댓글 삭제
	public int ReplyDelete(int cqreply_idx);
}
