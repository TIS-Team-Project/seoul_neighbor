package com.justdo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.justdo.domain.MemberVO;
import com.justdo.domain.MessageVO;

public interface myPageMapper {

	//유저 검색
	public MemberVO selectUser(String id);
	
	//유저 정보 수정
	public void updateUser(MemberVO vo);
	
	//원래 파일 이름 가져오기
	public String getOriginalFileName(String userid);
	
	//비밀번호 변경
	public void updatePassword(MemberVO vo);
	
	//쪽지함 리스트 가져오기
	public List<MessageVO> selectMessageList(@Param("userid") String userid,@Param("pageNum") int pageNum);
	
	//쪽지 총 개수
	public int selectCountMessage(String userid);
}
