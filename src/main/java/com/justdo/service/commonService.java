package com.justdo.service;

import com.justdo.domain.MemberVO;

public interface commonService {
	
	//로그인
	public MemberVO login(MemberVO vo);
	
	//회원가입
	public void join(MemberVO vo);

}
