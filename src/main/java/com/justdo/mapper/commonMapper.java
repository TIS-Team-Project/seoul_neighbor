package com.justdo.mapper;

import com.justdo.domain.BoardVO;
import com.justdo.domain.MemberVO;

public interface commonMapper {

	//로그인
	public MemberVO login(MemberVO vo);
	
	//상세페이지 bno로 데이터 불러오
	public BoardVO selectBoard(int bno);
	
	// tbl_member에 insert
	public void insertUser(MemberVO vo);
	
	// tbl_member_auth에 권한 추가
	public void insertUserAuth(String userid);
	
	//중복된 아이디가 있는지 체크
	public int checkID(String userid);
	
	//중복된 닉네임이 있는지 체크
	public int checkNickName(String nickname);
	
	//중복된 이메일이 있는지 체크
	public int checkEmail(String email);
	
}
