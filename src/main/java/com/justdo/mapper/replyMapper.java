package com.justdo.mapper;

import java.util.List;

import com.justdo.domain.ReplyVO;

public interface replyMapper {

	//insert
	public int insertReply(ReplyVO vo);

	//select
	public List<ReplyVO> getReplyList(int bno);
}