package com.justdo.service;

import com.justdo.domain.BoardVO;
import com.justdo.domain.MemberVO;

public interface commonService {
	
	//로그인
	public MemberVO login(MemberVO vo);
	
	//bno로 상세페이지 불러오기
	public BoardVO read(int bno);
	
	//like좋아요
	public int likeBoard(int bno);
	
	//unlike 싫어요
	public int unlikeBoard(int bno);
	
	//회원가입 
	public void join(MemberVO vo);
	
	//아이디 중복체크
	public boolean isUniqueID(String userid);
	
	//닉네임 중복체크
	public boolean isUniqueNickName(String nickname);

}
