package com.justdo.mapper;

import com.justdo.domain.MemberVO;

public interface commonMapper {

	//로그인
	public MemberVO login(MemberVO vo);
	
	// tbl_member에 insert
	public void insertUser(MemberVO vo);
	
	//중복된 아이디가 있는지 체크
	public int checkID(String userId);
	
	//중복된 닉네임이 있는지 체크
	public int checkNickName(String nickName);
}
