package com.justdo.mapper;

import com.justdo.domain.BoardVO;
import com.justdo.domain.MemberVO;

public interface commonMapper {

	//로그인
	public MemberVO login(MemberVO vo);
	
	//상세페이지 bno로 데이터 불러오
	public BoardVO selectBoard(int bno);
	
	//해당 게시글 상세피이지 들어갈때 조회수 ++
	public int  plusCount(int bno);
}
