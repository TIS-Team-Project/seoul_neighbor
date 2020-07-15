package com.justdo.service;

import com.justdo.domain.MemberVO;

public interface commonService {
	
	//로그인
	public MemberVO login(MemberVO vo);
	
	//회원가입
	public void join(MemberVO vo);
	
	//아이디 중복체크
	public boolean isUniqueID(String userId);
	
	//닉네임 중복체크
	public boolean isUniqueNickName(String nickName);

}
