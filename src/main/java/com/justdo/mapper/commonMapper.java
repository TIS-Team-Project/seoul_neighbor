package com.justdo.mapper;

import com.justdo.domain.BoardVO;
import com.justdo.domain.MemberVO;

public interface commonMapper {

	//로그인
	public MemberVO login(MemberVO vo);
	
	//상세페이지 bno로 데이터 불러오
	public BoardVO selectBoard(int bno);
	

}
