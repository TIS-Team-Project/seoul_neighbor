package com.justdo.mapper;

import com.justdo.domain.MemberVO;

public interface commonMapper {

	//로그인
	public MemberVO login(MemberVO vo);
	
	// tbl_member에 insert
	public void insertUser(MemberVO vo);
}
