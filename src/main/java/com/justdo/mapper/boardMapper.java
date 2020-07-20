package com.justdo.mapper;

import com.justdo.domain.BoardVO;
import com.justdo.domain.MemberVO;

public interface boardMapper {

	
	
	//like좋아요
	public int like(int bno);
	
	//해당 bno의 좋아요 숫자를 가져옵니다.
    public int selectLikeCount(int bno);
	   
	//unlike 싫어요
	public int unlike(int bno);
	
	//해당 bno의 싫어요 숫자를 가져옵니다.
    public int selectUnlikeCount(int bno);	

    //해당 bno의 board 삭제.
	public int delete(int bno);

}
